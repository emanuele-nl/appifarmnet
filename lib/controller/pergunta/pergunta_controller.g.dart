// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pergunta_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerguntaController on _PerguntaControllerBase, Store {
  final _$resultadoPerguntaAtom =
      Atom(name: '_PerguntaControllerBase.resultadoPergunta');

  @override
  String get resultadoPergunta {
    _$resultadoPerguntaAtom.context.enforceReadPolicy(_$resultadoPerguntaAtom);
    _$resultadoPerguntaAtom.reportObserved();
    return super.resultadoPergunta;
  }

  @override
  set resultadoPergunta(String value) {
    _$resultadoPerguntaAtom.context.conditionallyRunInAction(() {
      super.resultadoPergunta = value;
      _$resultadoPerguntaAtom.reportChanged();
    }, _$resultadoPerguntaAtom, name: '${_$resultadoPerguntaAtom.name}_set');
  }

  final _$respostaSelecionadaAtom =
      Atom(name: '_PerguntaControllerBase.respostaSelecionada');

  @override
  String get respostaSelecionada {
    _$respostaSelecionadaAtom.context
        .enforceReadPolicy(_$respostaSelecionadaAtom);
    _$respostaSelecionadaAtom.reportObserved();
    return super.respostaSelecionada;
  }

  @override
  set respostaSelecionada(String value) {
    _$respostaSelecionadaAtom.context.conditionallyRunInAction(() {
      super.respostaSelecionada = value;
      _$respostaSelecionadaAtom.reportChanged();
    }, _$respostaSelecionadaAtom,
        name: '${_$respostaSelecionadaAtom.name}_set');
  }

  final _$_PerguntaControllerBaseActionController =
      ActionController(name: '_PerguntaControllerBase');

  @override
  dynamic verificarResposta(String respostaEsperada) {
    final _$actionInfo =
        _$_PerguntaControllerBaseActionController.startAction();
    try {
      return super.verificarResposta(respostaEsperada);
    } finally {
      _$_PerguntaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'resultadoPergunta: ${resultadoPergunta.toString()},respostaSelecionada: ${respostaSelecionada.toString()}';
    return '{$string}';
  }
}
