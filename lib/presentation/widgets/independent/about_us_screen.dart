import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AboutUsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/about_us_image.jpg",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                  padding: EdgeInsets.all(16),
                child: Text(
                  "Hi, thanks a lot for playing my game! My name is Kevin Chugh and I am currently pursuing college. The idea came from something I made for a course I did on Astrophysics, which was a board game with the exact same concept. I then thought of stepping it up further and uploading it to the digital world to increase its accessibility, while spreading knowledge.",
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}