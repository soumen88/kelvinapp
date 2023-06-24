import 'package:flame/components.dart';
import 'package:kelvinapp/config/star_type_enum.dart';

class InfoPositionModel{
  Vector2 infoIconPosition;
  StarTypeEnum currentStar;
  String positionDescription;

  InfoPositionModel(
      {required this.infoIconPosition, required this.currentStar, required this.positionDescription});
}