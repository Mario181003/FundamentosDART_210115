void main() {
  // CASO DE PRUEBA 1 -- NUEVO MIEMBRO QUE SE REGISTRA HOY
  final miembro1 = Miembro(
    ID: 1,
    tituloCortesia: "Ing.",
    nombre: "Mario",
    primerApellido: "Gutierrez",
    segundoApellido: "Rosales",
    fechaNacimiento: DateTime(2003, 10, 18), 
    fotografia: "url/foto.jpg",
    genero: "M", 
    tipoSangre: "O+",
    membresiaID: 1,
    usuarioID: 1,
    tipoMembresia: "Semanal",
  );
  print(miembro1);

  // CASO DE PRUEBA 2 -- MIEMBRO QUE RENUEVA SU MEMBRESÍA
  final miembro2 = Miembro(
    ID: 2,
    tituloCortesia: "Dr.",
    nombre: "Jonathan",
    primerApellido: "Rendon",
    segundoApellido: "Carbajal",
    fechaNacimiento: DateTime(2003, 05, 06), 
    fotografia: "url/foto2.jpg",
    genero: "M", 
    tipoSangre: "O+",
    membresiaID: 2,
    usuarioID: 2,
    tipoMembresia: "Mensual",
  );
  print(miembro2);

  // CASO DE PRUEBA 3 -- CANCELANDO LA MEMBRESÍA DE UN MIEMBRO
  print("Cancelando la membresía del miembro 2:");
  miembro2.cancelaSuscripcion();
  print(miembro2);
}

// Clase abstracta <Persona>
// Representa una estructura básica para una persona con atributos comunes.
abstract class Persona {
  int ID; 
  String? tituloCortesia; 
  String nombre; 
  String primerApellido;
  String segundoApellido; 
  DateTime fechaNacimiento; 
  String? fotografia; 
  String genero; 
  String tipoSangre; 
  DateTime fechaRegistro; 
  DateTime? fechaActualizacion; 

  // Constructor de la clase abstracta Persona
  Persona({
    required this.ID,
    this.tituloCortesia,
    required this.nombre,
    required this.primerApellido,
    required this.segundoApellido,
    required this.fechaNacimiento,
    this.fotografia,
    required this.genero,
    required this.tipoSangre,
    DateTime? fechaRegistro,
    DateTime? fechaActualizacion,
  })  : fechaRegistro = fechaRegistro ?? DateTime.now(), // Fecha de registro por defecto es la actual
        fechaActualizacion = fechaActualizacion;

  // Método abstracto que deben implementar las clases hijas.
  void cancelaSuscripcion();
}

// Clase <Miembro> que extiende de <Persona>
// Representa a un miembro del gimnasio, con datos específicos de su membresía.
class Miembro extends Persona {
  int membresiaID; 
  int usuarioID; 
  String tipoMembresia; 
  String antiguedad; 
  bool estatus; 

  // Constructor de la clase Miembro
  Miembro({
    required int ID,
    String? tituloCortesia,
    required String nombre,
    required String primerApellido,
    required String segundoApellido,
    required DateTime fechaNacimiento,
    String? fotografia,
    required String genero,
    required String tipoSangre,
    required this.membresiaID,
    required this.usuarioID,
    required this.tipoMembresia,
    this.estatus = true, // El miembro está activo por defecto
    DateTime? fechaRegistro,
    DateTime? fechaActualizacion,
  })  : antiguedad = "${DateTime.now().difference(fechaRegistro ?? DateTime.now()).inDays ~/ 30} meses", // Calcula la antigüedad en meses
        super(
          ID: ID,
          tituloCortesia: tituloCortesia,
          nombre: nombre,
          primerApellido: primerApellido,
          segundoApellido: segundoApellido,
          fechaNacimiento: fechaNacimiento,
          fotografia: fotografia,
          genero: genero,
          tipoSangre: tipoSangre,
          fechaRegistro: fechaRegistro,
          fechaActualizacion: fechaActualizacion,
        );

  // Método para leer los datos del miembro
  void leer() {
    print(this);
  }

  // Método para actualizar el tipo de membresía
  void actualizar(String nuevaMembresia) {
    tipoMembresia = nuevaMembresia;
    fechaActualizacion = DateTime.now(); // Actualiza la fecha de modificación
    print("Membresía actualizada a: $tipoMembresia");
  }

  // Método para eliminar un miembro (inactivarlo)
  void eliminar() {
    estatus = false; // Cambia el estado del miembro a inactivo
    fechaActualizacion = DateTime.now(); // Actualiza la fecha de modificación
    print("Miembro eliminado: $nombre $primerApellido.");
  }

  // Sobreescritura del método abstracto cancelaSuscripcion
  @override
  void cancelaSuscripcion() {
    estatus = false; // Cancela la suscripción cambiando el estatus
    fechaActualizacion = DateTime.now(); // Actualiza la fecha de modificación
    print("La suscripción ha sido cancelada para $nombre $primerApellido.");
  }

  // Sobreescritura del método toString para personalizar la impresión de los datos del miembro
  @override
  String toString() {
    final String formattedFechaNacimiento =
        "${fechaNacimiento.day.toString().padLeft(2, '0')}/" +
            "${fechaNacimiento.month.toString().padLeft(2, '0')}/${fechaNacimiento.year}";

    final String formattedFechaRegistro =
        "${fechaRegistro.day.toString().padLeft(2, '0')}/" +
            "${fechaRegistro.month.toString().padLeft(2, '0')}/${fechaRegistro.year} " +
            "${fechaRegistro.hour.toString().padLeft(2, '0')}:${fechaRegistro.minute.toString().padLeft(2, '0')}";

    return """
    --------------------------------------------------------
    DATOS DEL MIEMBRO
    --------------------------------------------------------
    ID: $ID
    Nombre: $nombre $primerApellido $segundoApellido
    Género: $genero
    Tipo de membresía: $tipoMembresia
    Fecha de nacimiento: $formattedFechaNacimiento
    Antigüedad: $antiguedad
    Fecha de registro: $formattedFechaRegistro
    Estatus: ${estatus ? 'Activo' : 'Inactivo'}
    --------------------------------------------------------
    """;
  }
}

/*
Resumen de las clases abstractas:

1. Las clases abstractas, como `Persona`, son clases que no se pueden instanciar directamente.
- Estas sirven como base para otras clases.
- Definen atributos y métodos comunes que deberán ser implementados o sobrescritos en las clases hijas.

2. Los métodos abstractos, como `cancelaSuscripcion`, son métodos que no tienen implementación en la clase abstracta.
- Las clases hijas deben sobrescribir estos métodos y proporcionar su implementación concreta.

3. En este código, la clase `Persona` es una clase abstracta que define los atributos básicos de una persona, como nombre, apellidos, género, etc., pero deja ciertos comportamientos, como cancelar suscripción, para que las clases hijas lo implementen.
   
4. La clase `Miembro` extiende de `Persona` y es responsable de implementar el comportamiento específico relacionado con los miembros del gimnasio, como cancelar suscripción, calcular antigüedad, actualizar la membresía, etc.

Las clases abstractas promueven la reutilización del código y ayudan a definir una estructura clara y flexible para las entidades dentro del sistema.
*/