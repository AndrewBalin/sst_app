
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';





import '../header.dart';

class EatScreen extends StatefulWidget {


  final CameraDescription camera;
  const EatScreen({Key? key, required this.camera}) : super(key:key);

  @override
  State<EatScreen> createState() => _EatScreenState();
}

class _EatScreenState extends State<EatScreen> {

  final int _currentIndex = 0;

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
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 24),
            child: ElevatedButton(
              onPressed: () {

              },
              child: const Text('Составить рацион питания с ИИ',
                  style: TextStyle(fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 49, 27),
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  minimumSize: const Size(double.infinity, 0),
                  elevation: 7,
                  shadowColor: const Color.fromARGB(255, 243, 93, 77),
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