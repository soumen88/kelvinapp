import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kelvinapp/config/star_type_enum.dart';

part 'game_event.freezed.dart';

@freezed
class GameEvent with _$GameEvent {
  const factory GameEvent.throwDice() = _ThrowDice;
  const factory GameEvent.initGame() = _InitGame;
}