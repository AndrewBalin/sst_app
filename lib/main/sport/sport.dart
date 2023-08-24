import 'dart:convert';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'new.dart';

import 'package:http/http.dart' as http;

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../client/hive_names.dart';
import '../../models/user.dart';

import 'header.dart';

class SportScreen extends StatefulWidget {


  final CameraDescription camera;
  SportScreen({Key? key, required this.camera}) : super(key:key);

  @override
  State<SportScreen> createState() => _SportScreenState();
}

class _SportScreenState extends State<SportScreen> {

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
        SportBar('Тренировки'),
        Padding(
            padding: EdgeInsets.only(left: 18, top: 24, right: 18),
            child: Container(
                height: 47,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 253, 254, 253),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(204, 236, 236, 236),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]
                ),
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.only(left: 17.5, right: 16.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Text(
                              'Новые',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: _currentIndex == 0
                                      ? Colors.black
                                      : Color
                                      .fromARGB(255, 212, 212, 212)
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _currentIndex = 0;
                              });
                              _toPage(0);
                            },
                          ),
                          InkWell(
                            child: Text(
                              'Мои',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: _currentIndex == 1
                                      ? Colors.black
                                      : Color
                                      .fromARGB(255, 212, 212, 212)
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _currentIndex = 1;
                              });
                              _toPage(1);
                            },
                          ),
                          InkWell(
                            child: Text(
                              'Ещё',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: _currentIndex == 2
                                      ? Colors.black
                                      : Color
                                      .fromARGB(255, 212, 212, 212)
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _currentIndex = 2;
                              });
                              _toPage(2);
                            },
                          ),
                        ],
                      )
                  ),
                )
            )
        ),
        Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              children: [
                NewTrains(camera: widget.camera)
              ],
            )
        )
      ],
    );
  }
}