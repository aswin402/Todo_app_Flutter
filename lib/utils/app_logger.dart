import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _log = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static void d(String message) => _log.d(message);
  static void i(String message) => _log.i(message);
  static void w(String message) => _log.w(message);
  static void e(String message) => _log.e(message);
}
