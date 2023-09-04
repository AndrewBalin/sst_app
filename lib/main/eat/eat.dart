import 'dart:convert';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../client/hive_names.dart';
import '../../models/user.dart';

import 'diet.dart';

import '../header.dart';

class EatScreen extends StatefulWidget {


  final CameraDescription camera;
  EatScreen({Key? key, required this.camera}) : super(key:key);

  @override
  State<EatScreen> createState() => _EatScreenState();
}

class _EatScreenState extends State<EatScreen> {

  int _currentIndex = 0;

  final PageController _controller = PageController();

  void _toPage(int page) {
    if (_controller.hasClients) {
      _controller.animateToPage(
          page,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutQuad
      );
    }
  }

  Map<String, String> userData = {};

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Column(
      children: [
        HeaderBar('Питание'),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 18, right: 18, bottom: 24),
            child: ElevatedButton(
              onPressed: () {

              },
              child: const Text('Составить рацион питания с ИИ',
                  style: TextStyle(fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 49, 27),
                  padding: EdgeInsets.only(top: 25, bottom: 25),
                  minimumSize: Size(double.infinity, 0),
                  elevation: 7,
                  shadowColor: Color.fromARGB(255, 243, 93, 77),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(500)
                  )
              ),
            ),
          ),
        )
      ],
    );
  }
}