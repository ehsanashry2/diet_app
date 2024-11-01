import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneInputField extends StatelessWidget {
  final bool isError;
  final TextInputType keyboardType;
  const PhoneInputField({super.key, this.isError = false, required this.keyboardType, required TextEditingController controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isError ? Colors.red : const Color(0xffBFBFBF),
          ),
        ),
        child: IntlPhoneField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            hintStyle: TextStyle(color: Color(0xffBFBFBF)),
          ),
          initialCountryCode: 'EG',
          onChanged: (phone) {
          },
        ),
      ),
    );
  }
}

