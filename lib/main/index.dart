import 'package:flutter/material.dart';

import 'package:camera/camera.dart';
import 'package:sstapp/main/profile/profile.dart';

import 'package:sstapp/sam_sebe_trener_icons.dart';

import 'sport/sport.dart';
import 'eat/diet.dart';

import 'package:sstapp/coming_soon.dart';

class MainScreen extends StatefulWidget {

  final CameraDescription camera;
  const MainScreen({Key? key, required this.camera}) : super(key:key);

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
      backgroundColor: const Color.fromARGB(255, 253, 254, 253),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        unselectedItemColor: const Color.fromARGB(100, 0, 0, 0),
        selectedFontSize: 20,
        selectedIconTheme: const IconThemeData(
            size: 40,
            color: Color.fromARGB(255, 255, 49, 27)),
        selectedItemColor: const Color.fromARGB(255, 255, 49, 27),
        selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400, fontFamily: 'Montserrat', fontSize: 18),
        onTap: (value) {
          setState(() => _currentIndex = value);
          print(value);
          _controller.jumpToPage(value);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(SamSebeTrener.home),
            activeIcon: Icon(SamSebeTrener.home),
            label: 'главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(SamSebeTrener.plate),
            activeIcon: Icon(SamSebeTrener.plate),
            label: 'питание',
          ),
          BottomNavigationBarItem(
            icon: Icon(SamSebeTrener.barbell),
            activeIcon: Icon(SamSebeTrener.barbell),
            label: 'тренировки',
          ),
          BottomNavigationBarItem(
            icon: Icon(SamSebeTrener.profile),
            activeIcon: Icon(SamSebeTrener.profile),
            label: 'профиль',
          ),
        ],
      ),
      body: SafeArea(
        top: true,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [
            const ComingSoon(),
            DietScreen(camera: widget.camera),
            SportScreen(camera: widget.camera),
            ProfileScreen(),
          ],
        )
      ),
    );
  }
}