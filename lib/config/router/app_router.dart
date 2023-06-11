import 'package:auto_route/auto_route.dart';
import 'package:kelvinapp/presentation/widgets/independent/home_screen.dart';
import 'package:kelvinapp/presentation/widgets/independent/splash_screen.dart';

import '../../presentation/widgets/gamefiles/main_game_screen.dart';
import '../../presentation/widgets/independent/about_us_screen.dart';
import '../../presentation/widgets/independent/play_game_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
        page: SplashRoute.page,
        initial: true,
        path: "/splash"
    ),
    AutoRoute(
        page: HomeRoute.page,
        path: "/home",
        children: [
          AutoRoute(
            path: 'playGamePage',
            page: PlayGameRoute.page,
            children: [
              RedirectRoute(path: '*', redirectTo: ''),
            ],
          ),
          AutoRoute(
            path: 'aboutUsPage',
            page: AboutUsRoute.page,
            children: [
              RedirectRoute(path: '*', redirectTo: ''),
            ],
          )
        ]
    ),
    AutoRoute(
        page: MainGameRoute.page,
        path: "/maingame"
    ),
  ];
}