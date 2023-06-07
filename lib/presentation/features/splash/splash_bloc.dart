import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelvinapp/config/logger_utils.dart';
import 'package:kelvinapp/injection.dart';
import 'package:kelvinapp/presentation/features/splash/splash_event.dart';
import 'package:kelvinapp/presentation/features/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState>{
  final _logger = locator<LoggerUtils>();
  final _TAG = "SplashBloc";

  SplashBloc() : super(const SplashState.displayView()){
    on<SplashEvent>((events, emit) async{
      await events.map(
          initialiseSplashView: (event) async => await _init(event, emit)
      );
    });
  }


  Future<void> _init(SplashEvent event, Emitter<SplashState> emit) async{
    _logger.log( tag: _TAG, message: "inside init function");
    emit(const SplashState.displayView());
    await Future.delayed(Duration(milliseconds: 100));
    emit(const SplashState.startNextScreen());
  }
}