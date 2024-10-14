void main() async {
  // Se utiliza 'async' porque contiene una llamada a una función asíncrona.
  print('Inicio del programa');
  
  try {
    
    final value = await httpGet('https://fernando-herrera.com/cursos');
    // Llama a la función asíncrona 'httpGet' y espera a que devuelva un valor.
    print( value );
    
  } catch (err) {
    print('Tenemos un error: $err');
  }
  
  print('Fin del programa');
}


Future<String> httpGet( String url ) async {
  
  await Future.delayed( const Duration(seconds: 3));
  // Simula un retraso de 3 segundos antes de continuar la ejecución, 
  //como si estuviera esperando una respuesta de una petición HTTP.
  throw 'Error en la petición';
  
//   return 'Tenemos un valor de la petición';
  
}