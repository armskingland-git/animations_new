import 'package:flutter/material.dart';

class AnimatedPhysicalModelPage extends StatefulWidget {
  const AnimatedPhysicalModelPage({super.key});

  @override
  State<AnimatedPhysicalModelPage> createState() =>
      _AnimatedPhysicalModelPageState();
}

class _AnimatedPhysicalModelPageState extends State<AnimatedPhysicalModelPage> {
  bool _isFlat = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animated Physical Model Page"),
        ),
        body: Center(
          child: Column(
            children: [
              AnimatedPhysicalModel(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                elevation: _isFlat ? 0 : 6.0,
                shape: BoxShape.rectangle,
                shadowColor: Colors.black,
                color: Colors.white,
                child: const SizedBox(
                  height: 120.0,
                  width: 120.0,
                  child: Icon(Icons.android_outlined),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                child: const Text("Click"),
                onPressed: () {
                  setState(() {
                    _isFlat = !_isFlat;
                  });
                },
              )
            ],
          ),
        ));
  }
}
