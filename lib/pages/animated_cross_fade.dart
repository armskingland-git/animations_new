import 'package:flutter/material.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  const AnimatedCrossFadePage({super.key});

  @override
  State<AnimatedCrossFadePage> createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  bool _bool = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated CrossFade Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 100.0,
          ),
          TextButton(
            
            onPressed: () {
              setState(() {
                _bool = !_bool;
              });
            },
            child: const Text(
              "Switch",
              style: TextStyle(color: Colors.black),
            ),
          ),
          AnimatedCrossFade(
              firstChild: Image.asset("assets/images/blue.jpg", width: double.infinity),
              secondChild: Image.asset("assets/images/ocean.jpg", width: double.infinity),
              crossFadeState:
                  _bool ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1))
        ],
      ),
    );
  }
}
