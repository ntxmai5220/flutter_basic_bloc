import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  int _currentIndex = 0;
  ExampleBloc() : super(ExampleInitial()) {
    on<OnChangeTab>((event, emit) async {
      if (_currentIndex != event.index) {
        _currentIndex = event.index;
        if (event.index == 1) {
          emit(Loading());
          await Future.delayed(const Duration(seconds: 1));
          emit(FavoriteLoaded());
        } else if (event.index == 0) {
          // emit(Error());
          // await Future.delayed(const Duration(seconds: 1));
          emit(Loading());
          await Future.delayed(const Duration(seconds: 2));
          emit(HomeLoaded());
        }
      }
    });

    on<LoadingInitial>((event, emit) async {
      emit(Loading());
      await Future.delayed(const Duration(seconds: 1));
      emit(HomeLoaded());
    });
  }

  int get currentIndex => _currentIndex;
}
