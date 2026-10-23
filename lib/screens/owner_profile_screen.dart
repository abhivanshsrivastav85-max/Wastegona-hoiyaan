import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class OwnerProfileScreen extends StatelessWidget {
  const OwnerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Owner Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.switch_camera),
            tooltip: 'Switch Account',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Switched to secondary Google Account')),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF8B5CF6), width: 3),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF8B5CF6), Color(0xFF6C5CE7)],
                      ),
                    ),
                    child: const Icon(LucideIcons.user, size: 60, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Abhivansh Srivastav',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Creator & Developer | Rivanshh Network',
              style: TextStyle(color: Colors.white60, fontSize: 14),
            ),
            const SizedBox(height: 24),
            _infoTile(LucideIcons.youtube, 'YouTube Channel', '@AbhivanshSrivastav'),
            _infoTile(LucideIcons.instagram, 'Instagram', '@whos.nthng'),
            _infoTile(LucideIcons.mail, 'Primary Gmail', 'abhivansh@example.com'),
            _infoTile(LucideIcons.shield_check, 'App Build', 'Rivanshh v1.0.0 Stable'),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF8B5CF6)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
      ),
    );
  }
}
