import 'package:rxdart/rxdart.dart';

class GameTriggers{
  static final GameTriggers _instance = GameTriggers._init();
  static GameTriggers get instance => _instance;
  GameTriggers._init();

  ///Below variable keeps track of number that appears on the dice
  BehaviorSubject<int?> diceValueStream = BehaviorSubject.seeded(null);

  ///Below variable keeps track if dice rolling animation is stopped
  BehaviorSubject<bool?> diceRollStream = BehaviorSubject.seeded(null);

  void addAnimationEvent(bool value){
    diceRollStream.add(value);
  }
}