import 'package:injectable/injectable.dart';

import '../domain/game_triggers.dart';

@module
abstract class RegisterModule{

  @injectable
  GameTriggers get gameTriggers => GameTriggers.instance;

}