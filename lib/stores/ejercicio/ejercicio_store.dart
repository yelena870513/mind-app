import 'package:boilerplate/data/repository.dart';
import 'package:boilerplate/models/modelo/ejercicio.dart';
import 'package:boilerplate/models/modelo/tema.dart';
import 'package:mobx/mobx.dart';

part 'ejercicio_store.g.dart';

class EjercicioStore = _EjercicioStore with _$EjercicioStore;

abstract class _EjercicioStore with Store {
  Repository _repository;

  _EjercicioStore(Repository repository) : this._repository = repository;

  static ObservableFuture<List<Ejercicio>> ejercicioResponse =
      ObservableFuture.value(null);

  static ObservableFuture<List<Tema>> temaResponse =
      ObservableFuture.value(null);

  @observable
  bool success = false;

  @observable
  Tema _selectedTema;

  @observable
  Ejercicio _selectedEjercicio;

  @observable
  String errorMessage = '';

  @observable
  List<Ejercicio> _ejercicios = [];

  @observable
  List<Tema> _temas = [];

  @computed
  bool get loading => ejercicioResponse.status == FutureStatus.pending;

  @computed
  bool get loadingTema => temaResponse.status == FutureStatus.pending;

  @computed
  List<Ejercicio> get ejercicios {
    return _ejercicios.toList();
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
  Ejercicio get selectedEjercicio {
    return _selectedEjercicio;
  }

  @computed
  List<Ejercicio> get selectedEjercicios {
    // ignore: unrelated_type_equality_checks
    if (selectedTema != false && selectedTema != null) {
      return _ejercicios.where((Ejercicio c) {
        return c.tema == selectedTema.id;
      }).toList();
    } else {
      return _ejercicios.toList();
    }
  }

  @computed
  int get selectedEjerciciosCount {
    // ignore: unrelated_type_equality_checks
    if (selectedTema != false && selectedTema != null) {
      return _ejercicios
          .where((Ejercicio c) {
            return c.tema == (selectedTema != null ? selectedTema.id : 2);
          })
          .toList()
          .length;
    } else {
      return _ejercicios.length;
    }
  }

  @computed
  int get ejercicioCount {
    return _ejercicios.length;
  }

  @action
  Future<List<Ejercicio>> getEjercicios() {
    final future = _repository.getEjercicios();
    ejercicioResponse = ObservableFuture(future);

    return future.then((ejercicios) {
      this._ejercicios = ejercicios.toList();
      errorMessage = '';
    }).catchError((error) {
      errorMessage = error.toString();
    });
  }

  @action
  Future<List<Tema>> getTemas() {
    final future = _repository.getEjercicioTemas();
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
  void setSelectedTema(Tema tema) {
    _selectedTema = tema;
  }

  @action
  void setSelectedEjercicio(Ejercicio ejercicio) {
    _selectedEjercicio = ejercicio;
  }
}
