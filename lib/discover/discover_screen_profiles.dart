import 'package:flutter/material.dart';
import 'package:interntask/discover/discover_blocks.dart';



class DiscoverScreenProfile extends StatelessWidget {
  const DiscoverScreenProfile({
    super.key,
    required this.image,
    required this.fullname,
    required this.title,
  });
  final Image image;
  final String fullname;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image,
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullname,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(title),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0, top: 10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DiscoverBlock(text: "Healthtech"),
              SizedBox(
                width: 5,
              ),
              DiscoverBlock(text: "AR/VR"),
              SizedBox(
                width: 5,
              ),
              DiscoverBlockPlain(
                text: 'Blockchain and Cryptocurrency',
              ),
            ],
          ),
        )
      ],
    );
  }
}





class DiscoverScreenProfilePlain extends StatelessWidget {
  const DiscoverScreenProfilePlain({
    super.key,
    required this.image,
    required this.fullname,
    required this.title,
  });
  final Image image;
  final String fullname;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image,
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullname,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(title),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0, top: 10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DiscoverBlockPlain(text: "Healthtech"),
              SizedBox(
                width: 5,
              ),
              DiscoverBlockPlain(text: "AR/VR"),
              SizedBox(
                width: 5,
              ),
              DiscoverBlockPlain(
                text: 'Blockchain and Cryptocurrency',
              ),
            ],
          ),
        )
      ],
    );
  }
}

