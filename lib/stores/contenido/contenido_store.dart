import 'package:boilerplate/constants/category_type.dart';
import 'package:boilerplate/data/repository.dart';
import 'package:boilerplate/models/modelo/contenido.dart';
import 'package:boilerplate/models/modelo/tema.dart';
import 'package:mobx/mobx.dart';

part 'contenido_store.g.dart';

class ContenidoStore = _ContenidoStore with _$ContenidoStore;

abstract class _ContenidoStore with Store {
  Repository _repository;

  _ContenidoStore(Repository repository) : this._repository = repository;

  static ObservableFuture<List<Contenido>> contenidoResponse =
      ObservableFuture.value(null);

  static ObservableFuture<List<Tema>> temaResponse =
      ObservableFuture.value(null);

  @observable
  bool success = false;

  @observable
  CategoryType _categoryTypeSelected = CategoryType.matutino;

  @observable
  Tema _selectedTema;

  @observable
  String errorMessage = '';

  @observable
  List<Contenido> _contenidos = [];

  @observable
  List<Tema> _temas = [];

  @observable
  String _searchTerm = '';

  @observable
  bool _hidePlaceholder = false;

  @computed
  bool get hidePlaceholder => _hidePlaceholder;

  @computed
  bool get loadingContenido => contenidoResponse.status == FutureStatus.pending;

  @computed
  bool get loadingTema => temaResponse.status == FutureStatus.pending;

  @computed
  CategoryType get categoryTypeSelected => _categoryTypeSelected;

  @computed
  List<Contenido> get contenidos {
    if (_searchTerm.length < 3) {
      return _contenidos.toList();
    } else {
      List<Contenido> searchResults = List<Contenido>();
      String cleanSearchValue = _searchTerm
          .toLowerCase()
          .replaceAll('á', 'a')
          .replaceAll('á', 'a')
          .replaceAll('í', 'i')
          .replaceAll('ó', 'o')
          .replaceAll('ú', 'u');

      _contenidos.forEach((Contenido c) {
        final RegExp exp =
        RegExp(r"<\/?[^>]+(>|$)", multiLine: true, caseSensitive: false);
        final String texto = c.texto
            .toLowerCase()
            .replaceAll(exp, '')
            .replaceAll(RegExp(r'&aacute;'), 'a')
            .replaceAll(RegExp(r'&eacute;'), 'e')
            .replaceAll(RegExp(r'&iacute;'), 'i')
            .replaceAll(RegExp(r'&oacute;'), 'o')
            .replaceAll(RegExp(r'&uacute;'), 'u')
            .replaceAll(RegExp(r'&ntilde;'), 'ñ')
            .replaceAll('á', 'a')
            .replaceAll('á', 'a')
            .replaceAll('í', 'i')
            .replaceAll('ó', 'o')
            .replaceAll('ú', 'u');


        if (texto.contains(cleanSearchValue)) {
          if (!searchResults.contains(c)) {
            searchResults.add(c);
          }
        }
      });
      return searchResults;
    }
  }

  @computed
  List<Tema> get temas {
    return _temas.toList();
  }

  @computed
  Tema get selectedTema {
    return _selectedTema;
  }

  @computed
  List<Contenido> get selectedContenidos {
    return _contenidos.where((Contenido c) {
      return c.tema.id == selectedTema.id;
    }).toList();
  }

  @computed
  int get selectedContenidosCount {
    return _contenidos
        .where((Contenido c) {
          return c.tema.id == selectedTema.id;
        })
        .toList()
        .length;
  }

  @computed
  int get contenidosCount {
    return contenidos.length;
  }

  @computed
  String get searchTerm {
    return _searchTerm;
  }

  @action
  Future<List<Contenido>> getContenidos() {
    final future = _repository.getContenidos();
    contenidoResponse = ObservableFuture(future);

    return future.then((contenidos) {
      this._contenidos = contenidos.toList();
      errorMessage = '';
    }).catchError((error) {
      errorMessage = error.toString();
    });
  }

  @action
  void hidenPlaceholder(bool value){
    _hidePlaceholder = value;
  }

  @action
  Future<List<Tema>> getTemas() {
    final future = _repository.getContenidoTemas();
    temaResponse = ObservableFuture(future);

    return future.then((temas) {
      this._temas = temas.toList();
      if (selectedTema == null) {
        setSelectedTema(this._temas[0]);
      }
      errorMessage = '';
    }).catchError((error) {
      errorMessage = error.toString();
    });
  }

  @action
  void setCategoryType(CategoryType categoryType) {
    _categoryTypeSelected = categoryType;
  }

  @action
  void setSelectedTema(Tema tema) {
    _selectedTema = tema;
  }

  @action
  void setSearchTerm(String term) {
    _searchTerm = term;
  }
}
