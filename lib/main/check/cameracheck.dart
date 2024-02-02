import 'dart:async';

//import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:web_socket_channel/io.dart';

import 'package:image/image.dart' as imglib;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:camera/camera.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:sstapp/config.dart' as config;


class CameraSport extends StatefulWidget {
  final CameraDescription camera;


  const CameraSport({Key? key, required this.camera}) : super(key: key);

  @override
  State<CameraSport> createState() => _CameraSportState();
}

class _CameraSportState extends State<CameraSport> {

  String transformType = "none";

  final Color _colorState = const Color.fromARGB(255, 255, 49, 27);

  final channel = IOWebSocketChannel.connect('api://${config.url}/api/image_stream/');

  late CameraController _controller;
  late IO.Socket socket;
  late int frameNum;
  imglib.PngEncoder pngEncoder = imglib.PngEncoder();
  String rec = "Подключение...";

  @override
  void initState() {
    //_socketIoInit();
    //_cameraInit();
    super.initState();
  }

  void _cameraInit() async {
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.low,
    );
    await _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            break;
          default:
            break;
        }
      }
    });
    print('>>>START');
    //scheduleTimeout(); //76800 3790
    //_startStreamingFrames();
  }

  // Future<void> _startStreamingFrames() async {
  //   _controller.startImageStream((CameraImage image) {
  //       Future((){_sendFrame(image);});
  //   });
  // }

  /*Uint8List processCameraImage(CameraImage image) {
    return Uint8List.fromList(image.planes[0].bytes);
  }*/

  @override
  void dispose() {
    _controller.stopImageStream();
    _controller.dispose();

    //socket.disconnect();
    print('>>>STOP');
    //scheduleTimeout().cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    if (/*!_controller.value.isInitialized*/ false) {
      return Container();
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 254, 253),
      body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 15, top: 48),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                          size: 30,
                          weight: 0.01,
                        )
                    ),
                    IconButton(
                        onPressed: () {
                        },
                        icon: const Icon(
                          Icons.info_outline,
                          color: Colors.black,
                          size: 30,
                          weight: 0.01,
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 24),
                child: Container(
                  width: size.width - 18 - 18,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  height: 136,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      '${config.url}/get_preview/2AI1JjkWATTX9FF3Lbao')
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18, right: 18, left: 0, top: 18),
                        child: Container(
                          child: SizedBox(
                            width: size.width - 100 - 18 - 18 - 18 - 18 - 18,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                verticalDirection: VerticalDirection.up,
                                children: [
                                  Padding(
                                  padding: EdgeInsets.only(top: 10, left: 0),
                                  child: Text(
                                    "24 раза",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color.fromARGB(127, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              Text(
                                      "Классические отжимания",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: Colors.black
                                      ),
                                  ),

                                ]
                            ),
                          )
                        )
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18, top: 36),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.black
                          )
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(19),
                      )
                    ),
                  ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18, right: 18, top: 36),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 255, 49, 27)),
                    backgroundColor: Color.fromARGB(255, 244, 244, 244),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18, right: 18, top: 24),
                child: Center(
                  child: Text(
                      '5/24',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 40,
                        fontWeight: FontWeight.w700
                      ),
                    textAlign: TextAlign.center,
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 54, bottom: 64),
                child: Container(
                  height: 47,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 253, 254, 253),
                    boxShadow: [
                      BoxShadow(
                        color: _colorState,
                        blurRadius: 4,
                        offset: const Offset(0, 10)
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      rec,
                      style: const TextStyle(
                        fontFamily: 'ActayWide',
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              /*IconButton(onPressed: () async {
                XFile image = await _controller.takePicture();
                List<int> frameBytes = await image.readAsBytes();
                print(frameBytes.length);
                socket.emit('stream', {'frame': frameBytes});
              }, icon: Icon(Icons.camera))*/
            ],
          )

      ),
    );
  }
}