import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers/music_provider.dart';
import 'screens/home_shell.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MusicProvider()),
      ],
      child: const RivanshhApp(),
    ),
  );
}

class RivanshhApp extends StatelessWidget {
  const RivanshhApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rivanshh App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0F13),
        primaryColor: const Color(0xFF6C5CE7),
        cardColor: const Color(0xFF1A1A24),
        textTheme: GoogleFonts.outfitTextTheme(ThemeData.dark().textTheme),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF14141E),
          selectedItemColor: Color(0xFF8B5CF6),
          unselectedItemColor: Colors.white54,
        ),
      ),
      home: const HomeShell(),
    );
  }
}
