// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$idadeAtom =
      Atom(name: '_HomeController.idade', context: context);

  @override
  String get idade {
    _$idadeAtom.reportRead();
    return super.idade;
  }

  @override
  set idade(String value) {
    _$idadeAtom.reportWrite(value, super.idade, () {
      super.idade = value;
    });
  }

  late final _$nomeAtom = Atom(name: '_HomeController.nome', context: context);

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$userListAtom =
      Atom(name: '_HomeController.userList', context: context);

  @override
  ObservableStream<List<UserModel>>? get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(ObservableStream<List<UserModel>>? value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  late final _$_HomeControllerActionController =
      ActionController(name: '_HomeController', context: context);

  @override
  void getListUser() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.getListUser');
    try {
      return super.getListUser();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(dynamic value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdade(dynamic value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setIdade');
    try {
      return super.setIdade(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idade: ${idade},
nome: ${nome},
userList: ${userList}
    ''';
  }
}
