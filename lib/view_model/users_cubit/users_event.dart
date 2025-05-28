abstract class UsersEvent {}

class FetchUsersEvent extends UsersEvent {}

class PostUsersEvent extends UsersEvent {
  final Map<String, dynamic> body;

  PostUsersEvent(this.body);
}
