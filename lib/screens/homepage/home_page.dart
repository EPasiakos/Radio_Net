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

  bool animationPlaying = false;
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
            flex: 5,
            child: Container(
              color: Colors.red,
            ),
          ),
          Stack(children: [
            GestureDetector(
            onTap: () {
              setState(() {
                animationPlaying = !animationPlaying;
              });
            },
            child: Center(
              child: AnimatedContainer(
                width: animationPlaying ? 120 : 100,
                height: animationPlaying ? 120 : 100,
                color: Colors.green,
                duration: const Duration(milliseconds: 600),
              ),
            ),  
          ),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: ,
                  ),
                ),
              ),]
            ),
          ),
        ],
      ),
    );
  }
}
