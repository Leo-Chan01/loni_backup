import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../community/domain/models/comment_model.dart';
import '../../../community/domain/models/post_model.dart';
import '../widgets/comment_input.dart';
import '../widgets/comment_item.dart';
import '../widgets/post_card.dart';

class DiscussionScreen extends StatefulWidget {
  final String postId;

  const DiscussionScreen({super.key, required this.postId});

  static const String path = '/discussion/:postId';
  static const String name = 'DiscussionScreen';

  @override
  State<DiscussionScreen> createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  final _commentController = TextEditingController();

  final Post mockPost = Post(
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
  );

  final List<Comment> mockComments = [
    Comment(
      id: '1',
      postId: '1',
      userId: '2',
      userFullName: 'Zara Okafor',
      username: '@zara_bookworm',
      content:
          'I absolutely loved this book too! The dual narrative structure was brilliant.',
      likesCount: 12,
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      replies: [
        Comment(
          id: '2',
          postId: '1',
          userId: '1',
          userFullName: 'Kwame Mensah',
          username: '@kwame_reads',
          content: 'Right? The way she weaves past and present is amazing!',
          likesCount: 5,
          createdAt: DateTime.now().subtract(const Duration(minutes: 45)),
          parentCommentId: '1',
        ),
      ],
    ),
    Comment(
      id: '3',
      postId: '1',
      userId: '3',
      userFullName: 'Amara Okonkwo',
      username: '@amara_reads',
      content:
          'Added to my reading list! I\'ve been meaning to read more Ghanaian authors.',
      likesCount: 8,
      isLikedByCurrentUser: true,
      createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
    ),
    Comment(
      id: '4',
      postId: '1',
      userId: '4',
      userFullName: 'Chidi Nkosi',
      username: '@chidi_lit',
      content:
          'This book changed my perspective on historical fiction. The depth of research is incredible.',
      likesCount: 15,
      createdAt: DateTime.now().subtract(const Duration(minutes: 15)),
    ),
  ];

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01),
          onPressed: () => context.pop(),
        ),
        title: const Text('Discussion'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                PostCard(post: mockPost),
                SizedBox(height: 24.h),
                ...mockComments.map((comment) => CommentItem(comment: comment)),
              ],
            ),
          ),
          CommentInput(
            controller: _commentController,
            onSend: () {
              if (_commentController.text.isNotEmpty) {
                _commentController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
