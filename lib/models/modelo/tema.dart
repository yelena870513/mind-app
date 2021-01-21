class Tema {
  int id;
  String titulo;
  String subtitulo;
  Tema({this.id, this.titulo, this.subtitulo});
  factory Tema.fromJson(Map<String, dynamic> tema) {
    return Tema(
      id: tema['id'],
      titulo: tema['titulo'],
      subtitulo: tema['subtitulo'],
    );
  }
}