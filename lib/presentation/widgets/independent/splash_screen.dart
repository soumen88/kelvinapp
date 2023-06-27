import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelvinapp/config/logger_utils.dart';
import 'package:kelvinapp/config/router/app_router.dart';
import 'package:kelvinapp/injection.dart';
import 'package:kelvinapp/presentation/features/splash/splash_bloc.dart';
import 'package:kelvinapp/presentation/features/splash/splash_event.dart';
import 'package:kelvinapp/presentation/features/splash/splash_state.dart';

@RoutePage()
class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }

}

class _SplashScreenState extends State<SplashScreen>{
  final _logger = locator<LoggerUtils>();
  final _TAG = "SplashScreen";


  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<SplashBloc>(context).add(const SplashEvent.initialiseSplashView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (BuildContext context, SplashState state){
          //_logger.log(tag: _TAG, message: "State is $state");
          state.maybeWhen(
              startNextScreen: (){
                //context.router.replace(const MainGameRoute());
                context.router.replace(const HomeRoute());
              },
              orElse: (){

              }
          );
        },
        builder: (BuildContext context, SplashState state){
          return Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment(-.2, 0),
                      image: AssetImage(
                          "assets/images/kevin_app_background.png"),
                      fit: BoxFit.cover),
                ),
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 20),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/app_new_logo.png",
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text("Star's Fate",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

}