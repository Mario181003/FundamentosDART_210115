abstract class Animal {}

abstract class Mamifero extends Animal {}
abstract class Ave extends Animal {}
abstract class Pez extends Animal {}

mixin Volador {
  void volar() => print('Estoy volando');
  void planear(int distanciaMaxima) => print('Este animal puede planear hasta: ${distanciaMaxima} km/h');
  void ascender(double alturaMaxima) => print('Este animal pude ascender hasta una altura de ${alturaMaxima} mts. sobre el nivel del mar');
  void descender(String velocidadMaxima) =>print('Este animal descendera a una velocidad hasta: ${velocidadMaxima}');
}

mixin Caminante {
  void caminar() => print('Estoy caminando');
  void correr(double velocidadMax) => print('Este animal puede correr hasta: ${velocidadMax} km/h');
  void trotar(bool trote) => print('El animal trota: ${trote}');
  void saltar(bool salto) => print('El animal salta: ${salto}');
}

mixin Nadador {
  void nadar() => print('Estoy nadando');
  void sumergir(double profundidadMax) => print('Este animal se puede sumergir hasta: ${profundidadMax} metros');
  void respirar(bool respira) => print('El animal respira bajo el agua: ${respira}');
}

class Delfin extends Mamifero with Nadador {}
class Murcielago extends Mamifero with Volador, Caminante {}
class Gato extends Mamifero with Caminante {}

class Paloma extends Ave with Caminante, Volador {}
class Pato extends Ave with Caminante, Volador, Nadador {}

class Tiburon extends Pez with Nadador {}
class PezVolador extends Pez with Nadador, Volador {}

// Actividad  
class DelfinChatoAustraliano extends Mamifero with Nadador, Caminante {}
class MurcielagoOrejasRaton extends Mamifero with Volador, Caminante {}

void main() {
  final flipper = Delfin();
  print("Instanciando la clase de Delfin, y accediendo a sus funciones");
  flipper.nadar();

  print("---------------------------------------------------------------------------");
  print("Instanciando la clase de Murcielago, y accediendo a sus funciones");
  final chupacabras = Murcielago();
  chupacabras.caminar();
  chupacabras.volar();

  print("---------------------------------------------------------------------------");
  print("Instanciando la clase de Pato, accediendo a sus funciones");
  final pekines = Pato();
  pekines.caminar();
  pekines.planear(100);
  pekines.ascender(30);
  pekines.descender("5 km/h");
  pekines.volar();
  pekines.nadar();

  print("-----------------------------------------------------------------------------");
  print("-----------------------------------------------------------------------------");
  print("Instanciando la clase de Delfin chato Australiano, accediendo a sus funciones");
  final delfinChatoAus = DelfinChatoAustraliano();
  delfinChatoAus.nadar();
  delfinChatoAus.sumergir(100);
  delfinChatoAus.respirar(false);
  delfinChatoAus.saltar(true);

  print("-----------------------------------------------------------------------------");
  print("Instanciando la clase de Murcielago Orejas de Raton, accediendo a sus funciones");
  final mucielagoOrejasRat = MurcielagoOrejasRaton();
  mucielagoOrejasRat.volar();
  mucielagoOrejasRat.planear(20);
  mucielagoOrejasRat.ascender(20);
  mucielagoOrejasRat.descender("20 km/h");
  mucielagoOrejasRat.caminar();
  mucielagoOrejasRat.correr(1);
  mucielagoOrejasRat.trotar(false);
  mucielagoOrejasRat.saltar(true);
}