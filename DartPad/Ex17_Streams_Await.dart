// Stream asíncrono que emite valores secuencialmente con un retraso de 1 segundo entre cada emisión.
void main() {

  emitNumber()
     .listen( (int value) {
        // Escucha el stream emitido por la función 'emitNumber()'.
      // Cada vez que se recibe un valor, se ejecuta esta función.

       print( 'Stream value: $value' );
     }); 
}


Stream<int> emitNumber() async* {

  final valuesToEmit = [1,2,3,4,5];
  // Crea una lista de valores (del 1 al 5) que se emitirán.

  for( int i in valuesToEmit ) {
     // Itera sobre cada valor de la lista 'valuesToEmit'.
    await Future.delayed( const Duration(seconds: 1));
    // Introduce un retraso de 1 segundo antes de emitir cada valor.
    yield i;
  }
}