import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame/sprite.dart';
import 'package:kelvinapp/config/logger_utils.dart';
import 'package:kelvinapp/config/star_type_enum.dart';
import 'package:kelvinapp/data/get_player_movements.dart';
import 'package:kelvinapp/domain/game_triggers.dart';

import '../../../injection.dart';

class DiceSprite extends SpriteAnimationComponent with HasGameRef{

  final _logger = locator<LoggerUtils>();
  final _TAG = "DiceSprite";
  final double _animationSpeed = 0.30;
  late final SpriteAnimation _runDiceAnimation;
  late final SpriteAnimation _diceSideOneAnimation;
  late final SpriteAnimation _diceSideTwoAnimation;
  late final SpriteAnimation _diceSideThreeAnimation;
  late final SpriteAnimation _diceSideFourAnimation;
  late final SpriteAnimation _diceSideFiveAnimation;
  late final SpriteAnimation _diceSideSixAnimation;
  final _gameTriggers = locator<GameTriggers>();
  bool _isDiceRolling = true;
  bool _isAnimationLoaded = false;
  final _random = Random();
  final _getPlayerMovements = GetPlayerMovements();
  late StarTypeEnum currentStar;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    await _loadAnimations().then((_) {
      return animation = _runDiceAnimation;
    });
    listenToAnimationChanges();
    size = Vector2(80, 80);
  }

  @override
  void update(double delta) {
    super.update(delta);
    rollDice();
  }

  void rollDice(){
    if(_isAnimationLoaded == true){
      if(_isDiceRolling == true){
        animation = _runDiceAnimation;
      }
      else{
        int randomValue = _getPlayerMovements.generateRandomDiceValue(currentStar);
        _logger.log(tag: _TAG, message: "Random value $randomValue");
        _isAnimationLoaded = false;
        _gameTriggers.addDiceRollEvent(currentStar, randomValue);
        switch(randomValue){
          case 1: {
            animation = _diceSideOneAnimation;
          }
          break;
          case 2: {
            animation = _diceSideTwoAnimation;
          }
          break;
          case 3: {
            animation = _diceSideThreeAnimation;
          }
          break;
          case 4: {
            animation = _diceSideFourAnimation;
          }
          break;
          case 5: {
            animation = _diceSideFiveAnimation;
          }
          break;
          case 6: {
            animation = _diceSideSixAnimation;
          }
          break;
        }

      }
    }

  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('dice_roll_sprite_sheet.png'),
      ///First parameter is width and second is height
      srcSize: Vector2(184.0, 184.0),
    );
    _runDiceAnimation = spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 5);
    _diceSideOneAnimation = spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, from:0, to: 1);
    _diceSideTwoAnimation = spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, from:1, to: 2);
    _diceSideThreeAnimation = spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, from:2, to: 3);
    _diceSideFourAnimation = spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, from:3, to: 4);
    _diceSideFiveAnimation = spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, from:4, to: 5);
    _diceSideSixAnimation = spriteSheet.createAnimation(row: 1, stepTime: _animationSpeed, from:0, to: 1);
    _isAnimationLoaded = true;
  }

  void listenToAnimationChanges(){
    _gameTriggers.diceRollStream.listen((bool? value) {
        _logger.log(tag: _TAG, message: "Trigger value $value");
        if(value != null){
          _isDiceRolling = false;
          //_isAnimationLoaded = false;
        }
    });

    _gameTriggers.currentStarStream.listen((StarTypeEnum? currentStar) {
      if(currentStar != null){
        _logger.log(tag: _TAG, message: "Current star received $currentStar");
        this.currentStar = currentStar;
      }
    });
  }

  int next(int min, int max) => min + _random.nextInt(max - min);
}