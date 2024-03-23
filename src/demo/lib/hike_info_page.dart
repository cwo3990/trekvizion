import 'package:demo/main.dart';
import 'package:flutter/material.dart';

class HikeInfoPage extends StatefulWidget {

  final String title = 'Hike Title';
  
  const HikeInfoPage({super.key});

  @override
  State<HikeInfoPage> createState() => _HikeInfoPageState();
}

class _HikeInfoPageState extends State<HikeInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the image and the metrics table here
            // Display the description here
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text('Finish'),
           ),
          ],
        ),
      ),
    );
  }
}

