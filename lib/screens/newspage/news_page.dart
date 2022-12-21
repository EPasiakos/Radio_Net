import 'package:flutter/material.dart';
import 'package:radio_net/components/bottom_nav.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
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
      ),
      bottomNavigationBar: const BottomNav(
        activeButtonIndex: 1,
      ),
    );
  }
}
