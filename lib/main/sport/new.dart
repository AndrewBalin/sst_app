import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../client/hive_names.dart';
import '../../models/user.dart';

import 'header.dart';

class SportScreen extends StatefulWidget {

  SportScreen({Key? key}) : super(key:key);

  @override
  State<SportScreen> createState() => _SportScreenState();
}

class _SportScreenState extends State<SportScreen> {

  int _currentIndex = 0;

  final PageController _controller = PageController();

  void _toPage(int page) {
    if(_controller.hasClients) {
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

    return Container(
      child: Column(
        children: [
        ],
      ),
    );
  }
}