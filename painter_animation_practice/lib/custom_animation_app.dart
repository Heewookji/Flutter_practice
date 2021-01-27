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
  Color _pickedColor;
  Offset _pickedLocation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap(Color color, Offset tappedLocation) async {
    if (_controller.isAnimating) return;
    _controller.reset();
    setState(() {
      _pickedColor = color;
      _pickedLocation = tappedLocation;
    });
    await _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FullScreenAnimation(
            _controller,
            _pickedColor,
            _pickedLocation,
          ),
          Center(
            child: Row(
//              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.cyan,
                    size: 60,
                  ),
                  onTapUp: (detail) =>
                      _onTap(Colors.cyan, detail.globalPosition),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.red,
                    size: 60,
                  ),
                  onTapUp: (detail) =>
                      _onTap(Colors.red, detail.globalPosition),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.amber,
                    size: 60,
                  ),
                  onTapUp: (detail) =>
                      _onTap(Colors.amber, detail.globalPosition),
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
  final Offset _location;
  final Animation<double> _animation;

  FullScreenAnimation(this._controller, this._color, this._location)
      : _animation = Tween<double>(begin: 0, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOutQuart,
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
      children: [
        Container(color: _pastColor),
        AnimatedBuilder(
          animation: widget._controller,
          builder: (ctx, child) {
            return ClipPath(
              clipper: MyCustomClipper(
                widget._location,
                widget._animation.value,
              ),
              child: Container(
                width: screenSize.width,
                height: screenSize.height,
                color: widget._color,
              ),
            );
          },
        ),
      ],
    );
    _pastColor = widget._color;
    return result;
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  final location;
  final value;

  MyCustomClipper(this.location, this.value);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(
      Rect.fromCircle(
        center: location ?? Offset(0, 0),
        radius: (size.height * value) / 1.5,
      ),
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
