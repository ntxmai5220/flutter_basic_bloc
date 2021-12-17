part of 'example_bloc.dart';

@immutable
abstract class ExampleEvent {}

class OnChangeTab extends ExampleEvent {
  final int index;

  OnChangeTab(this.index);
}

class LoadingInitial extends ExampleEvent{

}