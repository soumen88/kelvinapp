import 'package:kelvinapp/config/star_type_enum.dart';
import 'package:rxdart/rxdart.dart';

import '../data/models/dice_roll_event.dart';

class GameTriggers{
  static final GameTriggers _instance = GameTriggers._init();
  static GameTriggers get instance => _instance;
  GameTriggers._init();

  ///Below variable keeps track if dice rolling animation is stopped
  BehaviorSubject<bool?> diceRollStream = BehaviorSubject.seeded(null);

  ///Below variable keeps track of which player is currently moving
  BehaviorSubject<StarTypeEnum?> currentStarStream = BehaviorSubject.seeded(null);

  ///Below variable keeps track of what number appeared on dice and for which star
  BehaviorSubject<DiceRollEvent?> diceRollEventStream = BehaviorSubject.seeded(null);

  ///Below variable keeps track of what messages have pushed
  BehaviorSubject<String?> starInfoMessageEventStream = BehaviorSubject.seeded(null);

  void addAnimationEvent(bool value){
    diceRollStream.add(value);
  }

  void addCurrentPlayerEvent(StarTypeEnum currentStar){
    currentStarStream.add(currentStar);
  }

  void addDiceRollEvent(StarTypeEnum currentStar, int diceCount){
    DiceRollEvent diceRollEvent = DiceRollEvent(currentStar: currentStar, countOnDice: diceCount);
    diceRollEventStream.add(diceRollEvent);
  }

  void addDiceMessageEvent(String message){
    starInfoMessageEventStream.add(message);
  }
}