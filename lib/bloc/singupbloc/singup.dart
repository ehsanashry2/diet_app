import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<AppEvent, AppState> {
  SignupBloc() : super(InitialState())
  {
    on<SingupEvent>(Singup);
  }
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController  phoneNumberController  = TextEditingController();
  TextEditingController  confirmPasswordController  = TextEditingController();
  void Singup (SingupEvent event,Emitter emit )async{
    emit(LoadingState());
    try{
      await _loginRequest(event.username, event.password,event.phonenumber,event.email);
      emit(SuccessState(data: "singup Success"));
    }
    catch(e){
      emit(FailureState(error: e.toString()));

    }


  }
  Future<void> _loginRequest(String username,String password,int phonenumber,String email, ) async{
    await Future.delayed(Duration(seconds: 5));

  }
}