import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:radio_net/screens/newspage/news_page.dart';
import 'package:radio_net/screens/radio_page/radio_page.dart';

import '../theTeamPage/the_team_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Navbar items list
  final items = const [
    Icon(
      Icons.home,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.newspaper,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.settings,
      size: 30,
      color: Colors.white,
    ),
  ];

  //Current page index on the navbar
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: const Color.fromARGB(255, 59, 108, 210),
          items: items,
          index: index,
          onTap: (selectedIndex) {
            setState(() {
              index = selectedIndex;
            });
          },
        ),
        body: Container(
          color: Colors.white,
          child: getSelectedPage(index: index),
        ));
  }

  getSelectedPage({required int index}) {
    Widget page;
    switch (index) {
      case 0:
        page = const RadioPage();
        break;
      case 1:
        page = const NewsPage();
        break;
      case 2:
        page = const TheTeamPage();
        break;
      default:
        page = const RadioPage();
    }
    return page;
  }
}
