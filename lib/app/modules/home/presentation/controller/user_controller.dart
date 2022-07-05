import 'package:mobx/mobx.dart';

import '../../model/user_model.dart';
import '../../repositories/user_repository.dart';

part 'user_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final IUserRepository repository;

  _HomeController(this.repository);

  @observable
  String idade = '';

  @observable
  String nome = '';

  @observable
  ObservableStream<List<UserModel>>? userList;

  @action
  void getListUser() {
    userList = repository.getUsers().asObservable();
  }

  @action
  void setNome(value) {
    nome = value;
  }

  @action
  void setIdade(value) {
    idade = value;
  }
}
