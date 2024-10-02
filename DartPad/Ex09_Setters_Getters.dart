void main() {
  final mySquare = Square(side: 10);

  mySquare.side = -5;
  
  print('Lado del cuadrado: ${mySquare._side}');
  print('Area que ocupa: ${mySquare.calculateArea()}');

}

class Square {
  double _side;
  
  Square({required double side})
    : _side = side;

  double get area {
    return _side * _side;
  }

  set side(double value) {
    print('Asignando nuevo valor al lado $value');
    if (value <  0) throw 'El valor debe ser >= 0';

    _side = value;
  }

  double calculateArea() {
    return _side * _side;
  }
}