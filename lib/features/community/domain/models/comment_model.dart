class Comment {
  final String id;
  final String postId;
  final String userId;
  final String userFullName;
  final String username;
  final String? userAvatarUrl;
  final String content;
  final int likesCount;
  final bool isLikedByCurrentUser;
  final DateTime createdAt;
  final String? parentCommentId;
  final List<Comment> replies;

  const Comment({
    required this.id,
    required this.postId,
    required this.userId,
    required this.userFullName,
    required this.username,
    this.userAvatarUrl,
    required this.content,
    required this.likesCount,
    this.isLikedByCurrentUser = false,
    required this.createdAt,
    this.parentCommentId,
    this.replies = const [],
  });

  bool get isReply => parentCommentId != null;
}
