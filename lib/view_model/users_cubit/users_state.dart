abstract class UsersState {}

class InitialState extends UsersState {}

class LoadingState extends UsersState {}

class SucseccState extends UsersState {
  final Map users;
  SucseccState(this.users);
}

class ErrorState extends UsersState {
  final String errorMessege;
  ErrorState(this.errorMessege);
}
