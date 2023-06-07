import 'package:flame/components.dart';
import 'package:kelvinapp/config/star_type_enum.dart';

class StarSprite extends SpriteComponent with HasGameRef {
  StarTypeEnum currentStarColor;
  StarSprite({required this.currentStarColor});
  @override
  Future<void> onLoad() async {
    super.onLoad();
    switch(currentStarColor){
      case StarTypeEnum.BLACK_STAR:{
        sprite = await gameRef.loadSprite('black_star.png');
      }
      break;
      case StarTypeEnum.WHITE_STAR:{
        sprite = await gameRef.loadSprite('white_star.png');
      }
      break;
      case StarTypeEnum.YELLOW_STAR:{
        sprite = await gameRef.loadSprite('yellow_star.png');
      }
      break;
      default:{

      }
      break;
    }

    size = Vector2(40, 40);
  }


}