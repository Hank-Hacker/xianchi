
import 'package:flutter/material.dart';
import 'package:xianchi/definion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
          '可能是象棋',
          style: TextStyle(fontSize: 30),
        )),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List ccls = [
    [],
    ['車', '馬', '象', '士', '將', '士', '象', '馬', '車'],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', '包', ' ', ' ', ' ', ' ', ' ', '包', ' '],
    ['卒', ' ', '卒', ' ', '卒', ' ', '卒', ' ', '卒'],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ['兵', ' ', '兵', ' ', '兵', ' ', '兵', ' ', '兵'],
    [' ', '炮', ' ', ' ', ' ', ' ', ' ', '炮', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ['俥', '傌', '相', '仕', '帥', '仕', '相', '傌', '俥'],
    [],
  ];
  List selected = [-1, -1];
  static const List black = ['車', '馬', '象', '士', '將', '包', '卒'];
  bool blacksture = false;
  @override
  Widget build(BuildContext context) {
    // List<Widget> cclw = [];
    // for (int x = 0; x < 9; x++) {
    //   cclw.add(Text(ccl[x]));
    // }
    return Align(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 360,
            width: 320,
            child: Table(
              border: TableBorder.all(),
              children: [
                for (int x = 0; x < 9; x++)
                  TableRow(children: [
                    for (int y = 0; y < 8; y++)
                      Container(
                        color: x == 4
                            ? Color.fromRGBO(150, 128, 89, 1)
                            : Color.fromRGBO(219, 188, 129, 1),
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        child: Text(
                          x == 4 ? " 楚河  漢界 "[y] : '',
                          style: TextStyle(fontSize: 25),
                        ),
                      )
                  ])
              ],
            ),
          ),
          SizedBox(
            width: 360,
            height: 400,
            child: Table(
              border: TableBorder.symmetric(),
              children: [
                for (int i = 0; i < ccls.length; i++)
                  TableRow(children: [
                    for (int j = 0; j < ccls[i].length; j++)
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: ccls[i][j] == ' '
                                    ? Colors.transparent
                                    : Color.fromARGB(255, 160, 141, 107),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Text(
                              ccls[i][j],
                              style: TextStyle(
                                fontSize: 20,
                                color: (black.contains(ccls[i][j]))
                                    ? Colors.black
                                    : Colors.red,
                              ),
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    if (ccls[i][j] != ' ' &&
                                        selected[0] == -1 &&
                                        blacksture ==
                                            black.contains(ccls[i][j])) {
                                      selected = [i, j];
                                    } else {
                                      if (selected[0] != -1) {
                                        if (black.contains(ccls[i][j]) !=
                                                black.contains(ccls[selected[0]]
                                                    [selected[1]]) ||
                                            (black.contains(ccls[selected[0]]
                                                        [selected[1]]) ==
                                                    false &&
                                                ccls[i][j] == ' ')) {
                                          ccls[i][j] =
                                              ccls[selected[0]][selected[1]];
                                          ccls[selected[0]][selected[1]] = ' ';
                                          selected = [-1, -1];
                                          blacksture = !blacksture;
                                        } else {
                                          selected = [i, j];
                                        }
                                      }
                                    }
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                                    side: ccls[i][j] == ' '
                                        ? BorderSide.none
                                        : BorderSide(
                                            color: Colors.black,
                                            width: 3,
                                          )),
                                child: SizedBox()),
                          ],
                        ),
                      )
                    // Center(
                    //   child: Container(
                    //     height: 40,
                    //     width: 40,
                    //     margin: EdgeInsets.all(5),
                    //     alignment: Alignment.center,
                    //     child: OutlinedButton(
                    //       onPressed: () {},
                    //       style: OutlinedButton.styleFrom(
                    //           shape: CircleBorder(),
                    //           backgroundColor: Color.fromRGBO(243, 161, 53, 0),
                    //           side: BorderSide(
                    //             color: Colors.black,
                    //             width: 3,
                    //           )),
                    //       child: Text(
                    //         ccls[i][j],
                    //         style: TextStyle(fontSize: 20,),
                    //         textAlign: TextAlign.center,
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ])
              ],
              /*children: [
              TableRow(
                 
            ]*/
            ),
          ),
        ],
      ),
    );
  }
}
