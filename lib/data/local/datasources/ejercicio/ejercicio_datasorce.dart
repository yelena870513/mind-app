import 'dart:async';
import 'dart:convert';

import 'package:boilerplate/models/modelo/ejercicio.dart';
import 'package:flutter/services.dart';

class EjercicioDataSource {
  Map<String, dynamic> _ejercicioData;

    Future<List<Ejercicio>> getEjercicios() async {
    String jsonString =
    await rootBundle.loadString('assets/data/ejercicios.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _ejercicioData = jsonMap.map((key, value) {
      return MapEntry(
          key, value.toString().replaceAll(r"\'", "'").replaceAll(r"\t", " "));
    });

    List<dynamic> mappedData = _ejercicioData['docs'];
    List<Ejercicio> ejercicios = mappedData.map((f) => Ejercicio.fromJson(f));
    return ejercicios;
  }
}