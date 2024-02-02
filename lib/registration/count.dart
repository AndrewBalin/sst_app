import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';


class CountChoice extends StatefulWidget {

  Function(String name, String value) onSubmit;

  CountChoice(this.onSubmit, {Key? key}) : super(key:key);

  @override
  State<CountChoice> createState() => _CountChoiceState();
}

class _CountChoiceState extends State<CountChoice> {

  late String active = '';

  void NextPage() {
    if(active != '') {
      widget.onSubmit('count', active);
    }
    else {
      const snackbar = SnackBar(
        content: Text('Выберете количество!'),
        backgroundColor: Color.fromARGB(255, 255, 49, 27),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/registration/count.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.up,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 36, left: 18, right: 18),
            child: ElevatedButton(
              onPressed: () {
                NextPage();
              },
              child: const Text('Начать',
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
          Padding(
              padding: const EdgeInsets.only(bottom: 36, left: 18, right: 18),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          active = '5 раз и более';
                        });
                      },
                      child: const Text('5 раз и более',
                          style: TextStyle(fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 253, 254, 253)
                          )),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(13, 253, 254, 253), backgroundColor: Color.fromARGB(active=='5 раз и более' ? 39 : 13, 253, 254, 253),
                        padding: const EdgeInsets.only(top: 25, bottom: 25),
                        minimumSize: const Size(double.infinity, 0),
                        side: const BorderSide(
                            color: Color.fromARGB(100, 253, 254, 253),
                            width: 1,
                            style: BorderStyle.solid
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500),
                        ),
                      ),
                    ),
                  )
              )
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 18, left: 18, right: 18),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          active = '2-4 раза';
                        });
                      },
                      child: const Text('2-4 раза',
                          style: TextStyle(fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 253, 254, 253)
                          )),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(13, 253, 254, 253), backgroundColor: Color.fromARGB(active=='2-4 раза' ? 39 : 13, 253, 254, 253),
                        padding: const EdgeInsets.only(top: 25, bottom: 25),
                        minimumSize: const Size(double.infinity, 0),
                        side: const BorderSide(
                            color: Color.fromARGB(100, 253, 254, 253),
                            width: 1,
                            style: BorderStyle.solid
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500),
                        ),
                      ),
                    ),
                  )
              )
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 18, left: 18, right: 18),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          active = 'Не более 1 раза';
                        });
                      },
                      child: const Text('Не более 1 раза',
                          style: TextStyle(fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 253, 254, 253)
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(13, 253, 254, 253), backgroundColor: Color.fromARGB(active=='Не более 1 раза' ? 39 : 13, 253, 254, 253),
                        padding: const EdgeInsets.only(top: 25, bottom: 25),
                        minimumSize: const Size(double.infinity, 0),
                        side: const BorderSide(
                            color: Color.fromARGB(100, 253, 254, 253),
                            width: 1,
                            style: BorderStyle.solid
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500),
                        ),
                      ),
                    ),
                  )
              )
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 24, left: 18, right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Сколько тренирвок\nв неделю?',
                    style: TextStyle(fontFamily: 'ActayWide',
                        height: .8,
                        fontSize: min(24, size.width * 0.07),
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
          ),
          const Expanded(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 18, left: 18, right: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('5/5',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 253, 254, 253),
                            )
                        ),
                        InkWell(
                            child: Row(
                              children: [
                                Icon(Icons.keyboard_arrow_right_outlined,
                                    size: 50,
                                    color: Color.fromARGB(0, 253, 254, 253)
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                  )
              )
          )
        ],
      ),
    );
  }
}