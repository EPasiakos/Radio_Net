import 'package:flutter/material.dart';

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
      body: Column(
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
    );
  }
}
