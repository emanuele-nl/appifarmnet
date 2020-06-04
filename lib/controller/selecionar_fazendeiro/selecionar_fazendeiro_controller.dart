


import 'package:i_farm_net_new/model/fazendeiro_model.dart';
import 'package:mobx/mobx.dart';
part 'selecionar_fazendeiro_controller.g.dart';


class SelecionarFazendeiroController = _SelecionarFazendeiroControllerBase with _$SelecionarFazendeiroController;


abstract class _SelecionarFazendeiroControllerBase with Store{

  var fazendeiro = Fazendeiro();

  @observable
  String imagemFazendeiroSelecionado = "1";

  @observable
  bool nomePreenchido= false;

  @observable
  String descricaoPersonagem="";

  @observable
  String nomeFazendeiro="";

  @observable
  int numeroFazendeiro=1;



  @action
  carregarDados(){
    imagemFazendeiroSelecionado = fazendeiro.nomeImagem;
    descricaoPersonagem = fazendeiro.descricaoPersongem;
    mudaNomeFazendeiro(fazendeiro.nome);
    numeroFazendeiro = int.parse(fazendeiro.nomeImagem);
  }

  @action
  mudaImagemFazendeiroSelecionado(String value) {
    imagemFazendeiroSelecionado = value;
    fazendeiro.nomeImagem = value;
    //fazendeiro.gerarListaAlimentoCultivavelInicial();
  }



  @action
  mudaNomeFazendeiro(String value){
    nomeFazendeiro = value;
    fazendeiro.nome= value;
    if (nomeFazendeiro.length>0)
      nomePreenchido=true;
    else
      nomePreenchido=false;
  }


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
    descricaoPersonagem = fazendeiro.descricaoPersongem;


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
    descricaoPersonagem = fazendeiro.descricaoPersongem;

  }

  @action
  validarNome(){
    if (nomeFazendeiro != null || nomeFazendeiro == "")
      return false;
    return true;
  }




}

