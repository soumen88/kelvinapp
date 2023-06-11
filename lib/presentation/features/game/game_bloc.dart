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

  GameBloc() : super(const GameState.displayBoardGameView(StarTypeEnum.BLACK_STAR)){
    on<GameEvent>((events, emit) async{
      await events.map(
          throwDice: (event) async{

            return await _throwDiceState(event, emit, event.currentStar);
          },
          movePlayer: (event) async => await _boardGameState(event, emit),
      );
    });
  }

  Future<void> _throwDiceState(GameEvent event, Emitter<GameState> emit, StarTypeEnum currentStar) async{
    _gameTriggers.addCurrentPlayerEvent(currentStar);
    emit(const GameState.displayDiceGameView());
  }

  Future<void> _boardGameState(GameEvent event, Emitter<GameState> emit) async{
    emit(const GameState.displayBoardGameView(StarTypeEnum.BLACK_STAR));
  }
}