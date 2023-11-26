import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'button_mode_state.dart';

class ButtonModeCubit extends Cubit<ButtonModeState> {
  ButtonModeCubit() : super(ButtonModeState.initial());
  

  emitNewButtonState(ButtonMode newButtonMode) {
    emit(state.copyWith(buttonMode: newButtonMode));
  }
}
