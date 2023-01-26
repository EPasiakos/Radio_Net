import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:neon/neon.dart';
import 'package:radio_net/components/bottom_nav.dart';
import 'package:radio_net/components/play_button.dart';
import 'package:radio_net/components/show_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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
          //card of show in the center
          const FrostedCard(
            title: 'My Card',
            description: 'Daily news show by Giannis Koutras',
            imageUrl:
                'https://radio-net.gr/wp-content/uploads/2022/12/%CE%9A%CE%B5%CF%86%CE%B1%CE%BB%CE%AC%CF%82-%CE%97%CE%BB%CE%AF%CE%B1%CF%82-750x375-1.jpg',
          ),
          //Neon banner
          Positioned(
            top: 240,
            right: 20,
            height: 70,
            child: Neon(
              text: "On Air",
              fontSize: 50,
              color: Colors.red,
              font: NeonFont.Beon,
              flickeringText: true,
              glowingDuration: const Duration(milliseconds: 500),
              blurRadius: 50,
            ),
          ),
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
      bottomNavigationBar: const BottomNav(
        activeButtonIndex: 0,
      ),
    );
  }
}
