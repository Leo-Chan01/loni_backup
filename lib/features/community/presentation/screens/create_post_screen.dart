import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/utilities/localization_extension.dart';
import '../../../community/domain/models/post_model.dart';
import '../widgets/post_option_button.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  static const String path = '/create-post';
  static const String name = 'CreatePostScreen';

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _postController = TextEditingController();
  AttachedBook? _attachedBook;

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  void _attachMockBook() {
    setState(() {
      _attachedBook = const AttachedBook(
        bookId: '1',
        title: 'Things Fall Apart',
        author: 'Chinua Achebe',
        rating: 4.7,
      );
    });
  }

  void _removeBook() {
    setState(() {
      _attachedBook = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: HugeIcon(icon: HugeIcons.strokeRoundedCancel01),
          onPressed: () => context.pop(),
        ),
        title: Text('Create Post'),
        actions: [
          TextButton(
            onPressed: () {
              if (_postController.text.isNotEmpty) {
                context.pop();
              }
            },
            child: Text(
              context.l10n.post,
              style: TextStyle(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundColor: colorScheme.surfaceContainer,
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedUser,
                      size: 20.r,
                      color: colorScheme.onSurface.withValues(alpha: 0.4),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amara Okonkwo',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          '@amara_reads',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TextField(
                controller: _postController,
                decoration: InputDecoration(
                  hintText: context.l10n.whatsOnYourMind,
                  border: InputBorder.none,
                ),
                maxLines: null,
                style: TextStyle(fontSize: 16.sp, height: 1.5),
              ),
            ),
            if (_attachedBook != null) ...[
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainer.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: colorScheme.outline.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 56.w,
                        height: 72.h,
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainer,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Center(
                          child: HugeIcon(
                            icon: HugeIcons.strokeRoundedBook02,
                            size: 28.r,
                            color: colorScheme.onSurface.withValues(alpha: 0.3),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.l10n.attachedBook,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              _attachedBook!.title,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              _attachedBook!.author,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: _removeBook,
                        icon: HugeIcon(
                          icon: HugeIcons.strokeRoundedCancel01,
                          color: colorScheme.error,
                          size: 20.r,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  PostOptionButton(
                    icon: HugeIcons.strokeRoundedBook02,
                    label: context.l10n.attachBook,
                    onTap: _attachMockBook,
                  ),
                  SizedBox(height: 12.h),
                  PostOptionButton(
                    icon: HugeIcons.strokeRoundedImage01,
                    label: context.l10n.addPhotos,
                    onTap: () {},
                  ),
                  SizedBox(height: 12.h),
                  PostOptionButton(
                    icon: HugeIcons.strokeRoundedCheckList,
                    label: context.l10n.createPoll,
                    onTap: () {},
                  ),
                  SizedBox(height: 12.h),
                  PostOptionButton(
                    icon: HugeIcons.strokeRoundedUserMultiple,
                    label: context.l10n.tagBookClub,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
