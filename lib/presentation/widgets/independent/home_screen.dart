
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kelvinapp/config/router/app_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


@RoutePage()
class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: Color(0xFF1c1a5f),
      routes: const [
        PlayGameRoute(),
        AboutUsRoute()
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: (int index){
            //context.read(counterProvider).pageStatus(index);
            return tabsRouter.setActiveIndex(index);
          },
          items: [
            SalomonBottomBarItem(
              selectedColor: Colors.white,
              icon: const Icon(
                Icons.gamepad,
                color: Colors.white,
                size: 30,
              ),
              title: Text("Start Game"),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.white,
              icon: const Icon(
                Icons.account_box_outlined,
                color: Colors.white,
                size: 30,
              ),
              title: Text("About us"),
            ),
          ],
        );
      },
    );
  }

}