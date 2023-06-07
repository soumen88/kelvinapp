import 'package:auto_route/annotations.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:kelvinapp/domain/game_triggers.dart';
import 'package:kelvinapp/presentation/widgets/commonwidgets/button_widget.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/board_world.dart';

import '../../../injection.dart';

@RoutePage()
class MainGameScreen extends StatelessWidget{
  final _boardWorld = BoardWorld();
  final _gameTriggers = locator<GameTriggers>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GameWidget(
                game: _boardWorld
            ),
            Positioned(
              bottom: 200,
                child: ButtonWidget(
                  onButtonPress: (){
                    _gameTriggers.addAnimationEvent(true);
                  },
                  buttonText: "Stop Rolling",
                )
            )
          ],
        ),
      ),
    );
  }

}