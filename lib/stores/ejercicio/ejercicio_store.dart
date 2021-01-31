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

  @observable
  bool success = false;

  @observable
  Tema _selectedTema;

  @observable
  String errorMessage = '';

  @computed
  bool get loading => ejercicioResponse.status == FutureStatus.pending;

  @observable
  List<Ejercicio> _ejercicios = [];

  @computed
  List<Ejercicio> get ejercicios {
    return _ejercicios.toList();
  }

  @computed
  Tema get selectedTema {
    return _selectedTema;
  }

  @computed
  List<Ejercicio> get selectedEjercicios {
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

  @action
  void getEjercicios() {
    final future = _repository.getEjercicios();
    ejercicioResponse = ObservableFuture(future);

    future.then((ejercicios) {
      this._ejercicios = ejercicios.toList();
      errorMessage = '';
    }).catchError((error) {
      errorMessage = error.toString();
    });
  }

  @action
  void setSelectedTema(Tema tema) {
    _selectedTema = tema;
  }
}
