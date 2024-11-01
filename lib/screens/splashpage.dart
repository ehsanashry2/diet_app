import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled1/configuration/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {
  double width = 130;
  double height = 153;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
       const Duration(seconds: 1),
          (timer) {
        setState(() {
          if (width == 130) {
            width = 180;
            height = 200;
          } else {
            width = 130;
            height = 153;
          }
        });
      },
    );


    Timer(
      const Duration(seconds: 10),
          () {
        Navigator.pushReplacementNamed(context, '/HomePage');
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AnimatedContainer(
              width: width,
              height: height,
              duration: const Duration(seconds: 1),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/images/Frame2.png")
                )
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: MediaQuery.of(context).size.width / 2 - 50,
            bottom: 40,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Richdiets 2023",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: App_theme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
