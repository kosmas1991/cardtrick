import 'package:cardtrick/cubits/buttonMode/button_mode_cubit.dart';
import 'package:cardtrick/cubits/counter/counter_cubit.dart';
import 'package:cardtrick/cubits/current21Deck/current21_deck_cubit.dart';
import 'package:cardtrick/cubits/instruction/instruction_cubit.dart';
import 'package:cardtrick/firebase_options.dart';
import 'package:cardtrick/screens/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) =>
              InstructionCubit(counterCubit: context.read<CounterCubit>()),
        ),
        BlocProvider<Current21DeckCubit>(
          create: (context) => Current21DeckCubit(),
        ),
        BlocProvider<ButtonModeCubit>(
          create: (context) =>
              ButtonModeCubit(counterCubit: context.read<CounterCubit>()),
        ),
      ],
      child: MaterialApp(
        title: 'cardtrick',
        home: const HomePage(),
      ),
    );
  }
}
