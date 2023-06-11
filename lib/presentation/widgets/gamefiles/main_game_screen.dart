import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelvinapp/config/tuple.dart';
import 'package:kelvinapp/data/get_asset_file_path.dart';
import 'package:kelvinapp/domain/game_triggers.dart';
import 'package:kelvinapp/presentation/features/game/game_bloc.dart';
import 'package:kelvinapp/presentation/features/game/game_state.dart';
import 'package:kelvinapp/presentation/widgets/commonwidgets/button_widget.dart';
import 'package:kelvinapp/presentation/widgets/commonwidgets/custom_loader.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/board_world.dart';
import '../../../config/star_type_enum.dart';
import '../../../injection.dart';
import '../../features/game/game_event.dart';

@RoutePage()
class MainGameScreen extends StatelessWidget{

  final _boardWorld = BoardWorld();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: GameWidget(
        game: _boardWorld
      ),
      bottomNavigationBar: BlocBuilder<GameBloc, GameState>(
        builder: (BuildContext context, GameState state){
          return state.maybeWhen(
              displayBoardGameView: (StarTypeEnum currentStar, int diceCount){
                String filePath = GetAssetFilePath().getStarImagePath(currentStar);
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.green
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Current Player",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),
                          ),
                          Image.asset(
                            filePath,
                            width: 100,
                            height: 100,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ButtonWidget(
                            onButtonPress: (){
                              BlocProvider.of<GameBloc>(context).add(const GameEvent.throwDice());
                            },
                            buttonText: "Throw Dice",
                          ),
                          Text(
                            "Dice count $diceCount",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              orElse: (){
                return CustomLoader();
              }
          );

        }
      )
    );
  }

}