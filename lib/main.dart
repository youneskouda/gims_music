import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_service/audio_service.dart';

import 'pages/home_page.dart'; // Your homepage file
import 'providers/audio_player_provider.dart';
import 'services/audio_handler.dart'; // You will create this file next

late AudioPlayerHandler audioHandler;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize audio service
  audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.gims.music.channel.audio',
      androidNotificationChannelName: 'GIMS Music Playback',
      androidNotificationOngoing: true,
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioPlayerProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GIMS Music',
        theme: ThemeData.dark(),
        home: HomePage(),
      ),
    );
  }
}
