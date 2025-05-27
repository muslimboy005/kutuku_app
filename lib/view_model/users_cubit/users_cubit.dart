import 'package:cubit_lesson/view_model/api_viewmodel.dart';
import 'package:cubit_lesson/view_model/users_cubit/users_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(InitialState());

  final api = ApiViewmodel();

  void fetchUsers() async {
    emit(LoadingState());
    try {
      final users = await api.getUsers();
      emit(SucseccState(users));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  void postUsers(Map<String, dynamic> body) async {
    emit(LoadingState());
    try {
      final users = await api.postUser(body);
      emit(SucseccState(users));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
