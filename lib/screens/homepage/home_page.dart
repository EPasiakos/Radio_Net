import 'package:flutter/material.dart';

import 'components/play_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  bool audioPlaying = false;
  void _iconTapped() {
    if (audioPlaying == false) {
      _animationController.forward();
      audioPlaying = true;
    } else {
      _animationController.reverse();
      audioPlaying = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          GestureDetector(
            onTap: _iconTapped,
            child: PlayButton(animationController: _animationController),
          ),
        ],
      ),
    );
  }
}
