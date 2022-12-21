import 'package:flutter/material.dart';
import 'package:radio_net/components/bottom_nav.dart';

import 'components/show_tile.dart';

class TheTeamPage extends StatefulWidget {
  const TheTeamPage({super.key});

  @override
  State<TheTeamPage> createState() => _TheTeamPageState();
}

class _TheTeamPageState extends State<TheTeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/soundboard.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Text(
                "Meet our team",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(13),
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 100,
                  );
                },
                itemBuilder: (context, index) {
                  return const ShowTile();
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(
        activeButtonIndex: 2,
      ),
    );
  }
}
