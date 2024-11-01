abstract class AppState {}
class InitialState extends AppState {}
class LoadingState extends AppState {}
class SuccessState extends AppState {
  final dynamic data ;
  SuccessState({required this.data});
}
class EmptyState extends AppState {}
class FailureState extends AppState {
  final String error;

  FailureState({ this.error="error"});
}