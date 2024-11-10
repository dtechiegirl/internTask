
import 'package:flutter/material.dart';

class smallerTextWidget extends StatelessWidget {
  const smallerTextWidget({
    super.key,
   required this.text,
  });

final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.black,),);
  }
}