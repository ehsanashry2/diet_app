import 'package:flutter/cupertino.dart';
import 'package:untitled1/widgets/password_text_field.dart';
import 'package:untitled1/widgets/phono_input_field.dart';
import 'customer_text_field.dart';
class SignupFormFields extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  SignupFormFields({
    required this.usernameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(hintText: 'Full Name', controller: usernameController),
        CustomTextField(hintText: 'Email Address', controller: emailController),
        PhoneInputField(controller: phoneNumberController, keyboardType:TextInputType.phone,),
        PasswordTextField(hintText: 'Password', controller: passwordController),
        PasswordTextField(hintText: 'Confirm Password', controller: confirmPasswordController),
        CustomTextField(hintText: 'Enter referral code (Optional)'),
      ],
    );
  }
}
