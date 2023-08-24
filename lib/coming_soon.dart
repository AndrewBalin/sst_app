import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ComingSoon extends StatefulWidget {

  ComingSoon({Key? key}) : super(key:key);

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Container(
      color: Colors.black,
      height: size.height,
      width: size.width,
      child: Center(
        child: Image.asset("assets/images/coming_soon/comingsoon.gif"),
      ),
    );
  }
}