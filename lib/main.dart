import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/audio_player_provider.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioPlayerProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GIMS Music',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
