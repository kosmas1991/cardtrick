import 'dart:convert';

import 'package:cardtrick/cubits/instruction/instruction_cubit.dart';
import 'package:cardtrick/models/21pickedcards.dart';
import 'package:cardtrick/models/newdeck.dart';
import 'package:cardtrick/widgets/showbutton.dart';
import 'package:cardtrick/widgets/showcards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<PickedCards21> pickedCards21;
  @override
  void initState() {
    pickedCards21 = fetchNewDeck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Flexible(
            flex: 5,
            child: Container(
                color: Colors.black,
                constraints: BoxConstraints.expand(),
                child: Center(
                  child: Text(
                    '${context.watch<InstructionCubit>().state.instruction}',
                    style: TextStyle(color: Colors.yellow, fontSize: 20),
                  ),
                ))),
        Flexible(
            flex: 100,
            child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                constraints: BoxConstraints.expand(),
                child: Column(
                  children: [
                    Flexible(
                        flex: 9,
                        child: FutureBuilder(
                          future: pickedCards21,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ShowCards(
                                cards: snapshot.data!.cards!,
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                        )),
                    Flexible(flex: 1, child: ShowButton()),
                  ],
                ))),
        Flexible(
            flex: 5,
            child: Container(
                color: Colors.black,
                constraints: BoxConstraints.expand(),
                child: Center(
                    child: Text(
                  'If you lie to me, I\'ll lie also to you',
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                )))),
      ],
    )));
  }

  Future<PickedCards21> fetchNewDeck() async {
    final newDeck;
    final response = await http.get(Uri.parse(
        'https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1'));

    if (response.statusCode == 200) {
      newDeck =
          NewDeck.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed');
    }
    final response2 = await http.get(Uri.parse(
        'https://deckofcardsapi.com/api/deck/${newDeck.deckId}/draw/?count=21'));
    print('New deck id: ${newDeck.deckId} ');

    if (response2.statusCode == 200) {
      print(response2.body);
      return PickedCards21.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed');
    }
  }
}
