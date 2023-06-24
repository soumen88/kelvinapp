import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:kelvinapp/config/star_type_enum.dart';

import '../../../config/logger_utils.dart';
import '../../../injection.dart';

class StarSprite extends SpriteComponent with HasGameRef, HasCollisionDetection, CollisionCallbacks {
  final _logger = locator<LoggerUtils>();
  final _TAG = "StarSprite";
  StarTypeEnum currentStarColor;
  StarSprite({required this.currentStarColor});
  @override
  Future<void> onLoad() async {
    super.onLoad();
    switch(currentStarColor){
      case StarTypeEnum.BLUE_STAR:{
        sprite = await gameRef.loadSprite('blue_star.png');
      }
      break;
      case StarTypeEnum.ORANGE_STAR:{
        sprite = await gameRef.loadSprite('orange_star.png');
      }
      break;
      case StarTypeEnum.YELLOW_STAR:{
        sprite = await gameRef.loadSprite('sun.png');
      }
      break;
      default:{

      }
      break;
    }

    size = Vector2(40, 40);
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    //position.add(velocity * dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints,
      PositionComponent other,
      ) {
    super.onCollisionStart(intersectionPoints, other);

    _logger.log(tag: _TAG, message: "On collision start");
    if (other is ScreenHitbox) {
      //removeFromParent();
      return;
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    _logger.log(tag: _TAG, message: "On collision end");
  }

}