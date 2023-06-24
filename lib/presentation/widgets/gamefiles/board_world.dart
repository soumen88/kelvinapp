import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/game.dart';
import 'package:kelvinapp/config/logger_utils.dart';
import 'package:kelvinapp/config/star_type_enum.dart';
import 'package:kelvinapp/data/get_player_movements.dart';
import 'package:kelvinapp/data/models/dice_roll_event.dart';
import 'package:kelvinapp/data/models/info_position_model.dart';
import 'package:kelvinapp/data/models/player_motion_counter.dart';
import 'package:kelvinapp/domain/game_triggers.dart';
import 'package:kelvinapp/injection.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/board_background_sprite.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/dice_sprite.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/game_background_sprite.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/information_sprite.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/star_sprite.dart';

import '../../features/game/grass_background.dart';

class BoardWorld extends FlameGame with HasCollisionDetection {
  final _logger = locator<LoggerUtils>();
  final _TAG = "BoardWorld";
  final _gameBackgroundSprite = GameBackgroundSprite();
  final _boardBackgroundSprite = BoardBackgroundSprite();
  final _blueStarSprite = StarSprite(currentStarColor: StarTypeEnum.BLUE_STAR);
  final _orangeStarSprite = StarSprite(currentStarColor: StarTypeEnum.ORANGE_STAR);
  final _yellowStarSprite = StarSprite(currentStarColor: StarTypeEnum.YELLOW_STAR);

  final _diceSprite = DiceSprite();
  final _gameTriggers = locator<GameTriggers>();
  PlayerMotionCounter blueStarMotions = GetPlayerMovements().getPlayerMotions(StarTypeEnum.BLUE_STAR);
  PlayerMotionCounter orangeStarMotions = GetPlayerMovements().getPlayerMotions(StarTypeEnum.ORANGE_STAR);
  PlayerMotionCounter yellowStarMotions = GetPlayerMovements().getPlayerMotions(StarTypeEnum.YELLOW_STAR);

  @override
  Future<void> onLoad() async{
    await add(_gameBackgroundSprite);
    await add(_boardBackgroundSprite);
    await add(_blueStarSprite);
    await add(_orangeStarSprite);
    await add(_yellowStarSprite);
    await add(_diceSprite);
    _gameBackgroundSprite.position = Vector2(-600, -180);
    _blueStarSprite.position = Vector2(190, 365);
    _orangeStarSprite.position = Vector2(130, 425);
    _yellowStarSprite.position = Vector2(70, 485);
    _diceSprite.position = Vector2(30, 20);
    camera.followComponent(_blueStarSprite);
    listenToPlayerMovements();
    addInformationSprites();

  }

  void listenToPlayerMovements(){
    _gameTriggers.diceRollEventStream.listen((DiceRollEvent? diceRollEvent) {
        if(diceRollEvent != null){
          switch(diceRollEvent.currentStar){
            case StarTypeEnum.BLUE_STAR:{
              if(blueStarMotions.rightAxisMotion > 0){
                blueStarMotions.rightAxisMotion--;
                _blueStarSprite.position.x = _blueStarSprite.position.x + 60;
              }
              else if(blueStarMotions.upAxisMotion > 0){
                blueStarMotions.upAxisMotion--;
                _blueStarSprite.position.y = _blueStarSprite.position.y - 60;
              }
              else if(blueStarMotions.leftAxisMotion > 0){
                blueStarMotions.leftAxisMotion--;
                _blueStarSprite.position.x = _blueStarSprite.position.x - 60;
              }
              else if(blueStarMotions.downAxisMotion > 0){
                blueStarMotions.downAxisMotion--;
                _blueStarSprite.position.y = _blueStarSprite.position.y + 60;
              }
              camera.followComponent(_blueStarSprite);
              _logger.log(tag: _TAG, message: "Blue star motions ${_blueStarSprite.position}");

            }

            case StarTypeEnum.ORANGE_STAR:{
              if(orangeStarMotions.rightAxisMotion > 0){
                orangeStarMotions.rightAxisMotion--;
                _orangeStarSprite.position.x = _orangeStarSprite.position.x + 60;
              }
              else if(orangeStarMotions.upAxisMotion > 0){
                orangeStarMotions.upAxisMotion--;
                _orangeStarSprite.position.y = _orangeStarSprite.position.y - 60;
              }
              else if(orangeStarMotions.leftAxisMotion > 0){
                orangeStarMotions.leftAxisMotion--;
                _orangeStarSprite.position.x = _orangeStarSprite.position.x - 60;
              }
              else if(orangeStarMotions.downAxisMotion > 0){
                orangeStarMotions.downAxisMotion--;
                _orangeStarSprite.position.y = _orangeStarSprite.position.y + 60;
              }
              camera.followComponent(_orangeStarSprite);
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

  /*@override
  Color backgroundColor() => const Color(0xFF85e47b);*/

  void addInformationSprites() async{
    List<Vector2> spritePositionList = [];
    Map<StarTypeEnum, List<InfoPositionModel> > starInformations = GetPlayerMovements().getInformationSpritePositions();
    for(var entries in starInformations.entries){
      var list = entries.value.toList().map((element) => element.infoIconPosition).toList();
      spritePositionList.addAll(list);
    }
    /*for(var spritePosition in spritePositionList){
      var _informationSprite = InformationSprite(informationSpritePosition: spritePosition);
      await add(_informationSprite);
    }*/

    var _informationSprite = InformationSprite(informationSpritePosition: spritePositionList.first);
    await add(_informationSprite);
  }

  void checkForInfo(StarTypeEnum currentStar){
    switch(currentStar){
      case StarTypeEnum.BLUE_STAR:{

      }
      case StarTypeEnum.ORANGE_STAR:{

      }
      case StarTypeEnum.YELLOW_STAR:{

      }
    }


  }

}