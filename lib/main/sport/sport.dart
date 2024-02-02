
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'new.dart';




import '../header.dart';

class SportScreen extends StatefulWidget {


  final CameraDescription camera;
  const SportScreen({Key? key, required this.camera}) : super(key:key);

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
        HeaderBar('Тренировки'),
        Padding(
            padding: const EdgeInsets.only(left: 18, top: 24, right: 18),
            child: Container(
                height: 47,
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 17.5, right: 16.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      : const Color
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
                              'Моя тренировка',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: _currentIndex == 1
                                      ? Colors.black
                                      : const Color
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
                        ],
                      )
                  ),
                )
            )
        ),
        Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
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