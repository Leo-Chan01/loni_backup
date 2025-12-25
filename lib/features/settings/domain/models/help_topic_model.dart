class HelpTopic {
  final String id;
  final String title;
  final String iconName;
  final String? description;

  const HelpTopic({
    required this.id,
    required this.title,
    required this.iconName,
    this.description,
  });
}
