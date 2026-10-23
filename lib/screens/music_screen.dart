import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../providers/music_provider.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final music = Provider.of<MusicProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rivanshh Music'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(LucideIcons.timer),
            tooltip: 'Sleep Timer',
            onSelected: (mins) {
              music.setSleepTimer(mins);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Music will turn off in $mins mins')),
              );
            },
            itemBuilder: (ctx) => [
              const PopupMenuItem(value: 15, child: Text('15 Minutes')),
              const PopupMenuItem(value: 30, child: Text('30 Minutes')),
              const PopupMenuItem(value: 60, child: Text('60 Minutes')),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: music.playlist.length,
              itemBuilder: (ctx, i) {
                final song = music.playlist[i];
                return ListTile(
                  leading: const CircleAvatar(child: Icon(LucideIcons.disc)),
                  title: Text(song.title),
                  subtitle: Text(song.artist),
                  trailing: const Icon(LucideIcons.heart),
                  onTap: () => music.playSong(i),
                );
              },
            ),
          ),
          // Player Bottom Panel
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF1A1A24),
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(music.currentSong.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text(music.currentSong.artist, style: const TextStyle(color: Colors.white54)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(icon: const Icon(LucideIcons.skip_back), onPressed: music.previousSong),
                    StreamBuilder(
                      stream: music.player.playerStateStream,
                      builder: (context, snapshot) {
                        final isPlaying = music.player.playing;
                        return IconButton(
                          iconSize: 45,
                          icon: Icon(isPlaying ? LucideIcons.pause_circle : LucideIcons.play_circle),
                          onPressed: () => isPlaying ? music.player.pause() : music.player.play(),
                        );
                      },
                    ),
                    IconButton(icon: const Icon(LucideIcons.skip_forward), onPressed: music.nextSong),
                  ],
                ),
                ExpansionTile(
                  title: const Text('Show Lyrics', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: Colors.purpleAccent)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(music.currentSong.lyrics, textAlign: TextAlign.center),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
