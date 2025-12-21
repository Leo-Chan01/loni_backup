import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/utilities/localization_extension.dart';
import '../../../community/domain/models/post_model.dart';
import '../widgets/post_card.dart';
import './create_post_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  static const String path = '/community';
  static const String name = 'CommunityScreen';

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Post> mockPosts = [
    Post(
      id: '1',
      userId: '1',
      userFullName: 'Kwame Mensah',
      username: '@kwame_reads',
      content:
          'Just finished reading "Homegoing" by Yaa Gyasi and I\'m absolutely blown away! The way she traces family lineage through generations is masterful. Highly recommend! 📚✨',
      type: PostType.bookRecommendation,
      attachedBook: const AttachedBook(
        bookId: '1',
        title: 'Homegoing',
        author: 'Yaa Gyasi',
        rating: 4.8,
      ),
      likesCount: 142,
      commentsCount: 23,
      isLikedByCurrentUser: true,
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    Post(
      id: '2',
      userId: '2',
      userFullName: 'Zara Okafor',
      username: '@zara_bookworm',
      content:
          'Currently reading Chimamanda\'s "Half of a Yellow Sun" and I can\'t put it down. The portrayal of the Nigerian Civil War is so vivid and heart-wrenching. Anyone else read this?',
      type: PostType.discussion,
      likesCount: 89,
      commentsCount: 15,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    Post(
      id: '3',
      userId: '3',
      userFullName: 'Amara Okonkwo',
      username: '@amara_reads',
      content:
          'What are your thoughts on contemporary African sci-fi? I just discovered Nnedi Okorafor and I\'m hooked! Her worldbuilding is incredible. Drop your recommendations below! 🚀',
      type: PostType.text,
      likesCount: 67,
      commentsCount: 31,
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.explore),
        bottom: TabBar(
          controller: _tabController,
          labelColor: colorScheme.primary,
          unselectedLabelColor: colorScheme.onSurface.withValues(alpha: 0.6),
          indicatorColor: colorScheme.primary,
          isScrollable: true,
          tabs: [
            Tab(text: context.l10n.forYou),
            Tab(text: context.l10n.following),
            Tab(text: context.l10n.trending),
            Tab(text: context.l10n.bookClubs),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: mockPosts.length,
            itemBuilder: (context, index) {
              return PostCard(post: mockPosts[index]);
            },
          ),
          Center(
            child: Text(
              'Following',
              style: TextStyle(color: colorScheme.onSurface),
            ),
          ),
          Center(
            child: Text(
              'Trending',
              style: TextStyle(color: colorScheme.onSurface),
            ),
          ),
          Center(
            child: Text(
              'Book Clubs',
              style: TextStyle(color: colorScheme.onSurface),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.pushNamed(CreatePostScreen.name),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        icon: HugeIcon(icon: HugeIcons.strokeRoundedAdd01),
        label: Text(context.l10n.post),
      ),
    );
  }
}
