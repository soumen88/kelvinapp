import 'package:flame/components.dart';

class GameBackgroundSprite extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('planets_background.jpg');
    size = sprite!.originalSize;
  }
}