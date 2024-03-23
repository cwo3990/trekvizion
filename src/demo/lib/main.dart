import 'package:demo/hike_info_page.dart';
import 'package:demo/past_hikes_page.dart';
import 'package:demo/start_new_hike_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TrekVizionApp());
}

class TrekVizionApp extends StatelessWidget {
  const TrekVizionApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trekvizion',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Trekvizion!', style: TextStyle(fontSize: 24)),
            Image.asset('images/Logo.png', height: 200, width: 200),
            ElevatedButton(
              onPressed: () {
                print('Start New Hike');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StartNewHikePage()),
                );
              },
              child: const Text('Start New Hike'),
            ),
            ElevatedButton(
              onPressed: () {
                print('Past Hikes');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PastHikesPage()),
                );
              },
              child: const Text('Past Hikes'),
            ),
            ElevatedButton(
              onPressed: () {
                print('Settings');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SettingsPage()),
                // );
              },
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
