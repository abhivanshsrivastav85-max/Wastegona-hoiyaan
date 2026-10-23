import 'package:flutter/material.dart';

class DownloaderScreen extends StatelessWidget {
  const DownloaderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rivanshh Pay & Media Grabber')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Paste video/audio link here...',
                suffixIcon: IconButton(icon: const Icon(Icons.download), onPressed: () {}),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Download MP3')),
                ElevatedButton(onPressed: () {}, child: const Text('Download MP4')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
