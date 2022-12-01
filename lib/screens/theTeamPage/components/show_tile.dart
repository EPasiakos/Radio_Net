import 'package:flutter/material.dart';

class ShowTile extends StatefulWidget {
  const ShowTile({super.key});

  @override
  State<ShowTile> createState() => _ShowTileState();
}

class _ShowTileState extends State<ShowTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 400,
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topLeft),
        ),
        alignment: Alignment.bottomLeft,
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text("Test show"),
        ),
      ),
    );
  }
}
