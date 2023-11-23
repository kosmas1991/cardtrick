import 'package:cardtrick/cubits/instruction/instruction_cubit.dart';
import 'package:cardtrick/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InstructionCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const HomePage(),
      ),
    );
  }
}
