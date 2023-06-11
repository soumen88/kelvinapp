import 'package:flame/game.dart';
import 'package:kelvinapp/config/logger_utils.dart';
import 'package:kelvinapp/config/star_type_enum.dart';
import 'package:kelvinapp/data/get_player_movements.dart';
import 'package:kelvinapp/data/models/dice_roll_event.dart';
import 'package:kelvinapp/data/models/player_motion_counter.dart';
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
  PlayerMotionCounter blackStarMotions = GetPlayerMovements().getPlayerMotions(StarTypeEnum.BLACK_STAR);
  PlayerMotionCounter whiteStarMotions = GetPlayerMovements().getPlayerMotions(StarTypeEnum.WHITE_STAR);
  PlayerMotionCounter yellowStarMotions = GetPlayerMovements().getPlayerMotions(StarTypeEnum.YELLOW_STAR);
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
              if(blackStarMotions.rightAxisMotion > 0){
                blackStarMotions.rightAxisMotion--;
                _blackStarSprite.position.x = _blackStarSprite.position.x + 60;
              }
              else if(blackStarMotions.upAxisMotion > 0){
                blackStarMotions.upAxisMotion--;
                _blackStarSprite.position.y = _blackStarSprite.position.y - 60;
              }
              else if(blackStarMotions.leftAxisMotion > 0){
                blackStarMotions.leftAxisMotion--;
                _blackStarSprite.position.x = _blackStarSprite.position.x - 60;
              }
              else if(blackStarMotions.downAxisMotion > 0){
                blackStarMotions.downAxisMotion--;
                _blackStarSprite.position.y = _blackStarSprite.position.y + 60;
              }
              camera.followComponent(_blackStarSprite);
              _logger.log(tag: _TAG, message: "Black star motions $blackStarMotions");
            }

            case StarTypeEnum.WHITE_STAR:{
              if(whiteStarMotions.rightAxisMotion > 0){
                whiteStarMotions.rightAxisMotion--;
                _whiteStarSprite.position.x = _whiteStarSprite.position.x + 60;
              }
              else if(whiteStarMotions.upAxisMotion > 0){
                whiteStarMotions.upAxisMotion--;
                _whiteStarSprite.position.y = _whiteStarSprite.position.y - 60;
              }
              else if(whiteStarMotions.leftAxisMotion > 0){
                whiteStarMotions.leftAxisMotion--;
                _whiteStarSprite.position.x = _whiteStarSprite.position.x - 60;
              }
              else if(whiteStarMotions.downAxisMotion > 0){
                whiteStarMotions.downAxisMotion--;
                _whiteStarSprite.position.y = _whiteStarSprite.position.y + 60;
              }
              camera.followComponent(_whiteStarSprite);
            }

            case StarTypeEnum.YELLOW_STAR:{
              if(yellowStarMotions.rightAxisMotion > 0){
                yellowStarMotions.rightAxisMotion--;
                _yellowStarSprite.position.x = _yellowStarSprite.position.x + 60;
              }
              else if(yellowStarMotions.upAxisMotion > 0){
                yellowStarMotions.upAxisMotion--;
                _yellowStarSprite.position.y = _yellowStarSprite.position.y - 60;
              }
              else if(yellowStarMotions.leftAxisMotion > 0){
                yellowStarMotions.leftAxisMotion--;
                _yellowStarSprite.position.x = _yellowStarSprite.position.x - 60;
              }
              else if(yellowStarMotions.downAxisMotion > 0){
                yellowStarMotions.downAxisMotion--;
                _yellowStarSprite.position.y = _yellowStarSprite.position.y + 60;
              }
              camera.followComponent(_yellowStarSprite);
            }
          }
        }
    });
  }
}