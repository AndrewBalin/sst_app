
import 'package:flutter/material.dart';




class HeaderBar extends StatefulWidget {

  late String name;
  HeaderBar(this.name, {Key? key}) : super(key:key);

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {

  final int _currentIndex = 0;

  final PageController _controller = PageController();
  Map<String, String> userData = {};

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Container(
        child: Column(
          children: [
            /*Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      child: Stack(
                        children: [
                          Center(
                              child: Container(
                                child: const CircleAvatar(
                                  radius: 17,
                                  backgroundImage: NetworkImage(
                                      'https://i.pinimg.com/736x/1f/86/60/1f8660ca4dc4ea88ec93ca0f29f376dd.jpg'
                                  ),
                                ),
                                width: 37,
                                height: 37,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 255, 49, 27),
                                        width: 1)
                                ),
                              )
                          )
                        ],
                      )
                  ),
                  const InkWell(
                    child: Icon(Icons.bookmark_border_outlined, size: 30),
                  ),
                ],
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 18, right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const InkWell(
                      child: Icon(Icons.arrow_back_ios_new, size: 30)
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(
                        fontFamily: 'ActayWide',
                        fontSize: 22,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  const InkWell(
                    child: Icon(Icons.settings_outlined, size: 30),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}