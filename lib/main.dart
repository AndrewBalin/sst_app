import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'eat/cameraEat.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/user.dart';
import 'client/hive_names.dart';

import 'registration/intro.dart';
import 'registration/formController.dart';
import 'main/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>(HiveBoxes.user);

  final _cameras = await availableCameras();
  print(_cameras);
  final firstCamera = _cameras[1];

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;
  const MyApp({Key? key, required this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
            primary: Color.fromARGB(255, 255, 49, 27),
          )
      ),
      initialRoute: '/',
      onGenerateRoute: (routeSettings) {

        var path = routeSettings.name!.split('/');

        if(routeSettings.name == '/') {

          /*return MaterialPageRoute(
            builder: (context) => MainScreen(camera: camera),
          );*/

          Box<User> contactsBox = Hive.box<User>(HiveBoxes.user);
          var box = contactsBox.values;

          if(box.isNotEmpty) {
            return MaterialPageRoute(
              builder: (context) => MainScreen(camera: camera),
            );
          } else {
            return MaterialPageRoute(
              builder: (context) => IntroSlide(),
            );
          }
        } else if(path[0] == 'registration') {
          return MaterialPageRoute(
              builder: (context) => IntroSlide(), 
          );
        } else if(path[0] == 'form') {
          return MaterialPageRoute(
            builder: (context) => FormController()
          );
        }
      },
    );
  }
}