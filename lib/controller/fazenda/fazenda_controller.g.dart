// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fazenda_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FazendaController on _FazendaControllerBase, Store {
  final _$terrenoAtom = Atom(name: '_FazendaControllerBase.terreno');

  @override
  Terreno get terreno {
    _$terrenoAtom.context.enforceReadPolicy(_$terrenoAtom);
    _$terrenoAtom.reportObserved();
    return super.terreno;
  }

  @override
  set terreno(Terreno value) {
    _$terrenoAtom.context.conditionallyRunInAction(() {
      super.terreno = value;
      _$terrenoAtom.reportChanged();
    }, _$terrenoAtom, name: '${_$terrenoAtom.name}_set');
  }

  final _$estadoAtualAtom = Atom(name: '_FazendaControllerBase.estadoAtual');

  @override
  String get estadoAtual {
    _$estadoAtualAtom.context.enforceReadPolicy(_$estadoAtualAtom);
    _$estadoAtualAtom.reportObserved();
    return super.estadoAtual;
  }

  @override
  set estadoAtual(String value) {
    _$estadoAtualAtom.context.conditionallyRunInAction(() {
      super.estadoAtual = value;
      _$estadoAtualAtom.reportChanged();
    }, _$estadoAtualAtom, name: '${_$estadoAtualAtom.name}_set');
  }

  final _$_FazendaControllerBaseActionController =
      ActionController(name: '_FazendaControllerBase');

  @override
  dynamic evoluirTerreno() {
    final _$actionInfo = _$_FazendaControllerBaseActionController.startAction();
    try {
      return super.evoluirTerreno();
    } finally {
      _$_FazendaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic matarTerreno() {
    final _$actionInfo = _$_FazendaControllerBaseActionController.startAction();
    try {
      return super.matarTerreno();
    } finally {
      _$_FazendaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'terreno: ${terreno.toString()},estadoAtual: ${estadoAtual.toString()}';
    return '{$string}';
  }
}
