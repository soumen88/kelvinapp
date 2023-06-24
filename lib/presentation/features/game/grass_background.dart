import 'package:flame/components.dart';

class GrassBackground extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('rayworld_background.png');
    size = sprite!.originalSize;
    //size = Vector2(40, 40);;
  }
}