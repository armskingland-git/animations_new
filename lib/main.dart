import 'package:animations/pages/animated_builder.dart';
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

// amsss
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                  NextToPage.push(context, const AnimatedDefaultTextStylePage());
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
            ],
          ),
        ),
      ),
    );
  }
}
