import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  addOne() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  setToZero() {
    emit(state.copyWith(counter: 0));
  }
}
