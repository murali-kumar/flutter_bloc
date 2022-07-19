import 'package:flutter/material.dart';
import 'package:project_01/src/screens/method_1_screen.dart';
import 'package:project_01/src/screens/method_2_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Flutter Bloc Learning')),
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Method1Screen()),
                    );
                  },
                  child: const Text('Method 1')),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Method2Screen()),
                    );
                  },
                  child: const Text('Method 2')),
            ],
          ),
        ));
  }
}
