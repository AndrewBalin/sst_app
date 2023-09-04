import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:sstapp/imageUtils.dart';

//import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'dart:io';
import 'package:image/image.dart' as imglib;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:camera/camera.dart';
import 'package:async/async.dart';
import 'package:path_provider/path_provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class CameraSport extends StatefulWidget {
  final CameraDescription camera;


  const CameraSport({Key? key, required this.camera}) : super(key: key);

  @override
  State<CameraSport> createState() => _CameraSportState();
}

class _CameraSportState extends State<CameraSport> {
  late CameraController _controller;
  late IO.Socket socket;
  late int frameNum;
  ImageUtils imageConverter = ImageUtils();
  imglib.PngEncoder pngEncoder = imglib.PngEncoder();
  String rec = "Проблема с подключением, попробуйте позже!!";

  @override
  void initState() {
    frameNum = 0;
    super.initState();


    // Initialize SocketIO connection
    //_socketIoInit();

    _cameraInit();

    // Start streaming camera frames

  }

  void _socketIoInit() {
    socket = IO.io('https://4827-45-8-98-163.ngrok-free.app',
        <String, dynamic>{'transports': ['websocket'],});
    socket.on('answer', (data) {
      setState(() {
        rec = data['message'];
      });
    });
    socket.connect();
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

  /*Timer scheduleTimeout([int milliseconds = 100]) =>
      Timer.periodic(Duration(milliseconds: milliseconds), takeAndSendImage);

  Future<void> takeAndSendImage(Timer timer) async {
    XFile image = await _controller.takePicture();
    List<int> frameBytes = await image.readAsBytes();
    socket.emit('stream', {'frame': frameBytes});
  }*/

  void _startStreamingFrames() async {
    await _controller.startImageStream((CameraImage image) {
      if (frameNum == 0) {
        imglib.Image convertedImage = imageConverter.convertCameraImage(image);
        imglib.Image compressedImage = imglib.copyResize(
            convertedImage, width: 224, height: 224);
        Uint8List pngImage = imglib.encodePng(compressedImage, level: 9);

        socket.emit('stream', {'frame': pngImage});
        frameNum = 0;
      }
      else {
        frameNum++;
      }
    });
  }


  /*Uint8List processCameraImage(CameraImage image) {
    return Uint8List.fromList(image.planes[0].bytes);
  }*/

  @override
  void dispose() {
    _controller.stopImageStream();
    _controller.dispose();
    socket.disconnect();
    print('>>>STOP');
    //scheduleTimeout().cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 18, right: 15, top: 48),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18, right: 18, top: 24),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  height: 136,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18, right: 18, top: 36),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.black
                      )
                  ),
                  child: CameraPreview(_controller),
                ),
              ),
              Padding(
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
              Padding(
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
                padding: EdgeInsets.only(left: 18, right: 18, top: 54),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red,
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      rec,
                      style: TextStyle(
                        fontFamily: 'ActayWide',
                        fontWeight: FontWeight.w700,
                        fontSize: 24
                      ),
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