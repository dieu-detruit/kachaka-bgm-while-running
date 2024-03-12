import 'package:flutter/material.dart';
import 'package:kachaka_bgm_while_running/kachaka_state_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => KachakaStateProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Consumer<KachakaStateProvider>(
            builder: (context, provider, child) {
              return const Text('音楽再生状態を監視中...');
            },
          ),
        ),
      ),
    );
  }
}
