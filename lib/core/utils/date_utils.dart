import 'package:intl/intl.dart';

class AppDateUtils {
  static String formatDate(DateTime date) {
    return DateFormat('MMMM d, yyyy').format(date);
  }

  static String formatDateShort(DateTime date) {
    return DateFormat('MMM d, yyyy').format(date);
  }

  static String formatDateTime(DateTime date) {
    return DateFormat('MMMM d, yyyy \'at\' h:mm a').format(date);
  }

  static String formatDateSimple(DateTime date) {
    return DateFormat('d/MM/yyyy').format(date);
  }

  static String formatDateString(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return formatDate(date);
    } catch (e) {
      return dateString;
    }
  }
}