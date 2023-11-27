import 'package:cardtrick/cubits/current21Deck/current21_deck_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:playing_cards/playing_cards.dart';

class ShowFinalCard extends StatelessWidget {
  const ShowFinalCard({super.key});

  @override
  Widget build(BuildContext context) {
    Vibrate.feedback(FeedbackType.success);
    return BlocBuilder<Current21DeckCubit, Current21DeckState>(
      builder: (context, state) {
        return Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(80.0),
              child: PlayingCardView(
                  card: PlayingCard(state.list[10].suit, state.list[10].value)),
            ),
          ),
        );
      },
    );
  }
}
