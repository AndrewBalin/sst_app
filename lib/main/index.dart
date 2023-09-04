import 'dart:convert';
import 'dart:math';

import 'check/cameracheck.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:camera/camera.dart';

import 'package:http/http.dart' as http;

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../client/hive_names.dart';
import '../models/user.dart';

import 'sport/sport.dart';
import 'eat/eat.dart';
import 'eat/diet.dart';

import 'package:sstapp/coming_soon.dart';

class MainScreen extends StatefulWidget {

  final CameraDescription camera;
  MainScreen({Key? key, required this.camera}) : super(key:key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;


  final PageController _controller = PageController();
  Map<String, String> userData = {};

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 254, 253),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        unselectedItemColor: Color.fromARGB(100, 0, 0, 0),
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(
            size: 40,
            color: Color.fromARGB(255, 255, 49, 27)),
        selectedItemColor: Color.fromARGB(255, 255, 49, 27),
        selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w400, fontFamily: 'Montserrat', fontSize: 18),
        onTap: (value) {
          setState(() => _currentIndex = value);
          print(value);
          _controller.jumpToPage(value);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat_bubble),
            label: 'Чаты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            activeIcon: Icon(Icons.storefront_rounded),
            label: 'Магазин',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_tennis_outlined),
            activeIcon: Icon(Icons.sports_tennis),
            label: 'Спорт',
          ), BottomNavigationBarItem(
            icon: Icon(Icons.rice_bowl_outlined),
            activeIcon: Icon(Icons.rice_bowl),
            label: 'Питание',
          )
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [
          ComingSoon(),
          ComingSoon(),
          ComingSoon(),
          SportScreen(camera: widget.camera),
          DietScreen(camera: widget.camera)
        ],
      ),
    );
  }
}