import 'package:boilerplate/data/repository.dart';
import 'package:boilerplate/models/modelo/contenido.dart';
import 'package:mobx/mobx.dart';
part 'contenido_store.g.dart';

class ContenidoStore = _ContenidoStore with $ContenidoStore;

abstract class _ContenidoStore with Store {
  Repository _repository;

  _ContenidoStore(Repository repository) : this._repository = repository;

  static ObservableFuture<List<Contenido>> contenidoResponse =
      ObservableFuture.value(null);

  @observable
  bool success = false;

  @observable
  String errorMessage = '';

  @computed
  bool get loading => contenidoResponse.status == FutureStatus.pending;

  @observable
  List<Contenido> _contenidos;

  @computed
  List<Contenido> get contenidos {
    return _contenidos.toList();
  }

  @action
  void getContenidos() {
    final future = _repository.getContenidos();
    contenidoResponse = ObservableFuture(future);

    future.then((contenidos) {
      this._contenidos = contenidos.toList();
      errorMessage = '';
    }).catchError((error) {
      errorMessage = error.toString();
    });
  }
}
