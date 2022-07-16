import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.red;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
          child: AnimatedContainer(
        //Use curves class to create a curve animation
        curve: Curves.bounceIn,
        duration: const Duration(milliseconds: 500),
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          color: _color,
          borderRadius: _borderRadius,
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeSize,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  void _changeSize() {
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
