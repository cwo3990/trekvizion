import 'package:flutter/material.dart';

import 'package:demo/active_hike.dart';

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
                          builder: (context) => const ActiveHikePage(),
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