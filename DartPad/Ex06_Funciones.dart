void main() {
  
//FUNCIONES
//1. Llamado de una Funcion Basica
  greetEveryone();
//2. Llamado de una funcion que retorna un valor 
//2.1 Si no deseamos almacenar el valor, se invoca normalmente
 print("Hola es el dia numero: ${getDayNumber()}");
//2.2 Necesitamos almacenar el valor retornado para utilizar su valor en otras operaciones del programa
  final numeroDia = getDayNumber();
  print("En 3 dias estaremos a: ${(numeroDia+3)}");

//3. Llamado de una funcion con parametros
  print(greetSomeone("Mario"));
//3.1 Y que pasa si intentamos?
  print(greetSomeone(45));
  print(greetSomeone(-15));
  print(greetSomeone(3.141516));
  print(greetSomeone(true));

  /*//3.2 
  print(greetSomeone(45));
  print(greetSomeone(-15));
  print(greetSomeone(true));*/
  print(greetSomeoneTyped("Mario Gutierrez Rosales"));
  
  //4. Llamado de Funcion con varios parametros posicionales.
  //Para este caso los parametros deben ser enviados en la posicion exacta y segun DART ambos por defecto son obligatorios
  print(greetSomeoneHourOfDay("Mariox", 22));
  // Que pasa si solo envio un parametro?
  //print(greetSomeoneHourOfDay("Marco-Chetos"));
  //print(greetSomeoneHourOfDay(10));
  //print(greetSomeoneHourOfDay(nulll,null));
  /*Analizando la funcion determinamos que la hora del dia puede ser nulo, y se puede definir con la hora actual del dia*/
  print(greetSomeoneHourOfDay("Marinho",null));
  print(greetSomeoneHourOfDay("MGR"));

//5. FUNCIONES LAMBDA, ARROW FUNCIONES FLECHA
  // Las funciones lambda, tambien conocidas como funciones anonimas o funciones flecha, se ejecutan de manera simple y no frecuente en la ejecucion de un programa o sistema, en DART estas funciones solo pueden tener una sola instruccion para usar el operador =>
  //final double costoTotal;
  var calculaTotalCarrito =  (double productQuantity, double productPrice, double percentageDiscount) => (productQuantity*productPrice)*((100-percentageDiscount))/100;

  double cantidad = 3.180;
  double precio = 1725.10;
  double descuento = 8;
  
  print("""Costo del producto: ${precio} 
  Cantidad solicitada:${cantidad}
  Descuento definido: ${descuento}
  -----------------------------------------------------------
  Costo Total: ${calculaTotalCarrito(cantidad, precio, descuento)}""");
  
  
  // 6. Llamado de una funcion con parametros nombrados
  print(infoCartLisStatus(buyerName: "Gabriel"));
  
  // 6.1 Llamado de una funcion con los paremetros en desorden posicional
  print(infoCartLisStatus(status: "En espera de Pago",
                         amountCarList: 505.00,
                         buyerName: "Luis Mario"));
}

//1. FUNCIONES SIN PARAMETROS Y SIN RETORNO DE VALOR
greetEveryone()  // <-- Dynamic
{
  print("Hola a Todos desde DART");
}

//2. FUNCIONES QUE RETORNAN VALORES
getDayNumber()  // <-- Retorna un entero 
{
  DateTime now = DateTime.now();
  return now.day;
}

//3. FUNCIONES QUE REQUIEREN DE ALMENOS UN PARAMETRO (Sin Tipificacion)
String greetSomeone(personaName)
{
  return "Hola, ${personaName}";
}

// 3.1 FUNCION QUE RECIBE PARAMETROS TIPIFICADOS
String greetSomeoneTyped(String personaName)
{
  return "Hola, ${personaName}";
}

//4. FUNCIONES QUE RECIBE MAS DE UN PARAMETRO
// int? - puede ser vacio
// [] - puede ser opcional
String greetSomeoneHourOfDay(String personaName, [int? hourDay])
{
  String greeting;
  //El operador ??= significa que si es nulo lo inicialice como, encaso de que tenga valor ignora la instruccion
  hourDay ??= DateTime.now().hour;
  print("Hora: ${hourDay}");
  
  if(hourDay>= 6 && hourDay<12)
  {
    greeting = "Buenos Dias";
  }
  else if (hourDay >= 12 && hourDay < 18)
  {
    greeting = "Buenas Tardes";
  }
  else
  {
    greeting = "Buenas Noches";
  }
  
  
  return "${greeting}, ${personaName}";
}


//6. FUNCIONES CON PARAMETROS NOMBRADOS
String infoCartLisStatus({required String buyerName, double amountCarList=0.0, String status= "Seleccion de Productos"})
{
  return "El carrito de compras de: ${buyerName}, tiene un total de: \$${amountCarList} y actualmente está en estatus: ${status}";
}