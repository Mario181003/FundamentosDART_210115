void main() {
  // Clase con  parametros posicionales, deben respetar su orden para ser asignadas en la propiedad
  final wolverine = Hero('Logan', 'Regeneración');
  // Clase con parametros no posicionales, los puedo mandar en desorden
  final xmen = Group(type: 'Heroes', name: 'X-Men');

  final brotherhood = Group(name: 'Apocalyps');


  print(wolverine);
  print(wolverine.name);
  print(wolverine.power);
  print("----------------------------------");
  print(xmen);
  print(xmen.name);
  print(xmen.type);
  print(xmen.toString());
  print("----------------------------------");
  print(brotherhood.name);
  print(brotherhood.type);
  // Invocando al método rescrito con @override
  print(brotherhood.toString());
}

class Hero {
  String name;
  String power;
  
  Hero(String pName, String pPower)
    : name = pName,
      power = pPower;
}

class Group {
  String name;
  String type;

  Group({required this.name, this.type="No definido"});

  String toString()
  {
    return 'Group: $name, Tipo: $type';
  }
}