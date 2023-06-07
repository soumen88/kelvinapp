import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelvinapp/presentation/features/game/game_bloc.dart';
import 'package:kelvinapp/presentation/features/splash/splash_bloc.dart';

import 'config/router/app_router.dart';
import 'injection.dart';

void main() async{
  await init();
  runApp(MyApp());
}

Future<void> init() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

}
class MyApp extends StatelessWidget {

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => SplashBloc()),
        BlocProvider(create: (BuildContext context) => GameBloc())
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
