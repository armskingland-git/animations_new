import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DragAndDropPage(),
    );
  }
}

class DragAndDropPage extends StatefulWidget {
  @override
  _DragAndDropPageState createState() => _DragAndDropPageState();
}

class _DragAndDropPageState extends State<DragAndDropPage> {
  Color _dragTargetColor1 = Colors.grey;
  Color _dragTargetColor2 = Colors.grey;
  Color _dragTargetColor3 = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Draggable(
          data: "data1",
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
          feedback: Container(
            width: 100,
            height: 100,
            color: Colors.blue.withOpacity(0.5),
          ),
          childWhenDragging: Container(),
        ),
        Draggable(
          data: "data2",
          child: Container(
            width: 100,
            height: 100,
            color: Colors.green,
          ),
          feedback: Container(
            width: 100,
            height: 100,
            color: Colors.green.withOpacity(0.5),
          ),
          childWhenDragging: Container(),
        ),
        DragTarget(
          onAccept: (data) {
            setState(() {
              if (data == "data1") {
                _dragTargetColor1 = Colors.blue;
              } else if (data == "data2") {
                _dragTargetColor1 = Colors.green;
              } else if (data == "data3") {
                _dragTargetColor1 = Colors.yellow;
              }
            });
          },
          onLeave: (data) {
            setState(() {
              _dragTargetColor1 = Colors.grey;
            });
          },
          builder: (context, candidateData, rejectedData) {
            return Container(
              width: 200,
              height: 200,
              color: _dragTargetColor1,
            );
          },
        ),
        DragTarget(
          onAccept: (data) {
            setState(() {
              if (data == "data1") {
                _dragTargetColor2 = Colors.blue;
              } else if (data == "data2") {
                _dragTargetColor2 = Colors.green;
              } else if (data == "data3") {
                _dragTargetColor2 = Colors.yellow;
              }
            });
          },
          onLeave: (data) {
            setState(() {
              _dragTargetColor2 = Colors.grey;
            });
          },
          builder: (context, candidateData, rejectedData) {
            return Container(
              width: 200,
              height: 200,
              color: _dragTargetColor2,
            );
          },
        ),
        ],
      ),
    );
  }
}
