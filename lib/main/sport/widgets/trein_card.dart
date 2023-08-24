import 'dart:convert';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../client/hive_names.dart';
import '../../../models/user.dart';

import '../../check/cameracheck.dart';

class TrainCard extends StatefulWidget {

  late String name;
  late String id;
  final CameraDescription camera;

  TrainCard({Key? key, required this.id, required this.name, required this.camera}) : super(key:key);

  @override
  State<TrainCard> createState() => _TrainCardState();
}

class _TrainCardState extends State<TrainCard> {

  Map<String, String> userData = {};

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Container(
      height: 322,
      width: 322,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://4827-45-8-98-163.ngrok-free.app/get_preview/' +
                      widget.id)
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: InkWell(
            onTap: () {},
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      CameraSport(camera: widget.camera)),);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 253, 254, 253),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(100, 243, 93, 77),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(5, 5),
                      )
                    ]
                ),
                height: 60,
                width: 60,
                child: Center(
                  child: Icon(
                      Icons.bookmark_border_outlined, color: Colors.black,
                      size: 30),
                ),
              ),
            )
        ),
      ),
    );
  }
}

class TrainInfo extends StatefulWidget {

  late String name;
  late String id;
  late int duration;

  TrainInfo({Key? key, required this.id, required this.name, required this.duration}) : super(key:key);

  @override
  State<TrainInfo> createState() => _TrainInfoState();
}

class _TrainInfoState extends State<TrainInfo> {

  Map<String, String> userData = {};

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Column(
      children: [
        Text(widget.name),
        Text('~${widget.duration}. Начинающий')
      ],
    );
  }
}