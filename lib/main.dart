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
            title: Text(
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
  @override
  List<List<Chessman?>> ccls =
      List.generate(10, (index) => List.generate(9, (index) => null));
  void initState() {
    List<ChessPlace> puts = [
      ChessPlace(Rook(ChessColor.black), 0, 0),
      ChessPlace(Hores(ChessColor.black), 1, 0),
      ChessPlace(Elephant(ChessColor.black), 2, 0),
      ChessPlace(Mandarins(ChessColor.black), 3, 0),
      ChessPlace(King(ChessColor.black), 4, 0),
      ChessPlace(Mandarins(ChessColor.black), 5, 0),
      ChessPlace(Elephant(ChessColor.black), 6, 0),
      ChessPlace(Hores(ChessColor.black), 7, 0),
      ChessPlace(Rook(ChessColor.black), 8, 0),
      ChessPlace(Cannon(ChessColor.black), 1, 2),
      ChessPlace(Cannon(ChessColor.black), 7, 2),
      ChessPlace(Pawn(ChessColor.black), 0, 3),
      ChessPlace(Pawn(ChessColor.black), 2, 3),
      ChessPlace(Pawn(ChessColor.black), 4, 3),
      ChessPlace(Pawn(ChessColor.black), 6, 3),
      ChessPlace(Pawn(ChessColor.black), 8, 3),
      ChessPlace(Rook(ChessColor.red), 0, 9),
      ChessPlace(Hores(ChessColor.red), 1, 9),
      ChessPlace(Elephant(ChessColor.red), 2, 9),
      ChessPlace(Mandarins(ChessColor.red), 3, 9),
      ChessPlace(King(ChessColor.red), 4, 9),
      ChessPlace(Mandarins(ChessColor.red), 5, 9),
      ChessPlace(Elephant(ChessColor.red), 6, 9),
      ChessPlace(Hores(ChessColor.red), 7, 9),
      ChessPlace(Rook(ChessColor.red), 8, 9),
      ChessPlace(Cannon(ChessColor.red), 1, 7),
      ChessPlace(Cannon(ChessColor.red), 7, 7),
      ChessPlace(Pawn(ChessColor.red), 0, 6),
      ChessPlace(Pawn(ChessColor.red), 2, 6),
      ChessPlace(Pawn(ChessColor.red), 4, 6),
      ChessPlace(Pawn(ChessColor.red), 6, 6),
      ChessPlace(Pawn(ChessColor.red), 8, 6),
    ];
    for (var element in puts) {
      ccls[element.y][element.x] = element.chess;
    }
    super.initState();
  }

  List selected = [-1, -1];
  //static const List black = ['車', '馬', '象', '士', '將', '包', '卒'];
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
                        child: Builder(builder: (_) {
                          if (ccls[i][j] != null) {
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 160, 141, 107),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Text(
                                  ccls[i][j]!.showText,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: ccls[i][j]!.isBlack
                                        ? Colors.black
                                        : Colors.red,
                                  ),
                                ),
                                OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (selected[0] == -1 &&
                                            blacksture ==
                                                (ccls[i][j]!.isBlack)) {
                                          selected = [i, j];
                                        } else {
                                          if (ccls[i][j]!.isBlack !=
                                              ccls[selected[0]][selected[1]]!
                                                  .isBlack) {
                                            ccls[i][j] =
                                                ccls[selected[0]][selected[1]];
                                            ccls[selected[0]][selected[1]] =
                                                null;
                                            selected = [-1, -1];
                                            blacksture = !blacksture;
                                          } else {
                                            selected = [i, j];
                                          }
                                        }
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                        shape: CircleBorder(),
                                        backgroundColor:
                                            Color.fromRGBO(0, 0, 0, 0),
                                        side: BorderSide(
                                          color: Colors.black,
                                          width: 3,
                                        )),
                                    child: null),
                              ],
                            );
                          } else
                            return SizedBox(
                              height: 20,
                              width: 20,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      shape: CircleBorder(),
                                      backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                                      side: BorderSide.none),
                                  onPressed: () {
                                    setState(() {
                                      if (selected[0] != -1) {
                                        ccls[i][j] =
                                            ccls[selected[0]][selected[1]];
                                        ccls[selected[0]][selected[1]] = null;
                                        blacksture = !blacksture;
                                        selected = [-1, -1];
                                      }
                                    });
                                  },
                                  child: null),
                            ); ////////////
                        }),
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
