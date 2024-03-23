import 'package:flutter/material.dart';

class PastHikesPage extends StatefulWidget {
  const PastHikesPage({super.key});

  @override
  State<PastHikesPage> createState() => _PastHikesPageState();
}

class _PastHikesPageState extends State<PastHikesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Past Hikes'),
      ),
      body: ListView(
        children: const [
          // Display the list of past hikes here
          Placeholder(),
        ],
      ),
    );
  }
}
