import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_net/controllers/navigation.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key, required this.activeButtonIndex});

  final int activeButtonIndex;

  @override
  Widget build(BuildContext context) {
    NavigationController navigation =
        Provider.of<NavigationController>(context, listen: false);

    return BottomNavigationBar(
      currentIndex: activeButtonIndex,
      onTap: (buttonIndex) {
        switch (buttonIndex) {
          case 0:
            navigation.changeScreen('/');
            break;
          case 1:
            navigation.changeScreen('/News');
            break;
          case 2:
            navigation.changeScreen('/Our team');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Our team',
        ),
      ],
      backgroundColor: Colors.black87,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.5),
    );
  }
}
