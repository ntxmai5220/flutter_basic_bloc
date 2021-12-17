part of 'example_bloc.dart';

@immutable
abstract class ExampleState {}

class ExampleInitial extends ExampleState {}

class HomeLoaded extends ExampleState {}

class FavoriteLoaded extends ExampleState {}

class Loading extends ExampleState{}

class Error extends ExampleState{}
