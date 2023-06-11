import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kelvinapp/config/star_type_enum.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  const factory GameState.displayBoardGameView(StarTypeEnum currentStar, int diceCount) = _DisplayBoardGameView;
  const factory GameState.displayDiceGameView() = _DisplayDiceGameView;
  const factory GameState.loading() = _GameLoading;
}