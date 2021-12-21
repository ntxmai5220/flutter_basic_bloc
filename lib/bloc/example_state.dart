part of 'example_bloc.dart';

@immutable
abstract class ExampleState {
  final int index;

  const ExampleState(this.index);
}

class ExampleInitial extends ExampleState {
 

  const ExampleInitial(index) : super(index);
}

// class HomeLoaded extends ExampleState {}

// class FavoriteLoaded extends ExampleState {}

// class Loading extends ExampleState {}

// class Error extends ExampleState {}
