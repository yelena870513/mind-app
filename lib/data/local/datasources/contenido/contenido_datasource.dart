import 'dart:async';
import 'dart:convert';

import 'package:boilerplate/models/modelo/contenido.dart';
import 'package:flutter/services.dart';

class ContenidoDataSource {
   Map<String, dynamic> _contenidoData;

    Future<List<Contenido>> getContenidos() async {
    String jsonString =
    await rootBundle.loadString('assets/data/multimedia.content.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _contenidoData = jsonMap.map((key, value) {
      return MapEntry(
          key, value.toString().replaceAll(r"\'", "'").replaceAll(r"\t", " "));
    });

    List<dynamic> mappedData = _contenidoData['contenido'];
    List<Contenido> contenidos = mappedData.map((f) => Contenido.fromJson(f));
    return contenidos;
  }

}