import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JoinUs Messenger')),
      body: const Center(child: Text('App Assigned Virtual Numbers & Free Status Chat Active')),
    );
  }
}
