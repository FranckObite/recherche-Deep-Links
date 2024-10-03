
import 'package:flutter/material.dart';

import 'green.dart';
import 'red.dart';
import 'services/context_utility.dart';
import 'services/uni_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UniService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: ContextUtility.navigatorKey,
      title: 'Flutter Unilinking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (_) => const InitialSreen(),
        '/green': (_) => const Green(),
        '/red': (_) => const Red()
      },
    );
  }
}

class InitialSreen extends StatelessWidget {
  const InitialSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
