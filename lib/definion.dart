

enum ChessColor { black, red }

abstract class Chessman {
  ChessColor get color;
  String get showText;
  bool get isBlack=>(color==ChessColor.black);
}
//{king,mandarins,elephant,rook,horse,cannon,pawn}
class King extends Chessman {
  final ChessColor _color;
  King(this._color);
  @override
  ChessColor get color => _color;

  @override
  String get showText => _color == ChessColor.red ? '帥' : '將';
}
class Mandarins extends Chessman {
  final ChessColor _color;
  Mandarins(this._color);
  @override
  ChessColor get color => _color;

  @override
  String get showText => _color == ChessColor.red ? '仕' : '士';
}
class Elephant extends Chessman {
  final ChessColor _color;
  Elephant(this._color);
  @override
  ChessColor get color => _color;

  @override
  String get showText => _color == ChessColor.red ? '相' : '象';
}
class Rook extends Chessman {
  final ChessColor _color;
  Rook(this._color);
  @override
  ChessColor get color => _color;

  @override
  String get showText => _color == ChessColor.red ? '俥' : '車';
}
class Hores extends Chessman {
  final ChessColor _color;
  Hores(this._color);
  @override
  ChessColor get color => _color;

  @override
  String get showText => _color == ChessColor.red ? '傌' : '馬';
}
class Cannon extends Chessman {
  final ChessColor _color;
  Cannon(this._color);
  @override
  ChessColor get color => _color;

  @override
  String get showText => _color == ChessColor.red ? '炮' : '包';
}
class Pawn extends Chessman {
  final ChessColor _color;
  Pawn(this._color);
  @override
  ChessColor get color => _color;

  @override
  String get showText => _color == ChessColor.red ? '兵' : '卒';
}

class ChessPlace{
  Chessman chess;
  int x;
  int y;
  ChessPlace(this.chess,this.x,this.y);
}


