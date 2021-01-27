import 'dart:ui';

import 'package:flutter/material.dart';

class CustomAnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.transparent, elevation: 0)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _controller;
  Color _pickedColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPress(Color color) async {
    _controller.reset();
    setState(() {
      _pickedColor = color;
    });
    await _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('animation page')),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          FullScreenAnimation(
            _controller,
            _pickedColor,
          ),
          Center(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.cyan,
                  ),
                  iconSize: 50,
                  onPressed: () => _onPress(Colors.cyan),
                ),
                IconButton(
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.red,
                  ),
                  iconSize: 50,
                  onPressed: () => _onPress(Colors.red),
                ),
                IconButton(
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.amber,
                  ),
                  iconSize: 50,
                  onPressed: () => _onPress(Colors.amber),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FullScreenAnimation extends StatefulWidget {
  final AnimationController _controller;
  final Color _color;
  final Animation<double> _animation;

  FullScreenAnimation(this._controller, this._color)
      : _animation = Tween<double>(begin: 0, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutCirc,
          ),
        );

  @override
  _FullScreenAnimationState createState() => _FullScreenAnimationState();
}

class _FullScreenAnimationState extends State<FullScreenAnimation> {
  Color _pastColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final result = Stack(
      alignment: Alignment.center,
      children: [
        Container(color: _pastColor),
        AnimatedBuilder(
          animation: widget._controller,
          builder: (ctx, child) {
            return Container(
              width: screenSize.width * widget._animation.value,
              height: screenSize.height * widget._animation.value,
              color: widget._color,
            );
          },
        ),
      ],
    );
    _pastColor = widget._color;
    return result;
  }
}
