import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled1/configuration/theme.dart';
import '../models/profile_model.dart';
import '../widgets/profile_item_tile.dart';
import '../widgets/profile_user_header.dart';
import '../widgets/profile_wallet.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App_theme.backgroundwhite,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        backgroundColor: App_theme.backgroundwhite,
        elevation: 0,
        actions: [
          SvgPicture.asset(
            "assets/icons/setting.svg",
            width: 24,
            height: 24,
          ),
          SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const ProfileHeader(),
              const SizedBox(height: 24),
              ProfileWallet(),
              const SizedBox(height: 32),
              ProfileDesign(items: items),
            ],
          ),
        ),
      ),
    );
  }
}
