import 'package:flame/components.dart';

class GameBackgroundSprite extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    //sprite = await gameRef.loadSprite('board_background.png');
    sprite = await gameRef.loadSprite('kevin_app_background_large.png');
    size = sprite!.originalSize;
  }
}