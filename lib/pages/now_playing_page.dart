import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import '../models/song_model.dart';
import '../providers/audio_player_provider.dart';

class NowPlayingPage extends StatefulWidget {
  final List<Song> songList;
  final int index;

  const NowPlayingPage({
    super.key,
    required this.songList,
    required this.index,
  });

  @override
  State<NowPlayingPage> createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  late AudioPlayerProvider _audioProvider;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _audioProvider = Provider.of<AudioPlayerProvider>(context, listen: false);
    _currentIndex = widget.index;

    final songPaths = widget.songList.map((s) => s.url).toList();
    _audioProvider.play(songPaths[_currentIndex], _currentIndex, songPaths);

    _audioProvider.player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        _nextSong();
      }
    });
  }

  void _nextSong() async {
    if (_currentIndex < widget.songList.length - 1) {
      setState(() => _currentIndex++);
      final songPaths = widget.songList.map((s) => s.url).toList();
      await _audioProvider.play(songPaths[_currentIndex], _currentIndex, songPaths);
    }
  }

  void _previousSong() async {
    if (_currentIndex > 0) {
      setState(() => _currentIndex--);
      final songPaths = widget.songList.map((s) => s.url).toList();
      await _audioProvider.play(songPaths[_currentIndex], _currentIndex, songPaths);
    }
  }

  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioPlayerProvider>(context);
final player = audioProvider.player;
final song = widget.songList[_currentIndex];



    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(song.image),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Text(
                  song.title,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  song.artist,
                  style: const TextStyle(fontSize: 18, color: Colors.white70),
                ),
                const SizedBox(height: 40),
                StreamBuilder<Duration>(
                  stream: player.positionStream,
                  builder: (context, snapshot) {
                    final position = snapshot.data ?? Duration.zero;
                    final duration = player.duration ?? Duration.zero;

                    return Column(
                      children: [
                        Slider(
                          value: position.inSeconds.toDouble().clamp(0, duration.inSeconds.toDouble()),
                          min: 0,
                          max: duration.inSeconds.toDouble(),
                          onChanged: (value) {
                            player.seek(Duration(seconds: value.toInt()));
                          },
                          activeColor: Colors.white,
                          inactiveColor: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_formatDuration(position), style: const TextStyle(color: Colors.white)),
                              Text(_formatDuration(duration), style: const TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous, size: 36, color: Colors.white),
                      onPressed: _previousSong,
                    ),
                    IconButton(
                     icon: Icon(
                      audioProvider.isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 36,
                        color: Colors.white,
                      ),
                      onPressed: () => _audioProvider.togglePlayPause(),
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next, size: 36, color: Colors.white),
                      onPressed: _nextSong,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
