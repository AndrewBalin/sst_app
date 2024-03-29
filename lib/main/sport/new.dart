import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'widgets/trein_card.dart';

import 'package:http/http.dart' as http;

import 'package:scroll_snap_list/scroll_snap_list.dart';


import 'package:sstapp/config.dart' as config;

class NewTrains extends StatefulWidget {

  final CameraDescription camera;
  const NewTrains({Key? key, required this.camera}) : super(key:key);

  @override
  State<NewTrains> createState() => _NewTrainsState();
}

class _NewTrainsState extends State<NewTrains> {

  int _currentIndex = 0;

  final PageController _controller = PageController();
  late List<dynamic> workouts;
  late final Future futureWorkout;

  @override
  void initState() {
    futureWorkout = _getWorkouts();
    super.initState();
  }

  void _setWorkouts() async {
    setState(() async {
      workouts = await _getWorkouts();
      print('пися');
      print(workouts);
    });
  }

  Future<List<dynamic>> _getWorkouts() async {
    final response = await http.post(
      Uri.parse('${config.url}/get_workouts/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    setState(() {
      workouts = json.decode(response.body);
    });
    return json.decode(response.body);
  }

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

  Widget _buildItemList(BuildContext context, int index) {
    return Padding(
        padding: const EdgeInsets.only(right: 18, bottom: 10, top: 0),
      child: TrainCard(name: workouts[index]['name'], id: workouts[index]['id'], camera: widget.camera),
    );
  }


  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery
        .of(context)
        .size;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 18, top: 36),
            child: Text("Новые тренировки",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'ActayWide',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 18),
              child: SizedBox(
                height: 350,
                child: FutureBuilder(
                  builder: (ctx, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data as List<dynamic>;
                      print(data);
                      return ScrollSnapList(
                        itemBuilder: _buildItemList,
                        itemSize: 322+18,
                        dynamicItemSize: false,
                        itemCount: data.length,
                        onItemFocus: (int index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  future: futureWorkout,
                ),
              ),
          ),

        ],
      ),
    );
  }
}