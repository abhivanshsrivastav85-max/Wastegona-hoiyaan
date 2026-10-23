import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'owner_profile_screen.dart';
import 'music_screen.dart';
import 'tube_screen.dart';
import 'chat_screen.dart';
import 'ai_screen.dart';
import 'webview_hub_screen.dart';
import 'downloader_screen.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MusicScreen(),          // 2nd: Rivanshh Music
    const TubeScreen(),           // 3rd: Rivanshh Tube
    const AIScreen(),             // 11th: Rivanshh AI
    const ChatScreen(),           // 5th: JoinUs Messenger
    const WebViewHubScreen(),     // 4th, 8th, 9th, 10th (Social/Study)
    const DownloaderScreen(),     // 7th: Link Downloader
    const OwnerProfileScreen(),   // 1st: App Owner Bio
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(LucideIcons.music), label: 'Music'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.youtube), label: 'Tube'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.sparkles), label: 'AI'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.message_circle), label: 'JoinUs'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.globe), label: 'Hub'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.download), label: 'Get'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: 'Owner'),
        ],
      ),
    );
  }
}
