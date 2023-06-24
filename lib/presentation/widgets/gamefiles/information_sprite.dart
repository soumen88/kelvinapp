import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:kelvinapp/config/logger_utils.dart';
import 'package:kelvinapp/domain/game_triggers.dart';
import 'package:kelvinapp/injection.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/board_world.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/star_sprite.dart';

class InformationSprite extends SpriteComponent with HasGameRef<BoardWorld>, CollisionCallbacks{
  final _logger = locator<LoggerUtils>();
  final _TAG = "InformationSprite";
  Vector2 informationSpritePosition;
  late ShapeHitbox hitbox;
  final _defaultColor = Colors.red;
  final _collisionColor = Colors.green;
  String message;
  final _gameTriggers = locator<GameTriggers>();

  InformationSprite({required this.informationSpritePosition, required this.message});

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('information.png');
    /*animation = await gameRef.loadSpriteAnimation(
      'information.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.2,
        textureSize: Vector2.all(48),
      ),
    );*/
    size = Vector2(40, 40);
    ///Initial position of the information icon
    position = informationSpritePosition;
    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke;
    hitbox = CircleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    //add(hitbox);
    await add(RectangleHitbox());
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if(other is StarSprite){
      _logger.log(tag: _TAG, message: "On collision at having message $message");
      _gameTriggers.addDiceMessageEvent(message);
    }
  }
}