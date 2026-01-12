import 'package:loni_africa/features/discovery/domain/models/book.dart';

class ContentFileIdParser {
  const ContentFileIdParser();

  static String? resolve(Book book) {
    final direct = book.fileId;
    if (direct != null && direct.isNotEmpty) {
      return direct;
    }

    final sampleUrl = book.sampleUrl;
    if (sampleUrl == null || sampleUrl.isEmpty) {
      return null;
    }

    try {
      final uri = Uri.parse(sampleUrl);
      final segments = uri.pathSegments;
      final contentIndex = segments.indexOf('content');
      if (contentIndex != -1 && segments.length > contentIndex + 1) {
        final fileId = segments[contentIndex + 1];
        if (fileId.isNotEmpty) {
          return fileId;
        }
      }

      return null;
    } catch (_) {
      return null;
    }
  }
}
