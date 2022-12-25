import 'package:animations/pages/animated_builder.dart';
import 'package:animations/pages/chatAIcode/login.dart';
import 'package:animations/public/next_to_page.dart';
import 'package:flutter/material.dart';

import 'pages/animated_align.dart';
import 'pages/animated_container.dart';
import 'pages/animated_cross_fade.dart';
import 'pages/animated_default_text_style.dart';
import 'pages/animated_icon.dart';
import 'pages/animated_list.dart';
import 'pages/animated_modal_barrier.dart';
import 'pages/animated_opacity.dart';
import 'pages/animated_padding.dart';
import 'pages/animated_physical_model.dart';
import 'pages/animated_positioned.dart';
import 'pages/animated_rotation.dart';
import 'pages/animated_size.dart';
import 'pages/animated_switcher.dart';
import 'pages/chatAIcode/fluttercalenda.dart';
import 'pages/chatAIcode/uitocode.dart';

// ams
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const FlutterCalenda(
        
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int binarySearch(List<int> list, int item) {
  // Get the lower and upper indices of the list
  int low = 0;
  int high = list.length - 1;

  // While there are still items in the list to search
  while (low <= high) {
    // Calculate the midpoint of the list
    int mid = (low + high) ~/ 2;
    // Get the item at the midpoint
    int guess = list[mid];
    // If the item is what we're looking for, return its index
    if (guess == item) {
      return mid;
    }
    // If the item is less than what we're looking for, search the right half of the list
    if (guess > item) {
      high = mid - 1;
    }
    // If the item is greater than what we're looking for, search the left half of the list
    else {
      low = mid + 1;
    }
  }
  // If the item isn't in the list, return -1
  return -1;
}

  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("widget.title"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  
                  ElevatedButton(
                onPressed: () {
                    var index =  binarySearch(numbers, 11);
                    print(index);
                },
                child: const Text("ค้นหา"),
              ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  NextToPage.push(context, const AnimatedAlignPage());
                },
                child: const Text("AnimatedAlign Widget"),
              ),
              ElevatedButton(
                onPressed: () {
                  NextToPage.push(context, const AnimatedBuilderPage());
                },
                child: const Text("AnimatedBuilder Widget"),
              ),
              ElevatedButton(
                onPressed: () {
                  NextToPage.push(context, const AnimatedContainerPage());
                },
                child: const Text("AnimatedContainer Widget"),
              ),
              ElevatedButton(
                onPressed: () {
                  NextToPage.push(context, const AnimatedCrossFadePage());
                },
                child: const Text("AnimatedCrossFadePage Widget"),
              ),
              ElevatedButton(
                onPressed: () {
                  NextToPage.push(
                      context, const AnimatedDefaultTextStylePage());
                },
                child: const Text("AnimatedDefaultTextStyle Widget"),
              ),
              ElevatedButton(
                onPressed: () {
                  NextToPage.push(context, const AnimatedIconPage());
                },
                child: const Text("AnimatedIcon Widget"),
              ),
              ElevatedButton(
                onPressed: () {
                  NextToPage.push(context, const AnimatedListPage());
                },
                child: const Text("AnimatedList Widget"),
              ),
              ElevatedButton(
                onPressed: () {
                  NextToPage.push(context, const AnimatedModalBarrierPage());
                },
                child: const Text("AnimatedModalBarrier Widget"),
              ),
              ElevatedButton(
                onPressed: () {
                  NextToPage.push(context, const AnimatedOpacityPage());
                },
                child: const Text("AnimatedOpacity Widget"),
              ),
              ElevatedButton(
                onPressed: () {
                  NextToPage.push(context, const AnimatedPaddingPage());
                },
                child: const Text("AnimatedPadding Widget"),
              ),
              ElevatedButton(
                onPressed: () {
                  NextToPage.push(context, const AnimatedPhysicalModelPage());
                },
                child: const Text("AnimatedPhysicalModel Widget"),
              ),
              ElevatedButton(
                onPressed: () {
                  NextToPage.push(context, const AnimatedPositionedPage());
                },
                child: const Text("AnimtedPositioned Widget"),
              ),
              ElevatedButton(
                onPressed: () {
                  NextToPage.push(context, const AnimatedRotationPage());
                },
                child: const Text("AnimatedRotation Widget"),
              ),
              ElevatedButton(
                onPressed: () {
                  NextToPage.push(context, const AnimatedSizePage());
                },
                child: const Text("AnimatedSize Widget"),
              ),
              ElevatedButton(
                onPressed: () {
                  NextToPage.push(context, const AnimatedSwitcherPage());
                },
                child: const Text("AnimatedSwitcher Widget"),
              ),
              ElevatedButton(
                onPressed: () {
                  NextToPage.push(context, LoginPage());
                },
                child: const Text("Login Widget"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
