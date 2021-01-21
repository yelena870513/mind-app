import 'package:boilerplate/data/repository.dart';
import 'package:boilerplate/models/modelo/ejercicio.dart';
import 'package:mobx/mobx.dart';
part 'ejercicio_store.g.dart';

class EjercicioStore = _EjercicioStore with $EjercicioStore;

abstract class _EjercicioStore with Store {
  Repository _repository;

  _EjercicioStore(Repository repository) : this._repository = repository;

  static ObservableFuture<List<Ejercicio>> ejercicioResponse =
      ObservableFuture.value(null);

  @observable
  bool success = false;

  @observable
  String errorMessage = '';

  @computed
  bool get loading => ejercicioResponse.status == FutureStatus.pending;

  @observable
  List<Ejercicio> _ejercicios;

  @computed
  List<Ejercicio> get ejercicios {
    return _ejercicios.toList();
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
}
