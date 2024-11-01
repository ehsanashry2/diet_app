import 'package:flutter/material.dart';

import '../configuration/theme.dart';
class AuthCustomApppBar extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onIconTap;
  const AuthCustomApppBar({super.key, this.icon, this.onIconTap});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 280,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (icon != null)
          Positioned(
            top: 57,
            left: 24,
            child: GestureDetector(
              onTap: onIconTap,
              child: CircleAvatar(
                radius: 18,
                backgroundColor:  App_theme.backgroundwhite,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:  App_theme.black,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor:  App_theme.backgroundwhite,
                    child: Icon(
                      icon,
                      color:  App_theme.black,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        Positioned(
          top: 57,
          left: 0,
          right: 0,
          child: SizedBox(
            width: 75,
            height: 90,
            child: Image.asset('assets/images/Frame.png'),
          ),
        ),
      ],
    );
  }
}
