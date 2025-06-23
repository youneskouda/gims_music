import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerProvider with ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  AudioPlayer get player => _player;

  int? _currentIndex;
  int? get currentIndex => _currentIndex;

  bool get isPlaying => _player.playing;

  Future<void> play(String assetPath, int index) async {
  try {
    await _player.setAsset(assetPath);
    await _player.play();
    _currentIndex = index;
    notifyListeners();
  } catch (e) {
    print("Error playing song: $e");
  }
}


  void togglePlayPause() {
    if (_player.playing) {
      _player.pause();
    } else {
      _player.play();
    }
    notifyListeners();
  }

  void stop() {
    _player.stop();
    notifyListeners();
  }
}
