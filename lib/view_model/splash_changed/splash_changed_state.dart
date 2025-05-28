final class SplashChangedState {
  final int counter;

  const SplashChangedState({required this.counter});

  SplashChangedState copyWith({int? counter}) {
    return SplashChangedState(counter: counter ?? this.counter);
  }
}
