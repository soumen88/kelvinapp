import 'dart:math';

import 'package:flame/components.dart';
import 'package:kelvinapp/config/star_type_enum.dart';
import 'package:kelvinapp/config/tuple.dart';
import 'package:kelvinapp/data/models/player_motion_counter.dart';

import 'models/info_position_model.dart';

class GetPlayerMovements{

  final _random = Random();

  Tuple<int,int> getPlayerMovement(StarTypeEnum currentStar){

    switch(currentStar){
      case StarTypeEnum.BLUE_STAR:{
        return Tuple(item1: 1, item2: 1);
      }

      case StarTypeEnum.ORANGE_STAR:{
        return Tuple(item1: 1, item2: 1);
      }

      case StarTypeEnum.YELLOW_STAR:{
        return Tuple(item1: 1, item2: 1);
      }
    }
  }

  int generateRandomDiceValue(StarTypeEnum currentStar){
    Tuple<int, int> limit = getPlayerMovement(currentStar);
    int randomValue = next(limit.item1, limit.item2);
    return randomValue;
  }

  StarTypeEnum getNextPlayer(StarTypeEnum currentStar){
    switch(currentStar){
      case StarTypeEnum.BLUE_STAR:{
        return StarTypeEnum.ORANGE_STAR;
      }

      case StarTypeEnum.ORANGE_STAR:{
        return StarTypeEnum.YELLOW_STAR;
      }

      case StarTypeEnum.YELLOW_STAR:{
        return StarTypeEnum.BLUE_STAR;
      }
    }
  }
  
  PlayerMotionCounter getPlayerMotions(StarTypeEnum currentStar){

    switch(currentStar){
      case StarTypeEnum.BLUE_STAR:{
        return PlayerMotionCounter(
            leftAxisMotion: 8,
            rightAxisMotion: 7,
            upAxisMotion: 4,
            downAxisMotion: 3
        );
      }

      case StarTypeEnum.ORANGE_STAR:{
        return PlayerMotionCounter(
            leftAxisMotion: 10,
            rightAxisMotion: 9,
            upAxisMotion: 6,
            downAxisMotion: 5
        );
      }

      case StarTypeEnum.YELLOW_STAR:{
        return PlayerMotionCounter(
            leftAxisMotion: 12,
            rightAxisMotion: 11,
            upAxisMotion: 8,
            downAxisMotion: 7
        );
      }
    }
  }

  Map<StarTypeEnum,List<InfoPositionModel>> getInformationSpritePositions(){
    Map<StarTypeEnum,List<InfoPositionModel>> infoSpritePositionMap = Map();
    List<InfoPositionModel> infoSpritePositions1 = [];
    List<InfoPositionModel> infoSpritePositions2 = [];
    List<InfoPositionModel> infoSpritePositions3 = [];
    ///Blue star positions
    var starType1PositionModel1 = InfoPositionModel(
      currentStar: StarTypeEnum.BLUE_STAR,
      infoIconPosition: Vector2(550, 370),
      positionDescription: "Stage 1: the star collapses under its own gravity which squishes the core, increasing the pressure and temperature"
    );

    var starType1PositionModel2 = InfoPositionModel(
        currentStar: StarTypeEnum.BLUE_STAR,
        infoIconPosition: Vector2(610, 310),
        positionDescription: "Stage 2: the outer layers start to expand outward becoming a red giant."
    );

    var starType1PositionModel3 = InfoPositionModel(
        currentStar: StarTypeEnum.BLUE_STAR,
        infoIconPosition: Vector2(550, 130),
        positionDescription: "Stage 3: fuses Helium and makes heavier elements up to Iron"
    );

    var starType1PositionModel4 = InfoPositionModel(
        currentStar: StarTypeEnum.BLUE_STAR,
        infoIconPosition: Vector2(130, 190),
        positionDescription: "Stage 4: fusing iron requires a lot of input power so positively-charged nuclei overcome the force of gravity while crushing iron atoms, leading to an explosion called ‘supernova’"
    );

    var starType1PositionModel5 = InfoPositionModel(
        currentStar: StarTypeEnum.BLUE_STAR,
        infoIconPosition: Vector2(130, 310),
        positionDescription: "Stage 5: the star becomes either a neutron star or a black hole due to higher mass."
    );
    infoSpritePositions1.add(starType1PositionModel1);
    infoSpritePositions1.add(starType1PositionModel2);
    infoSpritePositions1.add(starType1PositionModel3);
    infoSpritePositions1.add(starType1PositionModel4);
    infoSpritePositions1.add(starType1PositionModel5);

    infoSpritePositionMap[StarTypeEnum.BLUE_STAR] = infoSpritePositions1;

    ///Orange star positions
    var starType2PositionModel1 = InfoPositionModel(
        currentStar: StarTypeEnum.ORANGE_STAR,
        infoIconPosition: Vector2(610, 430),
        positionDescription: "Stage 1: the star collapses under its own gravity which squishes the core, increasing the pressure and temperature"
    );

    var starType2PositionModel2 = InfoPositionModel(
        currentStar: StarTypeEnum.ORANGE_STAR,
        infoIconPosition: Vector2(670, 370),
        positionDescription: "Stage 2: the outer layers start to expand outward becoming a red supergiant"
    );

    var starType2PositionModel3 = InfoPositionModel(
        currentStar: StarTypeEnum.ORANGE_STAR,
        infoIconPosition: Vector2(610, 70),
        positionDescription: "Stage 3: fuses Helium and makes heavier elements up to Iron"
    );

    var starType2PositionModel4 = InfoPositionModel(
        currentStar: StarTypeEnum.ORANGE_STAR,
        infoIconPosition: Vector2(70, 130),
        positionDescription: "Stage 4: fusing iron requires a lot of input power so positively-charged nuclei overcome the force of gravity while crushing iron atoms, leading to an explosion called ‘supernova’"
    );

    var starType2PositionModel5 = InfoPositionModel(
        currentStar: StarTypeEnum.ORANGE_STAR,
        infoIconPosition: Vector2(70, 370),
        positionDescription: "Stage 5: the star becomes a neutron star"
    );

    infoSpritePositions2.add(starType2PositionModel1);
    infoSpritePositions2.add(starType2PositionModel2);
    infoSpritePositions2.add(starType2PositionModel3);
    infoSpritePositions2.add(starType2PositionModel4);
    infoSpritePositions2.add(starType2PositionModel5);

    infoSpritePositionMap[StarTypeEnum.ORANGE_STAR] = infoSpritePositions2;

    ///Yellow star positions
    var starType3PositionModel1 = InfoPositionModel(
        currentStar: StarTypeEnum.YELLOW_STAR,
        infoIconPosition: Vector2(670, 490),
        positionDescription: "Stage 1: the star collapses under its own gravity which squishes the core, increasing the pressure and temperature"
    );

    var starType3PositionModel2 = InfoPositionModel(
        currentStar: StarTypeEnum.YELLOW_STAR,
        infoIconPosition: Vector2(730, 430),
        positionDescription: "Stage 2: the outer layers start to expand outward becoming a red giant"
    );

    var starType3PositionModel3 = InfoPositionModel(
        currentStar: StarTypeEnum.YELLOW_STAR,
        infoIconPosition: Vector2(670, 10),
        positionDescription: "Stage 3: the star fuses Helium and makes heavier elements"
    );

    var starType3PositionModel4 = InfoPositionModel(
        currentStar: StarTypeEnum.YELLOW_STAR,
        infoIconPosition: Vector2(10, 70),
        positionDescription: "Stage 4: the star sheds most of its mass forming a cloud called ‘planetary nebula’"
    );

    var starType3PositionModel5 = InfoPositionModel(
        currentStar: StarTypeEnum.YELLOW_STAR,
        infoIconPosition: Vector2(10, 430),
        positionDescription: "Stage 5: the star becomes a white dwarf"
    );

    infoSpritePositions3.add(starType3PositionModel1);
    infoSpritePositions3.add(starType3PositionModel2);
    infoSpritePositions3.add(starType3PositionModel3);
    infoSpritePositions3.add(starType3PositionModel4);
    infoSpritePositions3.add(starType3PositionModel5);

    infoSpritePositionMap[StarTypeEnum.YELLOW_STAR] = infoSpritePositions3;
    return infoSpritePositionMap;
  }

  int next(int min, int max) => min + _random.nextInt(max - min);
}