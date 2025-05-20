import 'package:intl/intl.dart';

class WidgetConstants {
  static String formatDateRange(String durationStart, String durationEnd) {
    // Parse the datetime strings
    DateTime startDate = DateTime.parse(durationStart);
    DateTime endDate = DateTime.parse(durationEnd);

    // Format the dates (e.g., "Apr 4, 2025 - Apr 17, 2025")
    String formattedStart = DateFormat('MMM d, yyyy').format(startDate);
    String formattedEnd = DateFormat('MMM d, yyyy').format(endDate);

    return '$formattedStart - $formattedEnd';
  }
}
