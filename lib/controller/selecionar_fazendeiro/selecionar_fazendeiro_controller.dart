


import 'package:i_farm_net_new/model/fazendeiro_model.dart';
import 'package:mobx/mobx.dart';
part 'selecionar_fazendeiro_controller.g.dart';


class SelecionarFazendeiroController = _SelecionarFazendeiroControllerBase with _$SelecionarFazendeiroController;


abstract class _SelecionarFazendeiroControllerBase with Store{

  var fazendeiro = Fazendeiro();

  @observable
  String imagemFazendeiroSelecionado;
  @action
  mudaImagemFazendeiroSelecionado(String value) {
    imagemFazendeiroSelecionado = value;
    fazendeiro.nomeImagem = value;
  }

  @observable
  String nomeFazendeiro;
  @action
  mudaNomeFazendeiro(String value){
    nomeFazendeiro = value;
    fazendeiro.nome= value;
  }

  @observable
  int numeroFazendeiro=1;
  @action
  proximoNumeroFazendeiro(){
    if (numeroFazendeiro < 5){
      numeroFazendeiro++;
    }
    else {
      numeroFazendeiro = 1;
    }
    fazendeiro.nomeImagem = numeroFazendeiro.toString();
    fazendeiro.gerarListaAlimentoCultivavelInicial();

  }
  @action
  anteriorNumeroFazendeiro(){
    if (numeroFazendeiro > 1){
      numeroFazendeiro--;
    }
    else {
      numeroFazendeiro = 5;
    }
    fazendeiro.nomeImagem = numeroFazendeiro.toString();
    fazendeiro.gerarListaAlimentoCultivavelInicial();

  }

  @action
  validarNome(){
    if (nomeFazendeiro != null || nomeFazendeiro == "")
      return false;
    return true;
  }




}

