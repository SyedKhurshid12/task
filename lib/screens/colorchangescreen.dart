import 'dart:math';
import 'package:flutter/material.dart';

class ColorChangeScreen extends StatefulWidget {
  const ColorChangeScreen({super.key});

  @override
  ColorChangeScreenState createState() => ColorChangeScreenState();
}

class ColorChangeScreenState extends State<ColorChangeScreen> {
  Color backgroundColor = Colors.white;

  Color _generateRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  void _changeBackgroundColor() {
    Color newColor = _generateRandomColor();
    setState(() {
      backgroundColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _changeBackgroundColor,
        child: Container(
          color: backgroundColor,
          child: const Center(
            child: Text(
              'Hello there',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: _changeBackgroundColor,
      ),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final Function onPressed;

  const CustomFloatingActionButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed as void Function()?,
      backgroundColor: Colors.red,
      child: const Icon(Icons.color_lens),
    );
  }
}
