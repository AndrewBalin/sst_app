import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../client/hive_names.dart';
import '../models/user.dart';

import 'form.dart';
import 'gender.dart';
import 'weight.dart';
import 'height.dart';
import 'target.dart';
import 'count.dart';

class FormController extends StatefulWidget {

  FormController({Key? key}) : super(key:key);

  @override
  State<FormController> createState() => _FormControllerState();
}

class _FormControllerState extends State<FormController> {

  final PageController _controller = PageController();
  Map<String, String> userData = {};

  void _nextPage(String name, String value) {
    print(value);
    if(_controller.hasClients) {
      userData[name] = value;
      _controller.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.easeInOutQuad);
    }
  }

  void _end(String name, String value) async {
    print(value);

    Box<User> contactsBox = Hive.box<User>(HiveBoxes.user);

    print(contactsBox.get(0)?.token);

    var body = {
      'id': '1Y4xDzsCJU5KBsTOT5nC',
      'gender': userData['gender'],
      'weight': userData['weight'],
      'height': userData['height'],
      'target': userData['target'],
      'count': value
    };
    print(body);

    final response = await http.post(
      Uri.parse('http://127.0.0.1:5000/add_data/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body)
    );

    Navigator.pushReplacementNamed(context, '/');

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          FormIntro(_nextPage),
          GenderChoice(_nextPage),
          WeightChoice(_nextPage),
          HeightChoice(_nextPage),
          TargetChoice(_nextPage),
          CountChoice(_end),
        ],
        controller: _controller,
      ),
    );
  }
}