import 'package:cardtrick/cubits/buttonMode/button_mode_cubit.dart';
import 'package:cardtrick/cubits/counter/counter_cubit.dart';
import 'package:cardtrick/cubits/current21Deck/current21_deck_cubit.dart';
import 'package:cardtrick/cubits/instruction/instruction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowButton extends StatelessWidget {
  const ShowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonModeCubit, ButtonModeState>(
      builder: (context, state) {
        switch (state.buttonMode) {
          case ButtonMode.oneButton:
            return oneButton(context);
          case ButtonMode.threeButtons:
            return threeButtons(context);
          case ButtonMode.restartButton:
            return restartButton(context);
        }
      },
    );
  }
}

Container oneButton(BuildContext context) {
  return Container(
    color: Colors.white,
    constraints: BoxConstraints.expand(),
    child: TextButton(
        onPressed: () {
          context
              .read<ButtonModeCubit>()
              .emitNewButtonState(ButtonMode.threeButtons);
          context.read<Current21DeckCubit>().shuffleDeck21();
          context
              .read<InstructionCubit>()
              .emitNewInstruction('At which column is your card?');
        },
        child: Text(
          'Continue >',
          style: TextStyle(fontSize: 25, color: Colors.black),
        )),
  );
}

Container threeButtons(BuildContext context) {
  return Container(
    color: Colors.white,
    constraints: BoxConstraints.expand(),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      IconButton(
          onPressed: () {
            threeButtonsPressed(context, 'left');
          },
          icon: Icon(
            color: Colors.amber,
            Icons.arrow_circle_up,
            size: 30,
          )),
      IconButton(
          onPressed: () {
            threeButtonsPressed(context, 'middle');
          },
          icon: Icon(
            color: Colors.amber,
            Icons.arrow_circle_up,
            size: 30,
          )),
      IconButton(
          color: Colors.amber,
          onPressed: () {
            threeButtonsPressed(context, 'right');
          },
          icon: Icon(
            Icons.arrow_circle_up,
            size: 30,
          )),
    ]),
  );
}

Container restartButton(BuildContext context) {
  return Container(
    color: Colors.white,
    constraints: BoxConstraints.expand(),
    child: TextButton(
        onPressed: () {
          context.read<CounterCubit>().setToZero();
          context
              .read<InstructionCubit>()
              .emitNewInstruction('Memorize one card');
        },
        child: Text(
          '< Restart',
          style: TextStyle(fontSize: 25, color: Colors.black),
        )),
  );
}

threeButtonsPressed(BuildContext context, String button) {
  switch (button) {
    case 'left':
      context.read<Current21DeckCubit>().leftButtonPressed();
      context.read<CounterCubit>().addOne();
    case 'middle':
      context.read<Current21DeckCubit>().middleButtonPressed();
      context.read<CounterCubit>().addOne();
    case 'right':
      context.read<Current21DeckCubit>().rightButtonPressed();
      context.read<CounterCubit>().addOne();
  }
}
