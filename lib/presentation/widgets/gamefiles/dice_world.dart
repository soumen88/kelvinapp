import 'package:flame/game.dart';
import 'package:kelvinapp/config/logger_utils.dart';
import 'package:kelvinapp/injection.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/dice_background_sprite.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/dice_sprite.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/game_background_sprite.dart';

class DiceWorld extends FlameGame{
  final _logger = locator<LoggerUtils>();
  final _TAG = "DiceWorld";
  final _diceSprite = DiceSprite();
  final _diceBackgroundSprite = DiceBackgroundSprite();

  @override
  Future<void> onLoad() async{
    await add(_diceBackgroundSprite);
    await add(_diceSprite);
    _diceSprite.position = Vector2(140, 300);
  }
}