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
  Animation<double> _animation;
  Color _pickedColor;
  Color _pastColor;
  Offset _pickedLocation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutQuart,
      ),
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
    _pastColor = color;
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(color: _pastColor),
          CustomFillAnimation(
            _screenSize,
            _animation,
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

class CustomFillAnimation extends AnimatedWidget {
  final Size _size;
  final Color _color;
  final Offset _location;
  final Animation<double> _animation;

  CustomFillAnimation(
    this._size,
    this._animation,
    this._color,
    this._location,
  ) : super(listenable: _animation);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(
        _location,
        _animation.value,
      ),
      child: Container(
        width: _size.width,
        height: _size.height,
        color: _color,
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  final _location;
  final _value;

  MyCustomClipper(this._location, this._value);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(
      Rect.fromCircle(
        center: _location ?? Offset(0, 0),
        radius: (size.height * _value) / 1.5,
      ),
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
