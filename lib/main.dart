import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_net/controllers/navigation.dart';
import 'package:radio_net/screens/homepage/home_page.dart';
import 'package:radio_net/screens/newspage/news_page.dart';
import 'package:radio_net/screens/theTeamPage/the_team_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<NavigationController>(
          create: (_) => NavigationController(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController navigation =
        Provider.of<NavigationController>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navigator(
        pages: [
          const MaterialPage(child: HomePage()),
          if (navigation.screenName == '/settings')
            const MaterialPage(child: NewsPage()),
          if (navigation.screenName == '/about')
            const MaterialPage(child: TheTeamPage()),
        ],
        onPopPage: ((route, result) {
          bool? popStatus = route.didPop(result);
          if (popStatus == true) {
            Provider.of<NavigationController>(context, listen: false)
                .changeScreen('/');
          }
          return popStatus;
        }),
      ),
    );
  }
}
