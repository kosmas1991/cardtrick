import 'package:cardtrick/models/21pickedcards.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ShowCards extends StatelessWidget {
  final List<Cards> cards;
  const ShowCards({required this.cards, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          21,
          (_) => Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://deckofcardsapi.com/static/img/back.png',
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(10)),
    );
  }
}
