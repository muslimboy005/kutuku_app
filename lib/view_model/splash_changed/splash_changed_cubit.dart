import 'package:bloc/bloc.dart';
import 'package:cubit_lesson/view_model/splash_changed/splash_changed_state.dart';

class SplashChangedCubit extends Cubit<SplashChangedState> {
  SplashChangedCubit()
      : super(SplashChangedState(counter: 0));

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrement() {
    emit(state.copyWith(counter: state.counter - 1));
  }

  void endOnBoarding() {
    emit(state.copyWith(counter: state.counter = 0));
  }
}
