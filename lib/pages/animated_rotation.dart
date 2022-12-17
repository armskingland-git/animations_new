import 'package:flutter/material.dart';

class AnimatedRotationPage extends StatefulWidget {
  const AnimatedRotationPage({super.key});

  @override
  State<AnimatedRotationPage> createState() => _AnimatedRotationPageState();
}

class _AnimatedRotationPageState extends State<AnimatedRotationPage> {
  double turns = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animated Rotation Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: AnimatedRotation(
                  turns: turns,
                  duration: const Duration(seconds: 1),
                  child: const FlutterLogo(
                    size: 100,
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text("Rotate Logo"),
                style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
                onPressed: () {
                  setState(() => turns += 1/4);
                },
              )
            ],
          ),
        ));
  }
}
