import 'package:flutter/cupertino.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("Post title here"),
            Image.asset("assets/images/postImage.jpg"),
            const Text("vkeqkbehbeabvaebvhadbhcvvajcv"),
          ],
        ),
      ],
    );
  }
}
