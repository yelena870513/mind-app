class Ejercicio {
  int id;
  int ejercicio;
  int tema;
  String type;
  String header;
  String img;
  String tiempo;

  Ejercicio(
      {this.id, this.ejercicio, this.tema, this.type, this.header, this.img, this.tiempo});

  factory Ejercicio.fromJson(Map<String, dynamic> ejercicio) {
    return Ejercicio(
      id: ejercicio['id'],
      ejercicio: ejercicio['ejercicio'],
      tema: ejercicio['tema'],
      type: ejercicio['type'],
      header: ejercicio['header'],
      img: ejercicio['img'],
      tiempo: ejercicio['tiempo'],
    );
  }
}
