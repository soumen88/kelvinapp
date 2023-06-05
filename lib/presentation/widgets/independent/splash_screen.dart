import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelvinapp/config/logger_utils.dart';
import 'package:kelvinapp/injection.dart';
import 'package:kelvinapp/presentation/features/splash/splash_bloc.dart';
import 'package:kelvinapp/presentation/features/splash/splash_state.dart';

@RoutePage()
class SplashScreen extends StatelessWidget{
  final _logger = locator<LoggerUtils>();
  final _TAG = "SplashScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (BuildContext context, SplashState state){
          _logger.log(tag: _TAG, message: "State is $state");
        },
        builder: (BuildContext context, SplashState state){
          return Center(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/app_logo.png")
                )
              ),
              child: ElevatedButton(
                onPressed: (){
                  _logger.log(tag: _TAG, message: "Test message");
                },
                child: Text("Test"),
              ),
            ),
          );
        },
      ),
    );
  }

}