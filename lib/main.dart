import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/core/cubits/price_tracker_cubit.dart';
import 'package:price_tracker/core/cubits/price_tracker_state.dart';
import 'package:price_tracker/ui/price_tracker_home.dart';
import 'package:price_tracker/ui/splash_screen.dart';

void main() {
  runApp(BlocProvider(create: (create) => PriceTrackerCubit(const PriceTrackerState()),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const MyHomePage(title: 'Price Tracker'),
      },
      debugShowCheckedModeBanner: false,
      title: 'Price Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
       return const Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: PriceTrackerHome()
    );
  }
}
