import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cardtrick/cubits/counter/counter_cubit.dart';
import 'package:equatable/equatable.dart';

part 'button_mode_state.dart';

class ButtonModeCubit extends Cubit<ButtonModeState> {
  late final StreamSubscription counterStreamSubscription;
  final CounterCubit counterCubit;
  ButtonModeCubit({required this.counterCubit})
      : super(ButtonModeState.initial()) {
    counterStreamSubscription =
        counterCubit.stream.listen((CounterState counterState) {
      if (counterState.counter == 3) {
        emit(state.copyWith(buttonMode: ButtonMode.restartButton));
      }
      if (counterState.counter == 0) {
        emit(state.copyWith(buttonMode: ButtonMode.oneButton));
      }
    });
  }

  emitNewButtonState(ButtonMode newButtonMode) {
    emit(state.copyWith(buttonMode: newButtonMode));
  }

  @override
  Future<void> close() {
    counterStreamSubscription.cancel();
    return super.close();
  }
}
