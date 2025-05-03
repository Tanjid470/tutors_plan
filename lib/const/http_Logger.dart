
import 'package:pretty_http_logger/pretty_http_logger.dart';

HttpWithMiddleware httpLog = HttpWithMiddleware.build(
    middlewares: [
      HttpLogger(
        logLevel: LogLevel.BODY,
      ),
    ]);