import 'dart:math';

import 'package:flutter/material.dart';


class FormIntro extends StatefulWidget {

  Function(String name, String value) onSubmit;

  FormIntro(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<FormIntro> createState() => _FormIntroState();
}

class _FormIntroState extends State<FormIntro> {

  void nextPage() {
    widget.onSubmit('form', 'ok');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/registration/form.png"),
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
                nextPage();
              },
              child: const Text('Пройти опрос',
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
          const Padding(
            padding: EdgeInsets.only(bottom: 36, left: 18, right: 18),
            child: Text(
              'Чтобы раскрыть все возможности\nприложения, необходимо ответить\nна несколько вопросов',
              style: TextStyle(fontFamily: 'Montserrat',
                  fontSize: 14,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 24, left: 18, right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Создайте свой план\nтренировок',
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
                      InkWell(
                          child: Icon(Icons.keyboard_arrow_left_outlined,
                              size: 50,
                              color: Color.fromARGB(255, 253, 254, 253)
                          )
                      ),
                      InkWell(
                          child: Row(
                            children: [
                              Text('Пропустить',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 253, 254, 253),
                                  )
                              ),
                              Icon(Icons.keyboard_arrow_right_outlined,
                                  size: 50,
                                  color: Color.fromARGB(255, 253, 254, 253)
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