
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';


class WeightChoice extends StatefulWidget {

  Function(String name, String value) onSubmit;

  WeightChoice(this.onSubmit, {Key? key}) : super(key:key);

  @override
  State<WeightChoice> createState() => _WeightChoiceState();
}

class _WeightChoiceState extends State<WeightChoice> {

  var weigth = [for (var i = 30; i <= 150; i++) i];
  int _focusedIndex = 0;

  void NextPage() {
    widget.onSubmit('weight', weigth[_focusedIndex].toString());
  }


  void _onItemFocus(int index) {
    setState(() {
      setState(() {
        _focusedIndex = index;
      });
    });
  }

  Widget _buildItemList(BuildContext context, int index) {
    if (index == weigth.length) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (index == _focusedIndex) {
      return Padding(
        padding: EdgeInsets.zero,
        child: SizedBox(
            width: 80,
            height: 65,
            child: Center(
              child: Text('${weigth[index]}',
                style: const TextStyle(
                  fontFamily: 'ActayWide',
                  fontSize: 22,
                  color: Color.fromARGB(255, 253, 254, 253),
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
        ),
      );
    }
    else if (index == _focusedIndex + 1 || index == _focusedIndex - 1) {
      return Padding(
        padding: EdgeInsets.zero,
        child: SizedBox(
            width: 80,
            height: 65,
            child: Center(
              child: Text('${weigth[index]}',
                style: const TextStyle(
                  fontFamily: 'ActayWide',
                  fontSize: 22,
                  color: Color.fromARGB(178, 253, 254, 253),
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
        ),
      );
    }
    else if (index == _focusedIndex + 2 || index == _focusedIndex - 2) {
      return Padding(
        padding: EdgeInsets.zero,
        child: SizedBox(
            width: 80,
            height: 65,
            child: Center(
              child: Text('${weigth[index]}',
                style: const TextStyle(
                  fontFamily: 'ActayWide',
                  fontSize: 22,
                  color: Color.fromARGB(102, 253, 254, 253),
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.zero,
      child: SizedBox(
          width: 80,
          height: 65,
          child: Center(
            child: Text('${weigth[index]}',
              style: const TextStyle(
                fontFamily: 'ActayWide',
                fontSize: 22,
                color: Color.fromARGB(50, 253, 254, 253),
                fontWeight: FontWeight.w700,
              ),
            ),
          )
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/registration/weight.png"),
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
              child: const Text('Далее',
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
            padding: const EdgeInsets.only(bottom: 36),
            child: SizedBox(
                height: 65,
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 5, sigmaY: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          20),
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              100, 253, 254, 253),
                                          width: 2
                                      )
                                  ),
                                  width: 65,
                                  height: 65,
                                )
                            ),
                          ),
                        )
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ScrollSnapList(
                        itemBuilder: _buildItemList,
                        itemSize: 80,
                        dynamicItemSize: false,
                        itemCount: weigth.length,
                        onItemFocus: _onItemFocus,
                      ),
                    ),
                  ],
                )
            ),

          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24, left: 18, right: 18),
                child: Text(
                  'Ваш вес',
                  style: TextStyle(fontFamily: 'ActayWide',
                      height: .8,
                      fontSize: min(24, size.width * 0.07),
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const Expanded(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 18, left: 18, right: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2/5',
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