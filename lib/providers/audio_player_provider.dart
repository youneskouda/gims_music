import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerProvider with ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  AudioPlayer get player => _player;

  int? _currentIndex;
  int? get currentIndex => _currentIndex;

  bool get isPlaying => _player.playing;

  /// Play a new song by asset path and index
  Future<void> play(String assetPath, int index) async {
    try {
      await _player.stop(); // ✅ Stop current song
      await _player.setAsset(assetPath); // ✅ Load new song
      await _player.play(); // ✅ Play new song
      _currentIndex = index;
      notifyListeners();
    } catch (e) {
      print("Error playing song: $e");
    }
  }

  /// Pause or resume playback
  void togglePlayPause() {
    if (_player.playing) {
      _player.pause();
    } else {
      _player.play();
    }
    notifyListeners();
  }

  /// Stop the player completely
  void stop() {
    _player.stop();
    notifyListeners();
  }

  /// Go to the next song if available
  Future<void> playNext(List<String> songPaths) async {
    if (_currentIndex != null && _currentIndex! + 1 < songPaths.length) {
      await play(songPaths[_currentIndex! + 1], _currentIndex! + 1);
    }
  }

  /// Go to the previous song if available
  Future<void> playPrevious(List<String> songPaths) async {
    if (_currentIndex != null && _currentIndex! > 0) {
      await play(songPaths[_currentIndex! - 1], _currentIndex! - 1);
    }
  }
}
