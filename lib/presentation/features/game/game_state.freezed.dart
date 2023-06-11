// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StarTypeEnum currentStar) displayBoardGameView,
    required TResult Function() displayDiceGameView,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StarTypeEnum currentStar)? displayBoardGameView,
    TResult? Function()? displayDiceGameView,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StarTypeEnum currentStar)? displayBoardGameView,
    TResult Function()? displayDiceGameView,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DisplayBoardGameView value) displayBoardGameView,
    required TResult Function(_DisplayDiceGameView value) displayDiceGameView,
    required TResult Function(_GameLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DisplayBoardGameView value)? displayBoardGameView,
    TResult? Function(_DisplayDiceGameView value)? displayDiceGameView,
    TResult? Function(_GameLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DisplayBoardGameView value)? displayBoardGameView,
    TResult Function(_DisplayDiceGameView value)? displayDiceGameView,
    TResult Function(_GameLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_DisplayBoardGameViewCopyWith<$Res> {
  factory _$$_DisplayBoardGameViewCopyWith(_$_DisplayBoardGameView value,
          $Res Function(_$_DisplayBoardGameView) then) =
      __$$_DisplayBoardGameViewCopyWithImpl<$Res>;
  @useResult
  $Res call({StarTypeEnum currentStar});
}

/// @nodoc
class __$$_DisplayBoardGameViewCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$_DisplayBoardGameView>
    implements _$$_DisplayBoardGameViewCopyWith<$Res> {
  __$$_DisplayBoardGameViewCopyWithImpl(_$_DisplayBoardGameView _value,
      $Res Function(_$_DisplayBoardGameView) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStar = null,
  }) {
    return _then(_$_DisplayBoardGameView(
      null == currentStar
          ? _value.currentStar
          : currentStar // ignore: cast_nullable_to_non_nullable
              as StarTypeEnum,
    ));
  }
}

/// @nodoc

class _$_DisplayBoardGameView implements _DisplayBoardGameView {
  const _$_DisplayBoardGameView(this.currentStar);

  @override
  final StarTypeEnum currentStar;

  @override
  String toString() {
    return 'GameState.displayBoardGameView(currentStar: $currentStar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DisplayBoardGameView &&
            (identical(other.currentStar, currentStar) ||
                other.currentStar == currentStar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentStar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DisplayBoardGameViewCopyWith<_$_DisplayBoardGameView> get copyWith =>
      __$$_DisplayBoardGameViewCopyWithImpl<_$_DisplayBoardGameView>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StarTypeEnum currentStar) displayBoardGameView,
    required TResult Function() displayDiceGameView,
    required TResult Function() loading,
  }) {
    return displayBoardGameView(currentStar);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StarTypeEnum currentStar)? displayBoardGameView,
    TResult? Function()? displayDiceGameView,
    TResult? Function()? loading,
  }) {
    return displayBoardGameView?.call(currentStar);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StarTypeEnum currentStar)? displayBoardGameView,
    TResult Function()? displayDiceGameView,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (displayBoardGameView != null) {
      return displayBoardGameView(currentStar);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DisplayBoardGameView value) displayBoardGameView,
    required TResult Function(_DisplayDiceGameView value) displayDiceGameView,
    required TResult Function(_GameLoading value) loading,
  }) {
    return displayBoardGameView(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DisplayBoardGameView value)? displayBoardGameView,
    TResult? Function(_DisplayDiceGameView value)? displayDiceGameView,
    TResult? Function(_GameLoading value)? loading,
  }) {
    return displayBoardGameView?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DisplayBoardGameView value)? displayBoardGameView,
    TResult Function(_DisplayDiceGameView value)? displayDiceGameView,
    TResult Function(_GameLoading value)? loading,
    required TResult orElse(),
  }) {
    if (displayBoardGameView != null) {
      return displayBoardGameView(this);
    }
    return orElse();
  }
}

abstract class _DisplayBoardGameView implements GameState {
  const factory _DisplayBoardGameView(final StarTypeEnum currentStar) =
      _$_DisplayBoardGameView;

  StarTypeEnum get currentStar;
  @JsonKey(ignore: true)
  _$$_DisplayBoardGameViewCopyWith<_$_DisplayBoardGameView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DisplayDiceGameViewCopyWith<$Res> {
  factory _$$_DisplayDiceGameViewCopyWith(_$_DisplayDiceGameView value,
          $Res Function(_$_DisplayDiceGameView) then) =
      __$$_DisplayDiceGameViewCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DisplayDiceGameViewCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$_DisplayDiceGameView>
    implements _$$_DisplayDiceGameViewCopyWith<$Res> {
  __$$_DisplayDiceGameViewCopyWithImpl(_$_DisplayDiceGameView _value,
      $Res Function(_$_DisplayDiceGameView) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DisplayDiceGameView implements _DisplayDiceGameView {
  const _$_DisplayDiceGameView();

  @override
  String toString() {
    return 'GameState.displayDiceGameView()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DisplayDiceGameView);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StarTypeEnum currentStar) displayBoardGameView,
    required TResult Function() displayDiceGameView,
    required TResult Function() loading,
  }) {
    return displayDiceGameView();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StarTypeEnum currentStar)? displayBoardGameView,
    TResult? Function()? displayDiceGameView,
    TResult? Function()? loading,
  }) {
    return displayDiceGameView?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StarTypeEnum currentStar)? displayBoardGameView,
    TResult Function()? displayDiceGameView,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (displayDiceGameView != null) {
      return displayDiceGameView();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DisplayBoardGameView value) displayBoardGameView,
    required TResult Function(_DisplayDiceGameView value) displayDiceGameView,
    required TResult Function(_GameLoading value) loading,
  }) {
    return displayDiceGameView(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DisplayBoardGameView value)? displayBoardGameView,
    TResult? Function(_DisplayDiceGameView value)? displayDiceGameView,
    TResult? Function(_GameLoading value)? loading,
  }) {
    return displayDiceGameView?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DisplayBoardGameView value)? displayBoardGameView,
    TResult Function(_DisplayDiceGameView value)? displayDiceGameView,
    TResult Function(_GameLoading value)? loading,
    required TResult orElse(),
  }) {
    if (displayDiceGameView != null) {
      return displayDiceGameView(this);
    }
    return orElse();
  }
}

abstract class _DisplayDiceGameView implements GameState {
  const factory _DisplayDiceGameView() = _$_DisplayDiceGameView;
}

/// @nodoc
abstract class _$$_GameLoadingCopyWith<$Res> {
  factory _$$_GameLoadingCopyWith(
          _$_GameLoading value, $Res Function(_$_GameLoading) then) =
      __$$_GameLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GameLoadingCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$_GameLoading>
    implements _$$_GameLoadingCopyWith<$Res> {
  __$$_GameLoadingCopyWithImpl(
      _$_GameLoading _value, $Res Function(_$_GameLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GameLoading implements _GameLoading {
  const _$_GameLoading();

  @override
  String toString() {
    return 'GameState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GameLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StarTypeEnum currentStar) displayBoardGameView,
    required TResult Function() displayDiceGameView,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StarTypeEnum currentStar)? displayBoardGameView,
    TResult? Function()? displayDiceGameView,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StarTypeEnum currentStar)? displayBoardGameView,
    TResult Function()? displayDiceGameView,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DisplayBoardGameView value) displayBoardGameView,
    required TResult Function(_DisplayDiceGameView value) displayDiceGameView,
    required TResult Function(_GameLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DisplayBoardGameView value)? displayBoardGameView,
    TResult? Function(_DisplayDiceGameView value)? displayDiceGameView,
    TResult? Function(_GameLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DisplayBoardGameView value)? displayBoardGameView,
    TResult Function(_DisplayDiceGameView value)? displayDiceGameView,
    TResult Function(_GameLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _GameLoading implements GameState {
  const factory _GameLoading() = _$_GameLoading;
}
