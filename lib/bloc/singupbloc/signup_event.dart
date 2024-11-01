abstract class AppEvent{}
class SingupEvent extends AppEvent{
  final String username;
  final String email;
  final String password;
  final int  phonenumber;



  SingupEvent({required this.email, required this.phonenumber, required this.username, required this.password,});
}
class ClickEvent extends AppEvent{}
class SaveEvent extends AppEvent{}