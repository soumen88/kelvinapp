import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kelvinapp/config/logger_utils.dart';
import 'package:kelvinapp/config/router/app_router.dart';
import 'package:kelvinapp/config/tuple.dart';
import 'package:lottie/lottie.dart';
import '../../../injection.dart';

@RoutePage()
class PlayGameScreen extends StatelessWidget{
  final _logger = locator<LoggerUtils>();
  final _TAG = "PlayGameScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 300,
                child: Lottie.asset("assets/lottiefiles/astronaut_animation.json"),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text("Star's Fate, is an educational game wherein we tell you a lot about astro physics. To know more start playing!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                  onPressed: () async{
                    context.router.navigate(const MainGameRoute());
                  },
                  child: Image.asset("assets/images/start-button.png",
                    width: 120,
                    height: 120,
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

}