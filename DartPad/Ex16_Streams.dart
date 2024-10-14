void main() {
  
  emitNumbers().listen( (value) {
    // Escucha el stream que devuelve la función 'emitNumbers()' y procesa cada valor emitido.
    // Cada valor recibido será manejado en esta función anónima, que simplemente imprime el valor.
     print('Stream value: $value');
  });
} 


Stream<int> emitNumbers() {
  
  return Stream.periodic( const Duration(seconds: 1), (value){
//     print('desde periodic $value');
// Crea un Stream que emite valores periódicamente cada 1 segundo.
    // 'value' es el índice del evento, que se incrementa automáticamente cada vez que el Stream emite un nuevo valor.
    return value;
  }).take(5);
   // 'take(5)' limita el Stream para que solo emita los primeros 5 valores y luego se cierre.
}