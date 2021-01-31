import 'dart:async';
import 'dart:convert';

import 'package:boilerplate/models/modelo/contenido.dart';
import 'package:boilerplate/models/modelo/tema.dart';
import 'package:flutter/services.dart';

class ContenidoDataSource {
  Map<String, dynamic> _contenidoData;

  Future<List<Contenido>> getContenidos() async {
    if (_contenidoData == null) {
      String jsonString =
      await rootBundle.loadString('assets/data/multimedia.content.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);

      _contenidoData = jsonMap;
    }

    List<dynamic> mappedData = _contenidoData['contenido'];
    List<Contenido> contenidos =
        mappedData.map((f) => Contenido.fromJson(f)).toList();
    return contenidos;
  }

  Future<List<Tema>> getTemas() async {
   if (_contenidoData == null) {
     String jsonString =
     await rootBundle.loadString('assets/data/multimedia.content.json');
     Map<String, dynamic> jsonMap = json.decode(jsonString);

     _contenidoData = jsonMap;
   }

    List<dynamic> mappedData = _contenidoData['tema'];
    List<Tema> temas = mappedData.map((f) => Tema.fromJson(f)).toList();
    return temas;
  }
}
