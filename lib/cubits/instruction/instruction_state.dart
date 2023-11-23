part of 'instruction_cubit.dart';

class InstructionState extends Equatable {
  final String instruction;

  InstructionState({required this.instruction});

  factory InstructionState.initial() {
    return InstructionState(instruction: 'Memorize one card');
  }

  @override
  List<Object> get props => [instruction];

  InstructionState copyWith({
    String? instruction,
  }) {
    return InstructionState(
      instruction: instruction ?? this.instruction,
    );
  }

  @override
  bool get stringify => true;
}
