
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


import 'package:sstapp/registration/formController.dart';


import '../header.dart';

enum Active { low, moderate, middle, high }
enum Nutrition { classic, vegetarianism, vegan, raw }

class DietScreen extends StatefulWidget {

  final CameraDescription camera;
  const DietScreen({Key? key, required this.camera}) : super(key:key);

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {

  FormController formController = const FormController();
  Active? _active = Active.moderate;
  Nutrition? _nutrition = Nutrition.classic;
  Map<String, dynamic> data = {};

  Future<void> sendData() async {
    /*final response = await http.post(
        Uri.parse('https://d2cc-62-182-140-2.ngrok-free.app/send_diet'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data)
    );*/
    showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return const SingleChildScrollView(
            child: Column(
              children: [
                Text('''Вот рацион питания на неделю, учитывая твои требования:

            Понедельник:
            Завтрак: Омлет из двух яиц с овощами (помидоры, шпинат, грибы), половина авокадо и кусочек цельнозернового хлеба.
          Обед: Гриль из куриных грудок с овощным салатом (помидоры, огурцы, перец, листья салата) и заправкой из оливкового масла и лимонного сока.
          Ужин: Печеный лосось с цельнозерновой кускусом и паровой брокколи.

          Вторник:
          Завтрак: Овсянка на молоке со свежими ягодами (клубника, черника, малина), орехами и медом.
          Обед: Говяжья филе с гречкой и тушеными овощами (морковь, кабачки, лук).
          Ужин: Тушеный куриный стейк с картофельным пюре и отварными брюссельской капустой.

          Среда:
          Завтрак: Гречневая каша на воде с грецким орехом и свежими ягодами.
          Обед: Томатный суп с добавлением куриных ломтиков и кусочками цельнозернового хлеба.
          Ужин: Печеные креветки с овощным салатом (авокадо, помидоры, огурцы) и лимонно-имбирной заправкой.

          Четверг:
          Завтрак: Тосты из цельнозернового хлеба с творогом, медом и ягодами.
          Обед: Кускус с тушеными куриными грудками и овощами (перец, лук, морковь).
          Ужин: Грибной суп с оризом и запеченной кулешей из кабачков.

          Пятница:
          Завтрак: Йогурт с мюсли, сухофруктами и медом.
          Обед: Тушеный лосось с отварной картошкой и овощным гарниром (брокколи, морковь).
          Ужин: Тушеная куринная грудка с цельнозерновым рисом и паровыми овощами (шпинат, капуста).

          Суббота:
          Завтрак: Омлет с овощами (помидоры, грибы, шпинат) и цельнозерновой обжаренной лепешкой.
          Обед: Говяжья тушенка с картофельным пюре и свежими овощами.
          Ужин: Тушеные куриные грудки с запеченным цветным перцем и отварным гречкой.

          Воскресенье:
          Завтрак: Гречневая каша на молоке с орехами и свежими ягодами.
          Обед: Тушеная рыба с отварным картофелем и овощами (брокколи, морковь).
          Ужин: Запеченные овощи (баклажаны, цветная капуста, кабачки) с кускусом.

          Учти, что рацион питания рассчитан на улучшение сна и снижение веса. Включай в рацион свежие фрукты и овощи, употребляй достаточное количество белка, углеводов и здоровых жиров. Важно также пить достаточное количество воды и ограничить употребление сахара и соли.''')
              ],
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderBar('Питание'),
          Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18, top: 24),
                    child: SizedBox(
                      height: 60,
                      child: Center(

                        child: TextField(
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.calendar_today_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 255, 49, 27),
                                    width: 2)
                            ),
                            labelText: 'Дата рождения',
                            labelStyle: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Monsterrat',
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          onChanged: (value) {
                            data['burndate'] = value;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 38, top: 18),
                            child: Text(
                              'Уровень физ. активности',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 22, top: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Radio(
                                  value: Active.low,
                                  hoverColor: const Color.fromARGB(
                                      255, 255, 49, 27),
                                  onChanged: (Active? value) {
                                    setState(() {
                                      _active = value;
                                    });
                                  },
                                  groupValue: _active,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 5),
                                    child: SizedBox(
                                      width: size.width - 18 - 18 - 52 - 52,
                                      child: const Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            'Низкий',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Text(
                                              'Веду малоподвижный образ жизни, почти не занимаюсь спортом',
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 22, top: 18),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Radio(
                                  value: Active.moderate,
                                  onChanged: (Active? value) {
                                    setState(() {
                                      _active = value;
                                    });
                                  },
                                  groupValue: _active,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 10, top: 5),
                                    child: SizedBox(
                                      width: size.width - 18 - 18 - 52 - 52,
                                      child: const Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            'Умеренный',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Text(
                                              'Тренировкм низкой активности (ходьба, езда на велосипеде, плавание, йога) 1-2 раза в неделю',
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 22, top: 18),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Radio(
                                  value: Active.middle,
                                  onChanged: (Active? value) {
                                    setState(() {
                                      _active = value;
                                    });
                                  },
                                  groupValue: _active,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 10, top: 5),
                                    child: SizedBox(
                                      width: size.width - 18 - 18 - 52 - 52,
                                      child: const Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            'Средний',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Text(
                                              'Много и часто хожу, выполняю тренировки средней сложности 1-4 раза в неделю и не менее 30 минут',
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 22, top: 18, bottom: 24),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Radio(
                                  value: Active.high,
                                  onChanged: (Active? value) {
                                    setState(() {
                                      _active = value;
                                    });
                                  },
                                  groupValue: _active,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 10, top: 5),
                                    child: SizedBox(
                                      width: size.width - 18 - 18 - 52 - 52,
                                      child: const Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            'Высокий',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Text(
                                              'Выолняю высокоинтенсивные тренировки или тяжёлую физическую работу 5-7 раз в неделю',
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
                      child: SizedBox(
                        height: 60,
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Желаемый вес',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 255, 49, 27),
                                      width: 2)
                              ),
                            ),
                            onChanged: (value) {
                              data['weight'] = value;
                            },
                          ),
                        ),
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
                      child: SizedBox(
                        height: 180,
                        child: TextField(
                          minLines: 5,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            labelText: 'Заболевания, если есть - перечислите',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 255, 49, 27),
                                    width: 2)
                            ),
                          ),
                          onChanged: (value) {
                            data['zab'] = value;
                          },
                        ),
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
                      child: SizedBox(
                        height: 180,
                        child: TextField(
                          minLines: 5,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            labelText: 'Любимые продукты и блюда',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 255, 49, 27),
                                    width: 2)
                            ),
                          ),
                          onChanged: (value) {
                            data['like'] = value;
                          },
                        ),
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
                      child: SizedBox(
                        height: 180,
                        child: TextField(
                          minLines: 5,
                          maxLines: 5,
                          decoration: InputDecoration(
                            labelText: 'Нелюбимые продукты и блюда',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 255, 49, 27),
                                    width: 2)
                            ),
                          ),
                          onChanged: (value) {
                            data['dislike'] = value;
                          },
                        ),
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 24, top: 18),
                                child: Text(
                                  'Образ питания',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 22, top: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Radio(
                                      value: Nutrition.classic,
                                      onChanged: (Nutrition? value) {
                                        setState(() {
                                          _nutrition = value;
                                        });
                                      },
                                      groupValue: _nutrition,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Классическое питание',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 22, top: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Radio(
                                      value: Nutrition.vegetarianism,
                                      onChanged: (Nutrition? value) {
                                        setState(() {
                                          _nutrition = value;
                                        });
                                      },
                                      groupValue: _nutrition,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Вегитарианство',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 22, top: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Radio(
                                      value: Nutrition.vegan,
                                      onChanged: (Nutrition? value) {
                                        setState(() {
                                          _nutrition = value;
                                        });
                                      },
                                      groupValue: _nutrition,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Веганство',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 22, top: 10, bottom: 24),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Radio(
                                      value: Nutrition.raw,
                                      onChanged: (Nutrition? value) {
                                        setState(() {
                                          _nutrition = value;
                                        });
                                      },
                                      groupValue: _nutrition,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Сыроедчество',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ]
                        ),
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 18, right: 18, top: 18),
                      child: SizedBox(
                        height: 180,
                        child: TextField(
                          minLines: 5,
                          maxLines: 5,
                          decoration: InputDecoration(
                            labelText: 'Аллергия на продукты',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10),
                                borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(
                                        255, 255, 49, 27), width: 2)
                            ),
                          ),
                          onChanged: (value) {
                            data['allergy'] = value;
                          },
                        ),
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 18, right: 18, top: 18),
                      child: SizedBox(
                        height: 60,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Сколько раз в день хотите питаться',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10),
                                borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(
                                        255, 255, 49, 27), width: 2)
                            ),
                          ),
                          onChanged: (value) {
                            data['count'] = value;
                          },
                        ),
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 18, right: 18, top: 36, bottom: 24),
                      child: ElevatedButton(
                        onPressed: () {
                          sendData();
                        },
                        child: const Text('Далее',
                            style: TextStyle(fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 255, 49, 27),
                            padding: const EdgeInsets.only(
                                top: 25, bottom: 25),
                            minimumSize: const Size(double.infinity, 0),
                            elevation: 7,
                            shadowColor: const Color.fromARGB(
                                255, 243, 93, 77),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(500)
                            )
                        ),
                      )
                  )
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}