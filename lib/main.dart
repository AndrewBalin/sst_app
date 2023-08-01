import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
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

late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>(HiveBoxes.user);

  //_cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

          return MaterialPageRoute(
            builder: (context) => MainScreen(),
          );

          Box<User> contactsBox = Hive.box<User>(HiveBoxes.user);
          var box = contactsBox.values;

          if(box.isNotEmpty) {
            return MaterialPageRoute(
              builder: (context) => MainScreen(),
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

class CameraEat extends StatefulWidget {
  const CameraEat({Key? key}) : super(key: key);

  @override
  State<CameraEat> createState() => _CameraEatState();
}

class _CameraEatState extends State<CameraEat> {

  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
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
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: CameraPreview(controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          XFile image = await controller.takePicture();
          List<int> imageBytes = await image.readAsBytes();
          String imageBase64 = base64.encode(imageBytes);

          Map<String, String> body = {'image': imageBase64};

          print(jsonEncode(body));

          final response = await http.post(
              Uri.parse('https://1893-188-186-16-1.ngrok-free.app/send_image/'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(body)
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.camera),
      ),
    );
  }
}
