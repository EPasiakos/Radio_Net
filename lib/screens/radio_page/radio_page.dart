import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'components/play_button.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  //Audio player variables
  final player = AudioPlayer();

  // bool animationPlaying = false;
  bool _audioPlaying = false;

  // Animation controller initialisation and audio controller.
  @override
  void initState() {
    super.initState();

    //Listen for audio changes
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        _audioPlaying = state == PlayerState.playing;
      });
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

// Function to handle play button tap.
  Future<void> _iconTapped() async {
    if (_audioPlaying == false) {
      _animationController.forward();
      _audioPlaying = true;
      String url = "https://sp.19clouds.net/8004/stream";
      await player.play(UrlSource(url));
    } else {
      _animationController.reverse();
      _audioPlaying = false;
      await player.pause();
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
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/soundboard.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //Logo
          Positioned(
            top: 70,
            height: 70,
            child: Image.asset("assets/images/logo.png"),
          ),
          //Positioned(card of show in the center)
          Positioned(
            //Play button background
            //Todo: animation...
            bottom: 10,
            height: 70,
            width: 70,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(255, 59, 108, 210).withOpacity(0.5),
              ),
            ),
          ),
          //Play button.
          //Todo: link media source for player.
          Positioned(
            bottom: 10,
            height: 70,
            width: 70,
            child: GestureDetector(
              onTap: _iconTapped,
              child: PlayButton(animationController: _animationController),
            ),
          ),
        ],
      ),
    );
  }
}
