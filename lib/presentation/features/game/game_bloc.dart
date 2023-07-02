import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelvinapp/config/star_type_enum.dart';
import 'package:kelvinapp/domain/game_triggers.dart';
import 'package:kelvinapp/presentation/features/game/game_event.dart';
import 'package:kelvinapp/presentation/features/game/game_state.dart';

import '../../../config/logger_utils.dart';
import '../../../injection.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final _logger = locator<LoggerUtils>();
  final _TAG = "GameBloc";
  final _gameTriggers = locator<GameTriggers>();
  StarTypeEnum currentStar = StarTypeEnum.BLUE_STAR;

  GameBloc() : super(const GameState.displayBoardGameView(StarTypeEnum.BLUE_STAR, 0)){
    on<GameEvent>((events, emit) async{
      await events.map(
          throwDice: (event) async{
            return await _throwDiceState(event, emit);
          },
          initGame:(event) async{
            return await _initGame(event, emit);
          }
      );
    });
  }

  ///Once dice is thrown, depending upon what star it was currently next star is picked
  ///Sequence for stars is Black -> White -> Yellow -> repeat
  Future<void> _throwDiceState(GameEvent event, Emitter<GameState> emit) async{
   switch(currentStar){
      case StarTypeEnum.BLUE_STAR:{
        currentStar = StarTypeEnum.ORANGE_STAR;
      }

      case StarTypeEnum.ORANGE_STAR:{
        currentStar = StarTypeEnum.YELLOW_STAR;
      }

      case StarTypeEnum.YELLOW_STAR:{
        currentStar = StarTypeEnum.BLUE_STAR;
      }
    }
    _logger.log(tag: _TAG, message: "Starting game now");
    _gameTriggers.addCurrentPlayerEvent(currentStar);
    _gameTriggers.addAnimationEvent(true);
    emit(GameState.displayBoardGameView(currentStar, 0));
  }

  Future<void> _initGame(GameEvent event, Emitter<GameState> emit) async{
    _gameTriggers.addEndGameEvent(false);
  }
}