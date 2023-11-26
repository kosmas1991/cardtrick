part of 'button_mode_cubit.dart';

enum ButtonMode { oneButton, threeButtons, restartButton }

class ButtonModeState extends Equatable {
  final ButtonMode buttonMode;

  ButtonModeState({required this.buttonMode});

  factory ButtonModeState.initial() {
    return ButtonModeState(buttonMode: ButtonMode.oneButton);
  }

  @override
  List<Object> get props => [buttonMode];

  ButtonModeState copyWith({
    ButtonMode? buttonMode,
  }) {
    return ButtonModeState(
      buttonMode: buttonMode ?? this.buttonMode,
    );
  }

  @override
  bool get stringify => true;
}
