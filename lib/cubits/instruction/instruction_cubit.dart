import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cardtrick/cubits/counter/counter_cubit.dart';
import 'package:equatable/equatable.dart';

part 'instruction_state.dart';

class InstructionCubit extends Cubit<InstructionState> {
  late final StreamSubscription counterStreamSubscription;
  final CounterCubit counterCubit;
  InstructionCubit({required this.counterCubit})
      : super(InstructionState.initial()) {
    counterStreamSubscription =
        counterCubit.stream.listen((CounterState counterState) {
      if (counterState.counter == 3) {
        emit(state.copyWith(instruction: 'Your card is shown below'));
      }
            if (counterState.counter == 1) {
        emit(state.copyWith(instruction: 'Show me again'));
      }
            if (counterState.counter == 2) {
        emit(state.copyWith(instruction: 'One last time'));
      }
    });
  }

  emitNewInstruction(String newInstruction) {
    emit(state.copyWith(instruction: newInstruction));
  }

  @override
  Future<void> close() {
    counterStreamSubscription.cancel();
    return super.close();
  }
}
