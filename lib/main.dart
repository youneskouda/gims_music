import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'providers/audio_player_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AudioPlayerProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GIMS Music',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const HomePage(),
      ),
    );
  }
}
