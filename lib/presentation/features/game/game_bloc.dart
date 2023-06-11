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
  StarTypeEnum currentStar = StarTypeEnum.YELLOW_STAR;

  GameBloc() : super(const GameState.displayBoardGameView(StarTypeEnum.YELLOW_STAR, 0)){
    on<GameEvent>((events, emit) async{
      await events.map(
          throwDice: (event) async{
            return await _throwDiceState(event, emit);
          },
      );
    });
  }

  ///Once dice is thrown, depending upon what star it was currently next star is picked
  ///Sequence for stars is Black -> White -> Yellow -> repeat
  Future<void> _throwDiceState(GameEvent event, Emitter<GameState> emit) async{
    /*switch(currentStar){
      case StarTypeEnum.BLACK_STAR:{
        currentStar = StarTypeEnum.WHITE_STAR;
      }

      case StarTypeEnum.WHITE_STAR:{
        currentStar = StarTypeEnum.YELLOW_STAR;
      }

      case StarTypeEnum.YELLOW_STAR:{
        currentStar = StarTypeEnum.BLACK_STAR;
      }
    }*/
    _gameTriggers.addCurrentPlayerEvent(currentStar);
    _gameTriggers.addAnimationEvent(true);
    emit(GameState.displayBoardGameView(currentStar, 0));
  }

}