class UserProfile {
  final String id;
  final String fullName;
  final String username;
  final String? bio;
  final String? email;
  final String? location;
  final String? avatarUrl;
  final String? coverUrl;
  final int booksRead;
  final int followers;
  final int following;
  final List<String> readingPreferences;
  final DateTime joinedDate;

  const UserProfile({
    required this.id,
    required this.fullName,
    required this.username,
    this.bio,
    this.email,
    this.location,
    this.avatarUrl,
    this.coverUrl,
    required this.booksRead,
    required this.followers,
    required this.following,
    this.readingPreferences = const [],
    required this.joinedDate,
  });
}
