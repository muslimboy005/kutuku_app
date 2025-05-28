import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubit_lesson/view_model/api_viewmodel.dart';
import 'users_event.dart';
import 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final ApiViewmodel api=ApiViewmodel();

  UsersBloc() : super(InitialState()) {
    on<FetchUsersEvent>(_onFetchUsers);
    on<PostUsersEvent>(_onPostUsers);
  }

  Future<void> _onFetchUsers(
      FetchUsersEvent event, Emitter<UsersState> emit) async {
    emit(LoadingState());
    try {
      final users = await api.getUsers();
      emit(SuccessState(users));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  Future<void> _onPostUsers(
      PostUsersEvent event, Emitter<UsersState> emit) async {
    emit(LoadingState());
    try {
      final users = await api.postUser(event.body);
      emit(SuccessState(users));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
