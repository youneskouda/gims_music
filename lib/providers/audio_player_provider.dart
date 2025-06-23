import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerProvider with ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  AudioPlayer get player => _player;

  int? _currentIndex;
  int? get currentIndex => _currentIndex;

  bool get isPlaying => _player.playing;

  /// Play a new song with updated index and list
  Future<void> play(String assetPath, int index, List<String> songPaths) async {
    try {
      await _player.stop();
      await _player.setAsset(assetPath);
      await _player.play();
      _currentIndex = index;
      notifyListeners();

      // Auto play next song when finished
      _player.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          playNext(songPaths);
        }
      });
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

  /// Stop audio completely
  void stop() {
    _player.stop();
    notifyListeners();
  }

  /// Play next song
  Future<void> playNext(List<String> songPaths) async {
    if (_currentIndex != null && _currentIndex! + 1 < songPaths.length) {
      await play(songPaths[_currentIndex! + 1], _currentIndex! + 1, songPaths);
    }
  }

  /// Play previous song
  Future<void> playPrevious(List<String> songPaths) async {
    if (_currentIndex != null && _currentIndex! > 0) {
      await play(songPaths[_currentIndex! - 1], _currentIndex! - 1, songPaths);
    }
  }
}
