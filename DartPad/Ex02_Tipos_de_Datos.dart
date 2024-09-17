void main() {
  // Practica 04: Tipos de datos en Dart

  final String pokemon = "Pikachu";
  final int hp = 100;
  final bool isAlive = true;
  
  // Listas (List)
  final abilities = ['Impact-Trueno', 'Cola de Hierro', 'Ataque Rapido'];
  final sprites = <String>['Pikachu_front.png', 'Pikache_back.png'];
  
  print(""" El pokemon que elegiste es: $pokemon
  ------------------------------------------------------------
  Las estadisticas de $pokemon son:
  Vida (HP): $hp
  Estatus de Vida: $isAlive
  Habilidades: $abilities
  Imágenes: $sprites
  """);
}