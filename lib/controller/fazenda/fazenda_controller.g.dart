// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fazenda_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FazendaController on _FazendaControllerBase, Store {
  Computed<String> _$noticiasComputed;

  @override
  String get noticias =>
      (_$noticiasComputed ??= Computed<String>(() => super.noticias)).value;

  final _$NomeCultivoAtom = Atom(name: '_FazendaControllerBase.NomeCultivo');

  @override
  String get NomeCultivo {
    _$NomeCultivoAtom.context.enforceReadPolicy(_$NomeCultivoAtom);
    _$NomeCultivoAtom.reportObserved();
    return super.NomeCultivo;
  }

  @override
  set NomeCultivo(String value) {
    _$NomeCultivoAtom.context.conditionallyRunInAction(() {
      super.NomeCultivo = value;
      _$NomeCultivoAtom.reportChanged();
    }, _$NomeCultivoAtom, name: '${_$NomeCultivoAtom.name}_set');
  }

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

  final _$mensagensNoticiasMissoesAtom =
      Atom(name: '_FazendaControllerBase.mensagensNoticiasMissoes');

  @override
  String get mensagensNoticiasMissoes {
    _$mensagensNoticiasMissoesAtom.context
        .enforceReadPolicy(_$mensagensNoticiasMissoesAtom);
    _$mensagensNoticiasMissoesAtom.reportObserved();
    return super.mensagensNoticiasMissoes;
  }

  @override
  set mensagensNoticiasMissoes(String value) {
    _$mensagensNoticiasMissoesAtom.context.conditionallyRunInAction(() {
      super.mensagensNoticiasMissoes = value;
      _$mensagensNoticiasMissoesAtom.reportChanged();
    }, _$mensagensNoticiasMissoesAtom,
        name: '${_$mensagensNoticiasMissoesAtom.name}_set');
  }

  final _$mensagemExtraAtom =
      Atom(name: '_FazendaControllerBase.mensagemExtra');

  @override
  String get mensagemExtra {
    _$mensagemExtraAtom.context.enforceReadPolicy(_$mensagemExtraAtom);
    _$mensagemExtraAtom.reportObserved();
    return super.mensagemExtra;
  }

  @override
  set mensagemExtra(String value) {
    _$mensagemExtraAtom.context.conditionallyRunInAction(() {
      super.mensagemExtra = value;
      _$mensagemExtraAtom.reportChanged();
    }, _$mensagemExtraAtom, name: '${_$mensagemExtraAtom.name}_set');
  }

  final _$fazendeiroAtom = Atom(name: '_FazendaControllerBase.fazendeiro');

  @override
  Fazendeiro get fazendeiro {
    _$fazendeiroAtom.context.enforceReadPolicy(_$fazendeiroAtom);
    _$fazendeiroAtom.reportObserved();
    return super.fazendeiro;
  }

  @override
  set fazendeiro(Fazendeiro value) {
    _$fazendeiroAtom.context.conditionallyRunInAction(() {
      super.fazendeiro = value;
      _$fazendeiroAtom.reportChanged();
    }, _$fazendeiroAtom, name: '${_$fazendeiroAtom.name}_set');
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
  dynamic gerarMensagensMissoes() {
    final _$actionInfo = _$_FazendaControllerBaseActionController.startAction();
    try {
      return super.gerarMensagensMissoes();
    } finally {
      _$_FazendaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checarMissao(String acaoRealizada) {
    final _$actionInfo = _$_FazendaControllerBaseActionController.startAction();
    try {
      return super.checarMissao(acaoRealizada);
    } finally {
      _$_FazendaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void produzirAdubo() {
    final _$actionInfo = _$_FazendaControllerBaseActionController.startAction();
    try {
      return super.produzirAdubo();
    } finally {
      _$_FazendaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void utilizarAdubo() {
    final _$actionInfo = _$_FazendaControllerBaseActionController.startAction();
    try {
      return super.utilizarAdubo();
    } finally {
      _$_FazendaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void coletarLeite() {
    final _$actionInfo = _$_FazendaControllerBaseActionController.startAction();
    try {
      return super.coletarLeite();
    } finally {
      _$_FazendaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void comer(String nome) {
    final _$actionInfo = _$_FazendaControllerBaseActionController.startAction();
    try {
      return super.comer(nome);
    } finally {
      _$_FazendaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionarItem(String nomeCultivo) {
    final _$actionInfo = _$_FazendaControllerBaseActionController.startAction();
    try {
      return super.adicionarItem(nomeCultivo);
    } finally {
      _$_FazendaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void retirarItem(String nomeCultivo) {
    final _$actionInfo = _$_FazendaControllerBaseActionController.startAction();
    try {
      return super.retirarItem(nomeCultivo);
    } finally {
      _$_FazendaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionarValorItemSaude(String item, int valorAserAdicionado) {
    final _$actionInfo = _$_FazendaControllerBaseActionController.startAction();
    try {
      return super.adicionarValorItemSaude(item, valorAserAdicionado);
    } finally {
      _$_FazendaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionarAgua() {
    final _$actionInfo = _$_FazendaControllerBaseActionController.startAction();
    try {
      return super.adicionarAgua();
    } finally {
      _$_FazendaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'NomeCultivo: ${NomeCultivo.toString()},terreno: ${terreno.toString()},estadoAtual: ${estadoAtual.toString()},mensagensNoticiasMissoes: ${mensagensNoticiasMissoes.toString()},mensagemExtra: ${mensagemExtra.toString()},fazendeiro: ${fazendeiro.toString()},noticias: ${noticias.toString()}';
    return '{$string}';
  }
}
