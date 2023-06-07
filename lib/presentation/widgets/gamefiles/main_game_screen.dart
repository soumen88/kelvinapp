import 'package:auto_route/annotations.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelvinapp/domain/game_triggers.dart';
import 'package:kelvinapp/presentation/features/game/game_bloc.dart';
import 'package:kelvinapp/presentation/features/game/game_state.dart';
import 'package:kelvinapp/presentation/widgets/commonwidgets/button_widget.dart';
import 'package:kelvinapp/presentation/widgets/commonwidgets/custom_loader.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/board_world.dart';

import '../../../injection.dart';
import '../../features/game/game_event.dart';
import 'dice_world.dart';

@RoutePage()
class MainGameScreen extends StatelessWidget{
  final _diceWorld = DiceWorld();
  final _boardWorld = BoardWorld();
  final _gameTriggers = locator<GameTriggers>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GameBloc, GameState>(
        builder: (BuildContext context, GameState state){
          return state.maybeWhen(
              displayBoardGameView: (){
                return Center(
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
                              BlocProvider.of<GameBloc>(context).add(const GameEvent.throwDice());
                            },
                            buttonText: "Throw Dice",
                          )
                      )
                    ],
                  ),
                );
              },
              displayDiceGameView: (){
                return Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GameWidget(
                          game: _diceWorld
                      ),
                      Positioned(
                          bottom: 200,
                          child: ButtonWidget(
                            onButtonPress: (){
                              //_gameTriggers.addAnimationEvent(true);

                            },
                            buttonText: "Stop Rolling",
                          )
                      )
                    ],
                  ),
                );
              },
              loading: (){
                return CustomLoader();
              },
              orElse: () {
                return CustomLoader();
              }
          );

        },
      ),
    );
  }

}