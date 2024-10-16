void main() {
  
//   Declarando una variable generica para almacenar mi nombre
  var myName = 'Marinho';
  String myLastName = 'Gutiérrez';
  final int myDNI = 210115;
  // late final int myAge;
  
//   Corregir mi nombre
  myName = "Mario";
  
  print('Hola, $myName $myLastName, tu matricula es: $myDNI y tu edad aún no la conozco, por que no se cuando naciste.');
  
//   Interpolando el valor de las variables con metodos de manipulación o transformación
  print('\Hola, ${myName.toUpperCase()} ${myLastName.toUpperCase()}, tu matricula es: $myDNI y tu edad aún no la conozco, por que no se cuando naciste.');
}