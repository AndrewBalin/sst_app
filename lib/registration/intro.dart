import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../client/hive_names.dart';
import '../models/user.dart';

class BottomSheet extends StatefulWidget {
  const BottomSheet({Key? key}) : super(key:key);

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {

  String _email = '';
  String _login = '';
  String _password = '';

  void _register() async {
    if([_email, _login, _password].contains('')){
      const snackbar = SnackBar(
        content: Text('Заполните все поля!'),
        backgroundColor: Color.fromARGB(255, 255, 49, 27),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    else {

      var body = {
        'username': _login,
        'email': _email,
        'password': _password
      };

      final response = await http.post(
        Uri.parse('https://sst-server.vercel.app/registration/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body)
      );
      print(response.body);
      Box<User> contactsBox = Hive.box<User>(HiveBoxes.user);
      contactsBox.add(User(token: json.decode(response.body)['token'], username: _login, email: _email));
      Navigator.popAndPushNamed(
          context,
          'form/',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 18, top: 48),
          child: Text(
            'Новый аккаунт',
            style: TextStyle(fontFamily: 'ActayWide',
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 18, top: 36, right: 18),
            child: TextField(
              onChanged: (email) {
                _email = email;
              },
              style: const TextStyle(fontFamily: 'Montserrst',
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail_outline, size: 25),
                labelText: 'Почта',
                labelStyle: TextStyle(fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 212, 212, 212)
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            )
        ),
        Padding(
            padding: const EdgeInsets.only(left: 18, top: 24, right: 18),
            child: TextField(
              onChanged: (login) {
                _login = login;
              },
              style: const TextStyle(fontFamily: 'Montserrst',
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outlined, size: 25),
                labelText: 'Логин',
                labelStyle: TextStyle(fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 212, 212, 212)
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            )
        ),
        Padding(
            padding: const EdgeInsets.only(left: 18, top: 24, right: 18),
            child: TextField(
              onChanged: (password) {
                _password = password;
              },
              style: const TextStyle(fontFamily: 'Montserrst',
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.key_outlined, size: 25),
                  labelText: 'Пароль',
                  labelStyle: TextStyle(fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 212, 212, 212)
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  suffixIcon: Icon(Icons.visibility_off_outlined)
              ),
            )
        ),
        Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 36, left: 18, right: 18),
                  child: ElevatedButton(
                    onPressed: () {
                      _register();
                    },
                    child: const Text('Зарегистрироваться',
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
                  )
              ),
            )
        ),
      ],
    );
  }
}


class IntroSlide extends StatefulWidget {
  const IntroSlide({Key? key}) : super(key:key);

  @override
  State<IntroSlide> createState() => _IntroSlideState();
}

class _IntroSlideState extends State<IntroSlide> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/registration/intro.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 36, left: 18, right: 18),
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                      constraints: BoxConstraints.loose(Size(
                          size.width,
                          size.height * 0.7)),
                      isScrollControlled: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                      ),
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: size.height * 0.7,
                          child: const BottomSheet(),
                        );
                      }
                  );
                },
                child: const Text('Зарегистрироваться',
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
              padding: EdgeInsets.only(bottom: 36, left: 18, right: 70),
              child: Text(
                'Составьте персональный план\nтренировок и тренируйтесь эффективно\nс искусственным интелектом',
                style: TextStyle(fontFamily: 'Montserrat',
                    fontSize: 14,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 24, left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'сам себе',
                      style: TextStyle(fontFamily: 'ActayWide',
                          height: .8,
                          fontSize: min(55, size.width * 0.14),
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,

                    ),
                    Text(
                      'тренер',
                      style: TextStyle(fontFamily: 'ActayWide',
                          height: .8,
                          fontSize: min(90, size.width * 0.22),
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                    ),
                  ],
                )
            ),
          ],
        ),
      )
    );
  }
}