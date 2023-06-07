import 'package:flame/game.dart';
import 'package:kelvinapp/config/logger_utils.dart';
import 'package:kelvinapp/injection.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/dice_sprite.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/game_background_sprite.dart';

class BoardWorld extends FlameGame{
  final _logger = locator<LoggerUtils>();
  final _TAG = "BoardWorld";
  final _diceSprite = DiceSprite();
  final _gameBackgroundSprite = GameBackgroundSprite();

  @override
  Future<void> onLoad() async{
    await add(_gameBackgroundSprite);
    await add(_diceSprite);
    _logger.log(tag: _TAG, message: "Size ${_gameBackgroundSprite.size}");
    _diceSprite.position = Vector2(140, 300);
  }
}