import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/widgets/password_text_field.dart';
import 'package:untitled1/widgets/phono_input_field.dart';
import '../bloc/singupbloc/singup.dart';
import 'customer_text_field.dart';
class SingUpFormEields extends StatelessWidget {
  const SingUpFormEields({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc= BlocProvider.of<SignupBloc>(context);
    return Column(
      children: [
        CustomTextField(
          hintText: 'Full Name',
          keyboardType: TextInputType.name,
          controller: bloc.usernameController,
        ),
        CustomTextField(
          hintText: 'Email Address',
          keyboardType: TextInputType.emailAddress,
          controller: bloc.emailController,
        ),
        PhoneInputField(
          keyboardType: TextInputType.phone,
          controller:  bloc.phoneNumberController,
        ),
        PasswordTextField(
          hintText: 'Password',
          controller:  bloc.passwordController,
        ),
        PasswordTextField(
          hintText: 'Confirm Password',
          controller: bloc.confirmPasswordController,
        ),
        const CustomTextField(
          hintText: 'Enter referral code (Optional)',
        ),
      ],
    );
  }
}
