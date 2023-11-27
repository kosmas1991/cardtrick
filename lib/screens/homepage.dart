import 'package:cardtrick/cubits/counter/counter_cubit.dart';
import 'package:cardtrick/cubits/instruction/instruction_cubit.dart';
import 'package:cardtrick/widgets/showbutton.dart';
import 'package:cardtrick/widgets/showcards.dart';
import 'package:cardtrick/widgets/showfinalcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80),
                    child: ScrollLoopAutoScroll(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        '${context.watch<InstructionCubit>().state.instruction}',
                        style: TextStyle(color: Colors.yellow, fontSize: 20),
                      ),
                    ),
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
                    BlocBuilder<CounterCubit, CounterState>(
                      builder: (context, state) {
                        return Flexible(
                            flex: 92,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                              child: state.counter == 3
                                  ? ShowFinalCard()
                                  : ShowCards(),
                            ));
                      },
                    ),
                    Flexible(flex: 8, child: ShowButton()),
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
}
