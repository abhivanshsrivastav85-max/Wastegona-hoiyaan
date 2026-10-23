import 'package:flutter/material.dart';

class WebViewHubScreen extends StatelessWidget {
  const WebViewHubScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Social & Study Hub'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Faah (Insta)'),
              Tab(text: 'Waahchat (Snap)'),
              Tab(text: 'Khelbook (FB)'),
              Tab(text: 'Study Batches'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Direct Instagram Session WebView')),
            Center(child: Text('Snapchat Portal WebView')),
            Center(child: Text('Facebook Portal WebView')),
            Center(child: Text('Study with Abhivansh Batch Portal')),
          ],
        ),
      ),
    );
  }
}
