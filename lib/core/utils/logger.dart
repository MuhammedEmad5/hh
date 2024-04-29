import 'package:logger/logger.dart';


class LoggerSingleton {
  static final Logger _logger = Logger();

  static Logger get logger => _logger;
}