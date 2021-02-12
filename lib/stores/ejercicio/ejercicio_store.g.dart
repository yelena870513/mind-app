// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ejercicio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EjercicioStore on _EjercicioStore, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading =>
      (_$loadingComputed ??= Computed<bool>(() => super.loading)).value;
  Computed<bool> _$loadingTemaComputed;

  @override
  bool get loadingTema =>
      (_$loadingTemaComputed ??= Computed<bool>(() => super.loadingTema)).value;
  Computed<List<Ejercicio>> _$ejerciciosComputed;

  @override
  List<Ejercicio> get ejercicios => (_$ejerciciosComputed ??=
          Computed<List<Ejercicio>>(() => super.ejercicios))
      .value;
  Computed<List<Tema>> _$temasComputed;

  @override
  List<Tema> get temas =>
      (_$temasComputed ??= Computed<List<Tema>>(() => super.temas)).value;
  Computed<Tema> _$selectedTemaComputed;

  @override
  Tema get selectedTema =>
      (_$selectedTemaComputed ??= Computed<Tema>(() => super.selectedTema))
          .value;
  Computed<Ejercicio> _$selectedEjercicioComputed;

  @override
  Ejercicio get selectedEjercicio => (_$selectedEjercicioComputed ??=
          Computed<Ejercicio>(() => super.selectedEjercicio))
      .value;
  Computed<List<Ejercicio>> _$selectedEjerciciosComputed;

  @override
  List<Ejercicio> get selectedEjercicios => (_$selectedEjerciciosComputed ??=
          Computed<List<Ejercicio>>(() => super.selectedEjercicios))
      .value;
  Computed<int> _$selectedEjerciciosCountComputed;

  @override
  int get selectedEjerciciosCount => (_$selectedEjerciciosCountComputed ??=
          Computed<int>(() => super.selectedEjerciciosCount))
      .value;
  Computed<int> _$ejercicioCountComputed;

  @override
  int get ejercicioCount =>
      (_$ejercicioCountComputed ??= Computed<int>(() => super.ejercicioCount))
          .value;

  final _$successAtom = Atom(name: '_EjercicioStore.success');

  @override
  bool get success {
    _$successAtom.context.enforceReadPolicy(_$successAtom);
    _$successAtom.reportObserved();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.context.conditionallyRunInAction(() {
      super.success = value;
      _$successAtom.reportChanged();
    }, _$successAtom, name: '${_$successAtom.name}_set');
  }

  final _$_selectedTemaAtom = Atom(name: '_EjercicioStore._selectedTema');

  @override
  Tema get _selectedTema {
    _$_selectedTemaAtom.context.enforceReadPolicy(_$_selectedTemaAtom);
    _$_selectedTemaAtom.reportObserved();
    return super._selectedTema;
  }

  @override
  set _selectedTema(Tema value) {
    _$_selectedTemaAtom.context.conditionallyRunInAction(() {
      super._selectedTema = value;
      _$_selectedTemaAtom.reportChanged();
    }, _$_selectedTemaAtom, name: '${_$_selectedTemaAtom.name}_set');
  }

  final _$_selectedEjercicioAtom =
      Atom(name: '_EjercicioStore._selectedEjercicio');

  @override
  Ejercicio get _selectedEjercicio {
    _$_selectedEjercicioAtom.context
        .enforceReadPolicy(_$_selectedEjercicioAtom);
    _$_selectedEjercicioAtom.reportObserved();
    return super._selectedEjercicio;
  }

  @override
  set _selectedEjercicio(Ejercicio value) {
    _$_selectedEjercicioAtom.context.conditionallyRunInAction(() {
      super._selectedEjercicio = value;
      _$_selectedEjercicioAtom.reportChanged();
    }, _$_selectedEjercicioAtom, name: '${_$_selectedEjercicioAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_EjercicioStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$_ejerciciosAtom = Atom(name: '_EjercicioStore._ejercicios');

  @override
  List<Ejercicio> get _ejercicios {
    _$_ejerciciosAtom.context.enforceReadPolicy(_$_ejerciciosAtom);
    _$_ejerciciosAtom.reportObserved();
    return super._ejercicios;
  }

  @override
  set _ejercicios(List<Ejercicio> value) {
    _$_ejerciciosAtom.context.conditionallyRunInAction(() {
      super._ejercicios = value;
      _$_ejerciciosAtom.reportChanged();
    }, _$_ejerciciosAtom, name: '${_$_ejerciciosAtom.name}_set');
  }

  final _$_temasAtom = Atom(name: '_EjercicioStore._temas');

  @override
  List<Tema> get _temas {
    _$_temasAtom.context.enforceReadPolicy(_$_temasAtom);
    _$_temasAtom.reportObserved();
    return super._temas;
  }

  @override
  set _temas(List<Tema> value) {
    _$_temasAtom.context.conditionallyRunInAction(() {
      super._temas = value;
      _$_temasAtom.reportChanged();
    }, _$_temasAtom, name: '${_$_temasAtom.name}_set');
  }

  final _$_EjercicioStoreActionController =
      ActionController(name: '_EjercicioStore');

  @override
  Future<List<Ejercicio>> getEjercicios() {
    final _$actionInfo = _$_EjercicioStoreActionController.startAction();
    try {
      return super.getEjercicios();
    } finally {
      _$_EjercicioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<Tema>> getTemas() {
    final _$actionInfo = _$_EjercicioStoreActionController.startAction();
    try {
      return super.getTemas();
    } finally {
      _$_EjercicioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedTema(Tema tema) {
    final _$actionInfo = _$_EjercicioStoreActionController.startAction();
    try {
      return super.setSelectedTema(tema);
    } finally {
      _$_EjercicioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedEjercicio(Ejercicio ejercicio) {
    final _$actionInfo = _$_EjercicioStoreActionController.startAction();
    try {
      return super.setSelectedEjercicio(ejercicio);
    } finally {
      _$_EjercicioStoreActionController.endAction(_$actionInfo);
    }
  }
}
