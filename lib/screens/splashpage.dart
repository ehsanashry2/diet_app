import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/configuration/route.dart';
import 'package:untitled1/configuration/theme.dart';

import '../configuration/shared_keys.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double width = 130;
  double height = 153;
  late Timer timer;

  Future<void> _checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLogin = prefs.getBool(SharedKeys.islogin) ?? false;
    if (isLogin == true) {
      Navigator.pushReplacementNamed(context, RouteApp.BottomBarNavigator);
    } else {
      Navigator.pushReplacementNamed(context, RouteApp.login);
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      _checkLogin();
    });
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
          Positioned(
            right: 0,
            left: MediaQuery.of(context).size.width / 2 - 50,
            bottom: 320,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Cation",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: App_theme.primary,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: AnimatedContainer(
              width: width,
              height: height,
              duration: const Duration(seconds: 1),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/images/Frame2.png"),
                ),
              ),
            ),
          ),
          Center(
            child: AnimatedContainer(
              width: width,
              height: height,
              duration: const Duration(seconds: 1),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/images/Frame2.png"),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
