import 'package:bloc/bloc.dart';
import 'splash_changed_event.dart';
import 'splash_changed_state.dart';

class SplashChangedBloc extends Bloc<SplashChangedEvent, SplashChangedState> {
  SplashChangedBloc() : super(const SplashChangedState(counter: 0)) {
    on<IncrementCounter>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });

    on<DecrementCounter>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1));
    });

    on<EndOnBoarding>((event, emit) {
      emit(state.copyWith(counter: 0));
    });
  }
}
