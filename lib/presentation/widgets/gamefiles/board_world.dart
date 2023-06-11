import 'package:flame/game.dart';
import 'package:kelvinapp/config/logger_utils.dart';
import 'package:kelvinapp/config/star_type_enum.dart';
import 'package:kelvinapp/data/models/dice_roll_event.dart';
import 'package:kelvinapp/domain/game_triggers.dart';
import 'package:kelvinapp/injection.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/dice_sprite.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/game_background_sprite.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/star_sprite.dart';

class BoardWorld extends FlameGame{
  final _logger = locator<LoggerUtils>();
  final _TAG = "BoardWorld";
  final _gameBackgroundSprite = GameBackgroundSprite();
  final _blackStarSprite = StarSprite(currentStarColor: StarTypeEnum.BLACK_STAR);
  final _whiteStarSprite = StarSprite(currentStarColor: StarTypeEnum.WHITE_STAR);
  final _yellowStarSprite = StarSprite(currentStarColor: StarTypeEnum.YELLOW_STAR);
  final _diceSprite = DiceSprite();
  final _gameTriggers = locator<GameTriggers>();
  @override
  Future<void> onLoad() async{
    await add(_gameBackgroundSprite);
    await add(_blackStarSprite);
    await add(_whiteStarSprite);
    await add(_yellowStarSprite);
    await add(_diceSprite);

    _logger.log(tag: _TAG, message: "Size ${_gameBackgroundSprite.size}");
    _blackStarSprite.position = Vector2(190, 365);
    _whiteStarSprite.position = Vector2(130, 425);
    _yellowStarSprite.position = Vector2(70, 485);
    _diceSprite.position = Vector2(30, 20);
    listenToPlayerMovements();
  }

  void listenToPlayerMovements(){
    _gameTriggers.diceRollEventStream.listen((DiceRollEvent? diceRollEvent) {
        if(diceRollEvent != null){
          switch(diceRollEvent.currentStar){
            case StarTypeEnum.BLACK_STAR:{
              _blackStarSprite.position.x = _blackStarSprite.position.x + 60;
            }

            case StarTypeEnum.WHITE_STAR:{
              _blackStarSprite.position.x = _blackStarSprite.position.x + 60;
            }

            case StarTypeEnum.YELLOW_STAR:{
              _blackStarSprite.position.x = _blackStarSprite.position.x + 60;
            }
          }
        }
    });
  }
}