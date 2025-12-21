enum ReaderTheme { dark, light, sepia }

enum ReaderFont { serif, sansSerif }

class ReaderSettingsModel {
  final double fontSize;
  final ReaderTheme theme;
  final ReaderFont fontFamily;
  final double lineSpacing;
  final bool autoScroll;

  const ReaderSettingsModel({
    this.fontSize = 16.0,
    this.theme = ReaderTheme.dark,
    this.fontFamily = ReaderFont.serif,
    this.lineSpacing = 1.8,
    this.autoScroll = false,
  });

  ReaderSettingsModel copyWith({
    double? fontSize,
    ReaderTheme? theme,
    ReaderFont? fontFamily,
    double? lineSpacing,
    bool? autoScroll,
  }) {
    return ReaderSettingsModel(
      fontSize: fontSize ?? this.fontSize,
      theme: theme ?? this.theme,
      fontFamily: fontFamily ?? this.fontFamily,
      lineSpacing: lineSpacing ?? this.lineSpacing,
      autoScroll: autoScroll ?? this.autoScroll,
    );
  }
}
