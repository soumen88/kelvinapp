import 'dart:math';

import 'package:kelvinapp/config/star_type_enum.dart';
import 'package:kelvinapp/config/tuple.dart';

class GetPlayerMovements{

  final _random = Random();

  Tuple<int,int> getPlayerMovement(StarTypeEnum currentStar){

    switch(currentStar){
      case StarTypeEnum.BLACK_STAR:{
        return Tuple(item1: 1, item2: 2);
      }

      case StarTypeEnum.WHITE_STAR:{
        return Tuple(item1: 1, item2: 4);
      }

      case StarTypeEnum.YELLOW_STAR:{
        return Tuple(item1: 1, item2: 2);
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
      case StarTypeEnum.BLACK_STAR:{
        return StarTypeEnum.WHITE_STAR;
      }

      case StarTypeEnum.WHITE_STAR:{
        return StarTypeEnum.YELLOW_STAR;
      }

      case StarTypeEnum.YELLOW_STAR:{
        return StarTypeEnum.BLACK_STAR;
      }
    }
  }

  int next(int min, int max) => min + _random.nextInt(max - min);
}