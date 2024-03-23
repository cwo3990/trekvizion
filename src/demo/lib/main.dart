import 'package:flutter/material.dart';
// import 'package:demo/native_opencv.dart';

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
class StartNewHikePage extends StatefulWidget {
  const StartNewHikePage({super.key});

  @override
  State<StartNewHikePage> createState() => _StartNewHikePageState();
}

class _StartNewHikePageState extends State<StartNewHikePage> {
  final _formKey = GlobalKey<FormState>();
  
  String _title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start New Hike'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              const SizedBox(height: 5),
              // Display uploaded image here (if any)
              //
              ElevatedButton(
                onPressed: () => {
                  // Give users option to select from gallery or take new photo
                  // use external library for this
                }, 
                child: const Text('Upload Map')
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ActiveHikePage(Key('active_hike')),
                      )
                    );
                  }
                },
                child: const Text('Start Hike'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActiveHikePage extends StatefulWidget {
  // final String title;

  const ActiveHikePage(Key key) : super(key: key);

  @override
  State<ActiveHikePage> createState() => _ActiveHikePageState();
}

class _ActiveHikePageState extends State<ActiveHikePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the map and the metrics table here
            ElevatedButton(onPressed: () {}, child: const Icon(Icons.play_arrow)),
            ElevatedButton(onPressed: () {}, child: const Icon(Icons.stop)),
          ],
        ),
      ),
    );
  }
}

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
