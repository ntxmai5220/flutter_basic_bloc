import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(const ExampleInitial(0)) {
    on<OnChangeTab>((event, emit) async {
      emit(ExampleInitial(event.index));
    });
  }
}
