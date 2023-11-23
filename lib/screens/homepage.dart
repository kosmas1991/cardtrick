import 'package:cardtrick/cubits/instruction/instruction_cubit.dart';
import 'package:cardtrick/widgets/showbutton.dart';
import 'package:cardtrick/widgets/showcards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    Flexible(flex: 9, child: ShowCards()),
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

  fetchNewDeck() async {
   
  }
}
