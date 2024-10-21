void main() async {
  print('Inicio del programa');

  try {
    final value = await httpGet('https://fernando-herrera.com/cursos');
    // Llama a la función asíncrona 'httpGet', y espera su respuesta con 'await'.
    // Si la función se ejecuta correctamente, almacena el valor en la variable 'value'.
    print('éxito: $value');
  } on Exception catch (err) {
    print('Tenemos una Exception: $err');
  } catch (err) {
    print('OOP!! algo terrible pasó: $err');
    // Este bloque se activa si ocurre una excepción del tipo 'Exception'.
    // El error capturado se almacena en la variable 'err'.
  } finally {
    print('Fin del try y catch');
  }

  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 4));
  // Simula un retraso de 4 segundos antes de continuar

  throw Exception('No hay parámetros en el URL');

//   throw 'Error en la petición';

//   return 'Tenemos un valor de la petición';
}

