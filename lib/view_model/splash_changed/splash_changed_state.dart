
final class SplashChangedState {
  int counter;
  SplashChangedState({required this.counter});

  SplashChangedState copyWith({int? counter}) =>
      (SplashChangedState(counter: counter ?? this.counter));
}
