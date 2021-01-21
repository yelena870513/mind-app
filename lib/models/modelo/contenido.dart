import 'package:boilerplate/models/modelo/tema.dart';

class Contenido {
  int id;
  int orden;
  String titulo;
  String texto;
  Tema tema;

  Contenido({this.id, this.orden, this.titulo, this.texto, this.tema});

  factory Contenido.fromJson(Map<String, dynamic> contenido) {
    return Contenido(
      id: contenido['id'],
      orden: contenido['orden'],
      titulo: contenido['titulo'],
      texto: contenido['texto'],
      tema: Tema.fromJson(contenido['tema']),
    );
  }
}
