
import 'package:flutter/material.dart';
import 'package:interntask/src/constants/colors.dart';

class DiscoverBlock extends StatelessWidget {
  const DiscoverBlock({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      //  width: 90,
      height: 30,
      decoration: BoxDecoration(
          color: Color.fromARGB(59, 149, 215, 225),
          border: Border.all(style: BorderStyle.solid, color: AppColors.faintGreen),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}


class DiscoverBlockPlain extends StatelessWidget {
  const DiscoverBlockPlain({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      //  width: 90,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(style: BorderStyle.solid, color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
