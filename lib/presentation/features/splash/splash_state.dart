import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.displayView() = _DisplaySplashView;
  const factory SplashState.loading() = _SplashLoading;
  const factory SplashState.startNextScreen() = _StartNextScreen;
}