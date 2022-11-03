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

  // Animation controller initialisation.
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  bool audioPlaying = false;

  // Function to handle play button tap.
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
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          //Main Backround
          Container(
            color: Colors.white,
          ),
          //Logo
          Positioned(
            top: 70,
            height: 70,
            child: Image.asset("assets/images/logo.png"),
          ),
          //Play button background
          //Todo: animation...
          Positioned(
            bottom: 10,
            height: 70,
            width: 70,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(255, 59, 108, 210),
              ),
            ),
          ),
          //Play button.
          //Todo: link media source for player.
          Positioned(
            bottom: 10,
            height: 70,
            width: 70,
            child: Container(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: GestureDetector(
                onTap: _iconTapped,
                child: PlayButton(animationController: _animationController),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
