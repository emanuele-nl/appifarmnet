// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selecionar_fazendeiro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelecionarFazendeiroController
    on _SelecionarFazendeiroControllerBase, Store {
  final _$imagemFazendeiroSelecionadoAtom = Atom(
      name: '_SelecionarFazendeiroControllerBase.imagemFazendeiroSelecionado');

  @override
  String get imagemFazendeiroSelecionado {
    _$imagemFazendeiroSelecionadoAtom.context
        .enforceReadPolicy(_$imagemFazendeiroSelecionadoAtom);
    _$imagemFazendeiroSelecionadoAtom.reportObserved();
    return super.imagemFazendeiroSelecionado;
  }

  @override
  set imagemFazendeiroSelecionado(String value) {
    _$imagemFazendeiroSelecionadoAtom.context.conditionallyRunInAction(() {
      super.imagemFazendeiroSelecionado = value;
      _$imagemFazendeiroSelecionadoAtom.reportChanged();
    }, _$imagemFazendeiroSelecionadoAtom,
        name: '${_$imagemFazendeiroSelecionadoAtom.name}_set');
  }

  final _$nomePreenchidoAtom =
      Atom(name: '_SelecionarFazendeiroControllerBase.nomePreenchido');

  @override
  bool get nomePreenchido {
    _$nomePreenchidoAtom.context.enforceReadPolicy(_$nomePreenchidoAtom);
    _$nomePreenchidoAtom.reportObserved();
    return super.nomePreenchido;
  }

  @override
  set nomePreenchido(bool value) {
    _$nomePreenchidoAtom.context.conditionallyRunInAction(() {
      super.nomePreenchido = value;
      _$nomePreenchidoAtom.reportChanged();
    }, _$nomePreenchidoAtom, name: '${_$nomePreenchidoAtom.name}_set');
  }

  final _$nomeFazendeiroAtom =
      Atom(name: '_SelecionarFazendeiroControllerBase.nomeFazendeiro');

  @override
  String get nomeFazendeiro {
    _$nomeFazendeiroAtom.context.enforceReadPolicy(_$nomeFazendeiroAtom);
    _$nomeFazendeiroAtom.reportObserved();
    return super.nomeFazendeiro;
  }

  @override
  set nomeFazendeiro(String value) {
    _$nomeFazendeiroAtom.context.conditionallyRunInAction(() {
      super.nomeFazendeiro = value;
      _$nomeFazendeiroAtom.reportChanged();
    }, _$nomeFazendeiroAtom, name: '${_$nomeFazendeiroAtom.name}_set');
  }

  final _$numeroFazendeiroAtom =
      Atom(name: '_SelecionarFazendeiroControllerBase.numeroFazendeiro');

  @override
  int get numeroFazendeiro {
    _$numeroFazendeiroAtom.context.enforceReadPolicy(_$numeroFazendeiroAtom);
    _$numeroFazendeiroAtom.reportObserved();
    return super.numeroFazendeiro;
  }

  @override
  set numeroFazendeiro(int value) {
    _$numeroFazendeiroAtom.context.conditionallyRunInAction(() {
      super.numeroFazendeiro = value;
      _$numeroFazendeiroAtom.reportChanged();
    }, _$numeroFazendeiroAtom, name: '${_$numeroFazendeiroAtom.name}_set');
  }

  final _$_SelecionarFazendeiroControllerBaseActionController =
      ActionController(name: '_SelecionarFazendeiroControllerBase');

  @override
  dynamic mudaImagemFazendeiroSelecionado(String value) {
    final _$actionInfo =
        _$_SelecionarFazendeiroControllerBaseActionController.startAction();
    try {
      return super.mudaImagemFazendeiroSelecionado(value);
    } finally {
      _$_SelecionarFazendeiroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic mudaNomeFazendeiro(String value) {
    final _$actionInfo =
        _$_SelecionarFazendeiroControllerBaseActionController.startAction();
    try {
      return super.mudaNomeFazendeiro(value);
    } finally {
      _$_SelecionarFazendeiroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic proximoNumeroFazendeiro() {
    final _$actionInfo =
        _$_SelecionarFazendeiroControllerBaseActionController.startAction();
    try {
      return super.proximoNumeroFazendeiro();
    } finally {
      _$_SelecionarFazendeiroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic anteriorNumeroFazendeiro() {
    final _$actionInfo =
        _$_SelecionarFazendeiroControllerBaseActionController.startAction();
    try {
      return super.anteriorNumeroFazendeiro();
    } finally {
      _$_SelecionarFazendeiroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic validarNome() {
    final _$actionInfo =
        _$_SelecionarFazendeiroControllerBaseActionController.startAction();
    try {
      return super.validarNome();
    } finally {
      _$_SelecionarFazendeiroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'imagemFazendeiroSelecionado: ${imagemFazendeiroSelecionado.toString()},nomePreenchido: ${nomePreenchido.toString()},nomeFazendeiro: ${nomeFazendeiro.toString()},numeroFazendeiro: ${numeroFazendeiro.toString()}';
    return '{$string}';
  }
}
