import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelvinapp/presentation/features/game/game_event.dart';
import 'package:kelvinapp/presentation/features/game/game_state.dart';

import '../../../config/logger_utils.dart';
import '../../../injection.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final _logger = locator<LoggerUtils>();
  final _TAG = "GameBloc";
  GameBloc() : super(const GameState.displayBoardGameView()){
    on<GameEvent>((events, emit) async{
      await events.map(
          throwDice: (event) async => await _throwDiceState(event, emit),
          movePlayer: (event) async => await _boardGameState(event, emit),
      );
    });
  }

  Future<void> _throwDiceState(GameEvent event, Emitter<GameState> emit) async{
    emit(const GameState.displayDiceGameView());
  }

  Future<void> _boardGameState(GameEvent event, Emitter<GameState> emit) async{

  }
}