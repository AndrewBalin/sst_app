import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../client/hive_names.dart';
import '../models/user.dart';

class HeaderBar extends StatefulWidget {

  late String name;
  HeaderBar(this.name, {Key? key}) : super(key:key);

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {

  int _currentIndex = 0;

  final PageController _controller = PageController();
  Map<String, String> userData = {};

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      child: Stack(
                        children: [
                          Center(
                              child: Container(
                                child: CircleAvatar(
                                  radius: 17,
                                  backgroundImage: NetworkImage(
                                      'https://i.pinimg.com/736x/1f/86/60/1f8660ca4dc4ea88ec93ca0f29f376dd.jpg'
                                  ),
                                ),
                                width: 37,
                                height: 37,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19),
                                    border: Border.all(
                                        color: Color.fromARGB(
                                            255, 255, 49, 27),
                                        width: 1)
                                ),
                              )
                          )
                        ],
                      )
                  ),
                  InkWell(
                    child: Icon(Icons.bookmark_border_outlined, size: 30),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, top: 18, right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      child: Icon(Icons.arrow_back_ios_new, size: 30)
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                        fontFamily: 'ActayWide',
                        fontSize: 22,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  InkWell(
                    child: Icon(Icons.settings_outlined, size: 30),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}