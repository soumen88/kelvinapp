import 'dart:developer' as developer;
import 'package:injectable/injectable.dart';

@injectable
class LoggerUtils{
  void log({required String tag, required String message}){
    developer.log(message, name: tag);
    print("Message $message");
  }
}