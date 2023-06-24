import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelvinapp/config/logger_utils.dart';
import 'package:kelvinapp/config/router/app_router.dart';
import 'package:kelvinapp/config/tuple.dart';
import 'package:kelvinapp/data/get_asset_file_path.dart';
import 'package:kelvinapp/domain/game_triggers.dart';
import 'package:kelvinapp/presentation/features/game/game_bloc.dart';
import 'package:kelvinapp/presentation/features/game/game_state.dart';
import 'package:kelvinapp/presentation/widgets/commonwidgets/button_widget.dart';
import 'package:kelvinapp/presentation/widgets/commonwidgets/custom_loader.dart';
import 'package:kelvinapp/presentation/widgets/commonwidgets/joypad.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/board_world.dart';
import 'package:kelvinapp/presentation/widgets/gamefiles/temp_game.dart';
import '../../../config/star_type_enum.dart';
import '../../../injection.dart';
import '../../features/game/game_event.dart';
import '../commonwidgets/direction.dart';

@RoutePage()
class MainGameScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainGameScreenState();
  }

}

class MainGameScreenState extends State<MainGameScreen>{

  final _boardWorld = BoardWorld();
  final _logger = locator<LoggerUtils>();
  final _TAG = "MainGameScreenState";
  final _gameTriggers = locator<GameTriggers>();
  bool isStartVisible = false;

  @override
  void initState() {
    super.initState();
    _gameTriggers.starInfoMessageEventStream.listen((String? message) {
      if(message != null && message.isNotEmpty){
        displayBottomSheet(message);
      }
    });
    _gameTriggers.endGameEventStream.listen((bool? startNextScreen) {
      if(startNextScreen != null && startNextScreen){
        isStartVisible= true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment(-.2, 0),
                  image: AssetImage(
                      "assets/images/kevin_app_background.png"),
                  fit: BoxFit.cover),
            ),
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 20),
          ),
          Align(
            alignment: Alignment.center,
            child: GameWidget(
                game: _boardWorld
            ),
          )
        ],
      ),
      bottomNavigationBar: BlocBuilder<GameBloc, GameState>(
        builder: (BuildContext context, GameState state){
          return state.maybeWhen(
              displayBoardGameView: (StarTypeEnum currentStar, int diceCount){
                String filePath = GetAssetFilePath().getStarImagePath(currentStar);
                return Container(
                  decoration: const BoxDecoration(
                      color: Colors.transparent
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Visibility(
                              visible: isStartVisible,
                              child: ButtonWidget(
                                  buttonText: "Start next screen",
                                  onButtonPress: (){
                                    context.router.popAndPush(const GameFinishRoute());
                                  }
                              ),
                            ),
                            Joypad(
                              onDirectionChanged: onJoypadDirectionChanged,
                            )
                          ],
                        )
                      ],
                    ),
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

  void onJoypadDirectionChanged(Direction direction) {
    _logger.log(tag: _TAG, message: "Direction $direction");
    BlocProvider.of<GameBloc>(context).add(const GameEvent.throwDice());
  }

  void displayBottomSheet(String message) async{
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
      ),
      constraints: BoxConstraints(
        maxWidth: 400,
      ),
      context: context,
      barrierColor: Colors.white.withOpacity(0.0),
      builder: (context) {
        return Text(
            message,
            style: TextStyle(
              fontSize: 26
            ),
            textAlign: TextAlign.center,
        );
      },
    );
  }
}