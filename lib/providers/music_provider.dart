import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SongItem {
  final String title;
  final String artist;
  final String url;
  final String lyrics;

  SongItem({required this.title, required this.artist, required this.url, required this.lyrics});
}

class MusicProvider extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  Timer? _sleepTimer;
  int _currentIndex = 0;

  final List<SongItem> _playlist = [
    SongItem(
      title: "Lo-Fi Midnight",
      artist: "Abhivansh",
      url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
      lyrics: "Rhythm in the quiet night...\nFocus on your path...",
    ),
    SongItem(
      title: "Deep Chill Vibes",
      artist: "Rivanshh",
      url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
      lyrics: "Waves rolling slowly...\nPeace in the soul...",
    ),
  ];

  AudioPlayer get player => _player;
  List<SongItem> get playlist => _playlist;
  SongItem get currentSong => _playlist[_currentIndex];

  MusicProvider() {
    _initAudio();
  }

  void _initAudio() async {
    _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        nextSong(); // Auto Next Spotify style
      }
    });
  }

  void playSong(int index) async {
    _currentIndex = index;
    await _player.setUrl(_playlist[index].url);
    _player.play();
    notifyListeners();
  }

  void nextSong() {
    if (_currentIndex < _playlist.length - 1) {
      playSong(_currentIndex + 1);
    } else {
      playSong(0);
    }
  }

  void previousSong() {
    if (_currentIndex > 0) {
      playSong(_currentIndex - 1);
    }
  }

  void setSleepTimer(int minutes) {
    _sleepTimer?.cancel();
    _sleepTimer = Timer(Duration(minutes: minutes), () {
      _player.pause();
      notifyListeners();
    });
  }
}
