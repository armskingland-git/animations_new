import 'package:flutter/material.dart';

class AnimatedIconPage extends StatefulWidget {
  const AnimatedIconPage({super.key});

  @override
  State<AnimatedIconPage> createState() => _AnimatedIconPageState();
}

class _AnimatedIconPageState extends State<AnimatedIconPage>
    with TickerProviderStateMixin {
   bool _isPlay = false;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animated Icon Page"),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              if (_isPlay == false) {
                // [AnimationStatus.forward] ซึ่งจะเปลี่ยนเป็น 
                // [AnimationStatus.completed] เมื่อถึง 
                // [upperBound] ที่ส่วนท้ายของภาพเคลื่อนไหว
                _controller.forward();
                _isPlay = true;
              } else {
                // ย้อนกลับ animation
                 _controller.reverse();
                _isPlay = false;
              }
            },
            child:  AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: _controller,size: 100.0,
            ),
          ),
        ));
  }
}
