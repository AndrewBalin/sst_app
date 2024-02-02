
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';





import '../header.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({Key? key}) : super(key:key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final int _currentIndex = 0;
  Map<String, String> userData = {};
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

  void getProfileInfo() {

  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HeaderBar('Профиль'),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Stack(
            children: [
              Center(
                  child: Container(
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          'https://i.pinimg.com/736x/1f/86/60/1f8660ca4dc4ea88ec93ca0f29f376dd.jpg'
                      ),
                    ),
                    width: 124,
                    height: 124,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(62),
                        border: Border.all(
                            color: const Color.fromARGB(
                                255, 255, 49, 27),
                            width: 2)
                    ),
                  )
              )
            ],
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Александр",
              style: TextStyle(
                  fontFamily: 'ActayWide',
                  fontSize: 22,
                  fontWeight: FontWeight.w700
              ),
            ),
        ),
        const Padding(
            padding: EdgeInsets.only(top: 24, left: 42, right: 42),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.auto_graph, size: 30, color: Color(0xFFF35D4D)),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Активность',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        height: 0.07,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 30),
                ],
              ),
            )
        ),
        const Padding(
            padding: EdgeInsets.only(top: 24, left: 42, right: 42),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.pie_chart, size: 30, color: Color(0xFFF35D4D)),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Мои параметры',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        height: 0.07,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 30),
                ],
              ),
            )
        ),
        const Padding(
            padding: EdgeInsets.only(top: 72, left: 42, right: 42),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.messenger_outlined, size: 30, color: Color(0xFFF35D4D)),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Поддержка',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        height: 0.07,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 30),
                ],
              ),
            )
        ),
        const Padding(
            padding: EdgeInsets.only(top: 24, left: 42, right: 42),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.attach_money, size: 30, color: Color(0xFFF35D4D)),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Поддержите нас',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        height: 0.07,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 30),
                ],
              ),
            )
        ),
      ],
    );
  }
}