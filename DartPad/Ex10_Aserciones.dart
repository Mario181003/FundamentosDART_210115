void main() {
  final mySquare = Square(side: 10);
  mySquare.side = -32;
  print("Área que ocupa: ${mySquare.area}");
}
class Square {
  double _side;


  Square({required double side})
  : assert(side>0, 'Este error fue detectado por el assert'),_side=side;


  double get area {
      return _side * _side;
  }

  double get side {
      return _side;
  }


  set side(double value) {
      print("Asignando un nuevo valor al lado: $value");

      if (value < 0) throw 'Este error fue detectado por set';

      _side = value;
  }


  double calculateArea() {
      return _side * _side;
  }
}