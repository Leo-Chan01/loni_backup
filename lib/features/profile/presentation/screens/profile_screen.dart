import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/auth/data/services/auth_api_service.dart';
import 'package:loni_africa/features/library/data/services/library_api_service.dart';
import 'package:loni_africa/features/library/domain/models/order.dart';
import 'package:loni_africa/features/settings/presentation/screens/settings_screen.dart';

import '../../../profile/domain/models/user_profile_model.dart';
import '../widgets/profile_stats_card.dart';
import './edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String path = '/app/profile';
  static const String name = 'ProfileScreen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final AuthApiService _authApiService;
  late final LibraryApiService _libraryApiService;
  UserProfile? _profile;
  List<OrderItem> _profileBooks = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _authApiService = AuthApiService();
    _libraryApiService = LibraryApiService();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    if (!mounted) return;
    try {
      // Fetch profile data
      final profileData = await _authApiService.getProfile();
      
      // Fetch user's orders (digital books)
      final orders = await _libraryApiService.getOrders();
      
      if (!mounted) return;
      
      // Collect all books from orders
      final books = <OrderItem>[];
      for (final order in orders) {
        books.addAll(order.items);
      }
      
      setState(() {
        _profile = UserProfile(
          id: profileData['id'] as String? ?? '',
          fullName:
              '${profileData['firstName'] as String? ?? ''} ${profileData['lastName'] as String? ?? ''}'
                  .trim(),
          username: '@${(profileData['email'] as String? ?? '').split('@')[0]}',
          bio: '',
          email: profileData['email'] as String? ?? '',
          location: profileData['region'] as String? ?? '',
          avatarUrl: profileData['photoUrl'] as String? ?? '',
          coverUrl: '',
          booksRead: books.length,
          followers: 0,
          following: 0,
          readingPreferences: [],
          joinedDate: DateTime.now(),
        );
        _profileBooks = books;
        _isLoading = false;
        _errorMessage = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load profile data';
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (_isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: colorScheme.primary,
          ),
        ),
      );
    }

    if (_errorMessage != null || _profile == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.profile),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HugeIcon(
                icon: HugeIcons.strokeRoundedAlertCircle,
                size: 48.r,
                color: colorScheme.error,
              ),
              SizedBox(height: 16.h),
              Text(
                _errorMessage ?? 'Failed to load profile',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                    _errorMessage = null;
                  });
                  _loadProfileData();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                ),
                child: Text(context.l10n.retry),
              ),
            ],
          ),
        ),
      );
    }

    final profile = _profile!;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.h,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [colorScheme.primary, colorScheme.secondary],
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedSettings02,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.push(SettingsScreen.path);
                },
              ),
              SizedBox(width: 8.w),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Transform.translate(
                  offset: Offset(0, -50.h),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: colorScheme.surface,
                            width: 4.w,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 50.r,
                          backgroundColor: colorScheme.surface,
                          child: HugeIcon(
                            icon: HugeIcons.strokeRoundedUser,
                            size: 50.r,
                            color: colorScheme.onSurface.withValues(alpha: 0.4),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        profile.fullName,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        profile.username,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      if (profile.bio != null && profile.bio!.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Text(
                            profile.bio!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                      if (profile.bio == null || profile.bio!.isEmpty)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Text(
                            profile.email ?? 'No email',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: colorScheme.onSurface.withValues(alpha: 0.6),
                            ),
                          ),
                        ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: ElevatedButton.icon(
                          onPressed: () =>
                              context.pushNamed(EditProfileScreen.name),
                          icon: HugeIcon(
                            icon: HugeIcons.strokeRoundedEdit02,
                            size: 18.r,
                          ),
                          label: Text(context.l10n.editProfile),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.primary,
                            foregroundColor: colorScheme.onPrimary,
                            minimumSize: Size(double.infinity, 44.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: ProfileStatsCard(
                                label: context.l10n.booksRead(
                                  profile.booksRead,
                                ),
                                value: profile.booksRead.toString(),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: ProfileStatsCard(
                                label: context.l10n.followers,
                                value: profile.followers.toString(),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: ProfileStatsCard(
                                label: context.l10n.following,
                                value: profile.following.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        color: colorScheme.surface,
                        child: TabBar(
                          controller: _tabController,
                          labelColor: colorScheme.primary,
                          unselectedLabelColor: colorScheme.onSurface
                              .withValues(alpha: 0.6),
                          indicatorColor: colorScheme.primary,
                          tabs: [
                            Tab(text: context.l10n.library),
                            Tab(text: context.l10n.reviews('0')),
                            Tab(text: context.l10n.activity),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(24.w),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.65,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                if (_profileBooks.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HugeIcon(
                            icon: HugeIcons.strokeRoundedBook02,
                            size: 40.r,
                            color: colorScheme.onSurface.withValues(
                              alpha: 0.3,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            context.l10n.noBooks,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                
                final book = _profileBooks[index];
                return Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8.r),
                            ),
                          ),
                          child: Center(
                            child: HugeIcon(
                              icon: HugeIcons.strokeRoundedBook02,
                              size: 40.r,
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Order: ${book.id}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }, childCount: _profileBooks.isEmpty ? 1 : _profileBooks.length),
            ),
          ),
        ],
      ),
    );
  }
}
