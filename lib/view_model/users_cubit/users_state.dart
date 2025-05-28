abstract class UsersState {}

class InitialState extends UsersState {}

class LoadingState extends UsersState {}

class SuccessState extends UsersState {
  final Map users;
  SuccessState(this.users);
}

class ErrorState extends UsersState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}
