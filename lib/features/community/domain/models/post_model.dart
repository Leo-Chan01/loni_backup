enum PostType {
  text,
  bookReview,
  bookRecommendation,
  discussion,
  poll,
}

class AttachedBook {
  final String bookId;
  final String title;
  final String author;
  final String? coverUrl;
  final double? rating;

  const AttachedBook({
    required this.bookId,
    required this.title,
    required this.author,
    this.coverUrl,
    this.rating,
  });
}

class Post {
  final String id;
  final String userId;
  final String userFullName;
  final String username;
  final String? userAvatarUrl;
  final String content;
  final PostType type;
  final AttachedBook? attachedBook;
  final List<String>? photoUrls;
  final int likesCount;
  final int commentsCount;
  final bool isLikedByCurrentUser;
  final bool isBookmarkedByCurrentUser;
  final DateTime createdAt;

  const Post({
    required this.id,
    required this.userId,
    required this.userFullName,
    required this.username,
    this.userAvatarUrl,
    required this.content,
    required this.type,
    this.attachedBook,
    this.photoUrls,
    required this.likesCount,
    required this.commentsCount,
    this.isLikedByCurrentUser = false,
    this.isBookmarkedByCurrentUser = false,
    required this.createdAt,
  });
}
