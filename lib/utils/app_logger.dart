import 'package:logger/logger.dart';

class AppLogger {
  static final Logger log = Logger(
    printer: PrettyPrinter(
      methodCount: 0,     // no method stack
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );
}
