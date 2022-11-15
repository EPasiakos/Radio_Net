import 'package:flutter/material.dart';

class MockProducersInfo {
  final String name;
  final String imageUrl;
  final String schedule;
  final String description;

  const MockProducersInfo(
      {required this.name,
      required this.imageUrl,
      required this.schedule,
      required this.description});
}

class TheTeamPage extends StatefulWidget {
  const TheTeamPage({super.key});

  @override
  State<TheTeamPage> createState() => _TheTeamPageState();
}

class _TheTeamPageState extends State<TheTeamPage> {
  static const List<MockProducersInfo> _producersList = [
    // ignore: unnecessary_const
    MockProducersInfo(
        name: "Name 1",
        imageUrl:
            "https://radio-net.gr/wp-content/uploads/2022/11/paok-niki-epi-ionikou-12i-agonistiki-super-league.jpg-e1668116070202-350x250.webp",
        schedule: "11:00-12:00",
        description: "Kathimerini enimerwtiki ekpompi"),
    // ignore: unnecessary_const
    MockProducersInfo(
      name: "wergivbveriw",
      imageUrl:
          'https://radio-net.gr/wp-content/uploads/2022/11/3305909-350x250.jpg',
      schedule: '12:00-13:00',
      description: 'rwebunbvuiorwbvuoerb',
    )
  ];

  // ignore: non_constant_identifier_names
  Widget _BuildListItem(BuildContext context, MockProducersInfo producersInfo) {
    return ListTile(
      title: Column(
        children: [
          Row(
            children: [
              Text(
                producersInfo.name,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                producersInfo.schedule,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                producersInfo.schedule,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                producersInfo.description,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemExtent: 80.0,
        itemCount: _producersList.length,
        itemBuilder: ((context, index) =>
            _BuildListItem(context, _producersList[index])),
      ),
    );
  }
}
