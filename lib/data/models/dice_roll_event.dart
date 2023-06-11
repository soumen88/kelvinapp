import 'package:kelvinapp/config/star_type_enum.dart';

class DiceRollEvent{
  StarTypeEnum currentStar;
  int countOnDice;

  DiceRollEvent({required this.currentStar,required this.countOnDice});
}