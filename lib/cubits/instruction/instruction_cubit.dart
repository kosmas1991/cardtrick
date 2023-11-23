import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'instruction_state.dart';

class InstructionCubit extends Cubit<InstructionState> {
  InstructionCubit() : super(InstructionState.initial());

  emitNewInstruction(String newInstruction) {
    emit(state.copyWith(instruction: newInstruction));
  }
}
