import 'package:dotted_border/dotted_border.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';

import 'navigation_drawer.dart';

class UitoCode extends StatefulWidget {
  const UitoCode({super.key});

  @override
  State<UitoCode> createState() => _UitoCodeState();
}

class _UitoCodeState extends State<UitoCode> {
  List<SizedBox> rightCards = [];
  @override
  Widget build(BuildContext context) {
    final double widthhead = MediaQuery.of(context).size.width * 2 / 10;
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              color: const Color.fromARGB(255, 212, 212, 212), // red,
              width: widthhead,
              height: double.infinity,
              child: Wrap(
                children: [
                  Draggable(
                    childWhenDragging: SizedBox(
                      width: widthhead * 1 / 2,
                      height: widthhead * 1 / 2,
                      child: const Card(
                        color: Color.fromARGB(255, 0, 0, 0), // green
                      ),
                    ),
                    feedback: SizedBox(
                      width: widthhead * 1 / 2,
                      height: widthhead * 1 / 2,
                      child: const Card(
                        color: Color.fromARGB(255, 9, 255, 0), // green
                      ),
                    ),
                    onDraggableCanceled: (Velocity v, Offset o) {
                      print("$v $o");
                      setState(() {
                        // Add the card to the right container here
                        //  rightCards.removeWhere((element) => element.child == SizedBox(
                        //   width: widthhead * 1 / 2,
                        //   height: widthhead * 1 / 2,
                        //   child: const Card(
                        //     color: Color.fromARGB(255, 9, 255, 0), // green
                        //   ),
                        // ));
                        rightCards.add(SizedBox(
                          width: widthhead * 1 / 2,
                          height: widthhead * 1 / 2,
                          child: const Card(
                            color: Color.fromARGB(255, 9, 255, 0), // green
                          ),
                        ));
                      });
                    },
                    child: SizedBox(
                      width: widthhead * 1 / 2,
                      height: widthhead * 1 / 2,
                      child: const Card(
                        color: Color.fromARGB(255, 9, 255, 0), // green
                      ),
                    ),
                  ),
                  Draggable(
                    dragAnchorStrategy: childDragAnchorStrategy,
                    feedback: SizedBox(
                      width: widthhead * 1 / 2,
                      height: widthhead * 1 / 2,
                      child: const Card(
                        color: Color.fromRGBO(255, 0, 0, 1.0), // red
                      ),
                    ),
                    onDraggableCanceled: (Velocity v, Offset o) {
                      print("$v $o");
                      setState(() {
                        // Add the card to the right container here
                        // rightCards.removeWhere((element) => element.child == SizedBox(
                        //   width: widthhead * 1 / 2,
                        //   height: widthhead * 1 / 2,
                        //   child: const Card(
                        //     color: Color.fromRGBO(255, 0, 0, 1.0), // red
                        //   ),
                        // ));
                        rightCards.add(SizedBox(
                          width: widthhead * 1 / 2,
                          height: widthhead * 1 / 2,
                          child: const Card(
                            color: Color.fromRGBO(255, 0, 0, 1.0), // red
                          ),
                        ));
                      });
                    },
                    child: SizedBox(
                      width: widthhead * 1 / 2,
                      height: widthhead * 1 / 2,
                      child: const Card(
                        color: Color.fromRGBO(255, 0, 0, 1.0), // red
                      ),
                    ),
                  ),
                  // Add more cards here
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              color: const Color.fromARGB(255, 119, 111, 111),
              width: widthhead * 2,
              height: double.infinity,
              child: Column(
                children: [
                  DragTarget(
                    onAcceptWithDetails: (details) {
                      print("tt $details");
                    },
                    // onWillAccept:(SizedBox? card) {

                    // },
                    onAccept: (SizedBox card) {
                      setState(() {
                        // Add the card to the right container here
                        rightCards.add(card);
                      });
                    },
                    onLeave: (SizedBox? data) {
                      print("arms ${data?.width}");
                    },
                    builder: (BuildContext context,
                        List<SizedBox?> candidateData, rejectedData) {
                      print("object");
                      return Wrap(
                          children: [for (SizedBox data in rightCards) data]);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UitoCode2 extends StatefulWidget {
  const UitoCode2({super.key});

  @override
  State<UitoCode2> createState() => _UitoCode2State();
}

class _UitoCode2State extends State<UitoCode2> {
    // Outer list
  late List<DragAndDropList> _contents;

  @override
  void initState() {
    super.initState();

    _contents = List.generate(10, (index) {
      return DragAndDropList(
        header: Row(
          children: <Widget>[
            const Expanded(
              flex: 1,
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text('Header $index'),
            ),
            const Expanded(
              flex: 1,
              child: Divider(),
            ),
          ],
        ),
        children: <DragAndDropItem>[
          DragAndDropItem(
            child: Text('$index.1'),
          ),
          DragAndDropItem(
            child: Text('$index.2'),
          ),
          DragAndDropItem(
            child: Text('$index.3'),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic'),
      ),
      drawer: const NavigationDrawer(),
      body: DragAndDropLists(
        children: _contents,
        onItemReorder: _onItemReorder,
        onListReorder: _onListReorder,
      ),
    );
  }

  _onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
      _contents[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _contents.removeAt(oldListIndex);
      _contents.insert(newListIndex, movedList);
    });
  }

}
