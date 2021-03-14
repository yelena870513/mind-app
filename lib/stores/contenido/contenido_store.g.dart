// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contenido_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContenidoStore on _ContenidoStore, Store {
  Computed<bool> _$hidePlaceholderComputed;

  @override
  bool get hidePlaceholder => (_$hidePlaceholderComputed ??=
          Computed<bool>(() => super.hidePlaceholder))
      .value;
  Computed<bool> _$loadingContenidoComputed;

  @override
  bool get loadingContenido => (_$loadingContenidoComputed ??=
          Computed<bool>(() => super.loadingContenido))
      .value;
  Computed<bool> _$loadingTemaComputed;

  @override
  bool get loadingTema =>
      (_$loadingTemaComputed ??= Computed<bool>(() => super.loadingTema)).value;
  Computed<CategoryType> _$categoryTypeSelectedComputed;

  @override
  CategoryType get categoryTypeSelected => (_$categoryTypeSelectedComputed ??=
          Computed<CategoryType>(() => super.categoryTypeSelected))
      .value;
  Computed<List<Contenido>> _$contenidosComputed;

  @override
  List<Contenido> get contenidos => (_$contenidosComputed ??=
          Computed<List<Contenido>>(() => super.contenidos))
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
  Computed<List<Contenido>> _$selectedContenidosComputed;

  @override
  List<Contenido> get selectedContenidos => (_$selectedContenidosComputed ??=
          Computed<List<Contenido>>(() => super.selectedContenidos))
      .value;
  Computed<int> _$selectedContenidosCountComputed;

  @override
  int get selectedContenidosCount => (_$selectedContenidosCountComputed ??=
          Computed<int>(() => super.selectedContenidosCount))
      .value;
  Computed<int> _$contenidosCountComputed;

  @override
  int get contenidosCount =>
      (_$contenidosCountComputed ??= Computed<int>(() => super.contenidosCount))
          .value;
  Computed<String> _$searchTermComputed;

  @override
  String get searchTerm =>
      (_$searchTermComputed ??= Computed<String>(() => super.searchTerm)).value;
  Computed<int> _$idContenidoSeleccionadoComputed;

  @override
  int get idContenidoSeleccionado => (_$idContenidoSeleccionadoComputed ??=
          Computed<int>(() => super.idContenidoSeleccionado))
      .value;

  final _$successAtom = Atom(name: '_ContenidoStore.success');

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

  final _$_categoryTypeSelectedAtom =
      Atom(name: '_ContenidoStore._categoryTypeSelected');

  @override
  CategoryType get _categoryTypeSelected {
    _$_categoryTypeSelectedAtom.context
        .enforceReadPolicy(_$_categoryTypeSelectedAtom);
    _$_categoryTypeSelectedAtom.reportObserved();
    return super._categoryTypeSelected;
  }

  @override
  set _categoryTypeSelected(CategoryType value) {
    _$_categoryTypeSelectedAtom.context.conditionallyRunInAction(() {
      super._categoryTypeSelected = value;
      _$_categoryTypeSelectedAtom.reportChanged();
    }, _$_categoryTypeSelectedAtom,
        name: '${_$_categoryTypeSelectedAtom.name}_set');
  }

  final _$_selectedTemaAtom = Atom(name: '_ContenidoStore._selectedTema');

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

  final _$errorMessageAtom = Atom(name: '_ContenidoStore.errorMessage');

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

  final _$_contenidosAtom = Atom(name: '_ContenidoStore._contenidos');

  @override
  List<Contenido> get _contenidos {
    _$_contenidosAtom.context.enforceReadPolicy(_$_contenidosAtom);
    _$_contenidosAtom.reportObserved();
    return super._contenidos;
  }

  @override
  set _contenidos(List<Contenido> value) {
    _$_contenidosAtom.context.conditionallyRunInAction(() {
      super._contenidos = value;
      _$_contenidosAtom.reportChanged();
    }, _$_contenidosAtom, name: '${_$_contenidosAtom.name}_set');
  }

  final _$_temasAtom = Atom(name: '_ContenidoStore._temas');

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

  final _$_searchTermAtom = Atom(name: '_ContenidoStore._searchTerm');

  @override
  String get _searchTerm {
    _$_searchTermAtom.context.enforceReadPolicy(_$_searchTermAtom);
    _$_searchTermAtom.reportObserved();
    return super._searchTerm;
  }

  @override
  set _searchTerm(String value) {
    _$_searchTermAtom.context.conditionallyRunInAction(() {
      super._searchTerm = value;
      _$_searchTermAtom.reportChanged();
    }, _$_searchTermAtom, name: '${_$_searchTermAtom.name}_set');
  }

  final _$_hidePlaceholderAtom = Atom(name: '_ContenidoStore._hidePlaceholder');

  @override
  bool get _hidePlaceholder {
    _$_hidePlaceholderAtom.context.enforceReadPolicy(_$_hidePlaceholderAtom);
    _$_hidePlaceholderAtom.reportObserved();
    return super._hidePlaceholder;
  }

  @override
  set _hidePlaceholder(bool value) {
    _$_hidePlaceholderAtom.context.conditionallyRunInAction(() {
      super._hidePlaceholder = value;
      _$_hidePlaceholderAtom.reportChanged();
    }, _$_hidePlaceholderAtom, name: '${_$_hidePlaceholderAtom.name}_set');
  }

  final _$_idContenidoSeleccionadoAtom =
      Atom(name: '_ContenidoStore._idContenidoSeleccionado');

  @override
  int get _idContenidoSeleccionado {
    _$_idContenidoSeleccionadoAtom.context
        .enforceReadPolicy(_$_idContenidoSeleccionadoAtom);
    _$_idContenidoSeleccionadoAtom.reportObserved();
    return super._idContenidoSeleccionado;
  }

  @override
  set _idContenidoSeleccionado(int value) {
    _$_idContenidoSeleccionadoAtom.context.conditionallyRunInAction(() {
      super._idContenidoSeleccionado = value;
      _$_idContenidoSeleccionadoAtom.reportChanged();
    }, _$_idContenidoSeleccionadoAtom,
        name: '${_$_idContenidoSeleccionadoAtom.name}_set');
  }

  final _$_ContenidoStoreActionController =
      ActionController(name: '_ContenidoStore');

  @override
  Future<List<Contenido>> getContenidos() {
    final _$actionInfo = _$_ContenidoStoreActionController.startAction();
    try {
      return super.getContenidos();
    } finally {
      _$_ContenidoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hidenPlaceholder(bool value) {
    final _$actionInfo = _$_ContenidoStoreActionController.startAction();
    try {
      return super.hidenPlaceholder(value);
    } finally {
      _$_ContenidoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<Tema>> getTemas() {
    final _$actionInfo = _$_ContenidoStoreActionController.startAction();
    try {
      return super.getTemas();
    } finally {
      _$_ContenidoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategoryType(CategoryType categoryType) {
    final _$actionInfo = _$_ContenidoStoreActionController.startAction();
    try {
      return super.setCategoryType(categoryType);
    } finally {
      _$_ContenidoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedTema(Tema tema) {
    final _$actionInfo = _$_ContenidoStoreActionController.startAction();
    try {
      return super.setSelectedTema(tema);
    } finally {
      _$_ContenidoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchTerm(String term) {
    final _$actionInfo = _$_ContenidoStoreActionController.startAction();
    try {
      return super.setSearchTerm(term);
    } finally {
      _$_ContenidoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdContenidoSeleccionado(int term) {
    final _$actionInfo = _$_ContenidoStoreActionController.startAction();
    try {
      return super.setIdContenidoSeleccionado(term);
    } finally {
      _$_ContenidoStoreActionController.endAction(_$actionInfo);
    }
  }
}
