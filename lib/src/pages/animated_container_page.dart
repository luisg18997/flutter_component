import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width =50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container Pages'),
      ),
      body: Center(
        child: AnimatedContainer(
            width: _width,
            height: _height,
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: _color
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeForm,
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void _changeForm() {
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(random.nextInt(300), random.nextInt(300), random.nextInt(300), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(300).toDouble());
    });

  }
}