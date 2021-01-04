import 'package:flutter/material.dart';
import 'package:painter_animation_practice/bubble_painter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.05),
          child: SizedBox(
            height: screenSize.height * 0.25,
            width: screenSize.width,
            child: CustomPaint(
              painter: BubblePainter(),
            ),
          ),
        ),
      ),
    );
  }
}
