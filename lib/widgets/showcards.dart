import 'package:cardtrick/cubits/current21Deck/current21_deck_cubit.dart';
import 'package:cardtrick/models/deck21.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playing_cards/playing_cards.dart';

class ShowCards extends StatelessWidget {
  const ShowCards({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: BlocBuilder<Current21DeckCubit, Current21DeckState>(
        builder: (context, state) {
          return GridView.count(
            childAspectRatio: 11 / 16,
            crossAxisCount: 3,
            children: List.generate(
                21,
                (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PlayingCardView(card: state.list[index]),
                    )),
          );
        },
      ),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(10)),
    );
  }
}
