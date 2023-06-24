import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class GameFinishScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _GameFinishScreenState();
  }

}
class _GameFinishScreenState extends State<GameFinishScreen>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/lottiefiles/game_finish.json"),
            SizedBox(
              height: 30,
            ),
            Text(
                "Thank you for Playing, Hope you liked it!",
                style: TextStyle(
                  fontSize: 20
                ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async{
                  context.router.popUntilRoot();
                },
                child: Image.asset("assets/images/play_again_button.png",
                  width: 120,
                  height: 120,
                )
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}