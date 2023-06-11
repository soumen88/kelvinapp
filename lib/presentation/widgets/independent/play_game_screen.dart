import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kelvinapp/config/logger_utils.dart';
import 'package:kelvinapp/config/router/app_router.dart';
import 'package:kelvinapp/config/tuple.dart';

import '../../../injection.dart';

@RoutePage()
class PlayGameScreen extends StatelessWidget{
  final _logger = locator<LoggerUtils>();
  final _TAG = "PlayGameScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Inside play game screen"),
            ElevatedButton(
                onPressed: () async{
                  var result = await context.router.push(const MainGameRoute()) ;
                  Tuple<String, String> data = result as Tuple<String, String>;
                  _logger.log(tag: _TAG, message: "Result received $result");
                  _logger.log(tag: _TAG, message: "Data received ${data.item1}");
                },
                child: Text("Start Game")
            )
          ],
        ),
      ),
    );
  }

}