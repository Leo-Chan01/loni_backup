import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/features/reading/domain/models/reader_settings_model.dart';
import 'package:loni_africa/features/reading/presentation/widgets/reader_bottom_controls.dart';
import 'package:loni_africa/features/reading/presentation/widgets/reader_progress_bar.dart';

class ReaderScreen extends StatefulWidget {
  final String bookId;

  const ReaderScreen({super.key, required this.bookId});

  static const String path = '/reader/:bookId';
  static const String name = 'ReaderScreen';

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  ReaderSettingsModel _settings = const ReaderSettingsModel();
  final double _progress = 0.42;

  // Mock content
  final List<String> _content = const [
    'He was tall and huge, and his bushy eyebrows and wide nose gave him a very severe look. He breathed heavily, and it was said that, when he slept, his wives and children in their houses could hear him breathe. When he walked, his heels hardly touched the ground and he seemed to walk on springs, as if he was going to pounce on somebody.',
    'And he did pounce on people quite often. He had a slight stammer and whenever he was angry and could not get his words out quickly enough, he would use his fists. He had no patience with unsuccessful men. He had had no patience with his father.',
    'Unoka, for that was his father\'s name, had died ten years ago. In his day he was lazy and improvident and was quite incapable of thinking about tomorrow. If any money came his way, and it seldom did, he immediately bought gourds of palm-wine, called round his neighbors and made merry.',
    'He always said that whenever he saw a dead man\'s mouth he saw the folly of not eating what one had in one\'s lifetime. Unoka was, of course, a debtor, and he owed every neighbor some money, from a few cowries to quite substantial amounts.',
    'He was tall but very thin and had a slight stoop. He wore a haggard and mournful look except when he was drinking or playing on his flute. He was very good on his flute, and his happiest moments were the two or three moons after the harvest when the village musicians brought down their instruments, hung above the fireplace.',
  ];

  Color get _backgroundColor {
    switch (_settings.theme) {
      case ReaderTheme.dark:
        return const Color(0xFF0B0B0C);
      case ReaderTheme.light:
        return Colors.white;
      case ReaderTheme.sepia:
        return const Color(0xFFF4ECD8);
    }
  }

  Color get _textColor {
    switch (_settings.theme) {
      case ReaderTheme.dark:
        return const Color(0xFFA1A1AA);
      case ReaderTheme.light:
        return Colors.grey[900]!;
      case ReaderTheme.sepia:
        return Colors.grey[800]!;
    }
  }

  void _handleContents() {
    context.push('/table-of-contents/${widget.bookId}');
  }

  void _handleBookmark() {
    // Implement bookmark logic
  }

  void _handleHighlight() {
    // Implement highlight logic
  }

  void _handleSettings() {
    context.push('/reader-settings/${widget.bookId}');
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isDark = _settings.theme == ReaderTheme.dark;

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Minimal Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF161618).withValues(alpha: 0.95)
                    : Colors.white.withValues(alpha: 0.95),
                border: Border(
                  bottom: BorderSide(
                    color: isDark
                        ? Colors.grey.withValues(alpha: 0.2)
                        : Colors.grey.withValues(alpha: 0.2),
                  ),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Icon(
                      Icons.arrow_back,
                      color: _textColor,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(child: ReaderProgressBar(progress: _progress)),
                  SizedBox(width: 12.w),
                  Text(
                    '${(_progress * 100).toInt()}%',
                    style: textTheme.bodySmall?.copyWith(
                      color: _textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Reading Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _content
                      .map(
                        (paragraph) => Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Text(
                            paragraph,
                            style: TextStyle(
                              color: _textColor,
                              fontFamily:
                                  _settings.fontFamily == ReaderFont.serif
                                  ? 'Merriweather'
                                  : null,
                              fontSize: _settings.fontSize.sp,
                              height: _settings.lineSpacing,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),

            // Bottom Controls
            ReaderBottomControls(
              onContentsPressed: _handleContents,
              onBookmarkPressed: _handleBookmark,
              onHighlightPressed: _handleHighlight,
              onSettingsPressed: _handleSettings,
              isDark: isDark,
            ),
          ],
        ),
      ),
    );
  }
}
