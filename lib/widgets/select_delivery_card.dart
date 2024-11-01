import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../configuration/theme.dart';

class SelectDeliveryCard extends StatelessWidget {
  final String label;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectDeliveryCard({
    Key? key,
    required this.label,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 164,
          height: 52,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xffE8F2EC) : Colors.white,
            border: Border.all(
              color: isSelected ? const Color(0xffE8F2EC) : const Color(0xffEDEDED),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(color: App_theme.black, fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

