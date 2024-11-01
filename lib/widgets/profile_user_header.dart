import 'package:flutter/material.dart';

import '../configuration/theme.dart';
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/profile.png'),
              fit: BoxFit.cover,
            ),)),

        const SizedBox(width:16 ,),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mohammed Ali',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            Text(
              'Mohamed@example.com',
              style: TextStyle(fontSize: 14, color: App_theme.hinttextcolor),
            ),
          ],
        ),
      ],
    );
  }
}
