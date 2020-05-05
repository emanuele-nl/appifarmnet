import 'package:i_farm_net_new/model/fazendeiro_model.dart';
import 'package:i_farm_net_new/model/missoes_model.dart';
import 'package:i_farm_net_new/model/terreno_model.dart';
import 'package:mobx/mobx.dart';
part 'fazenda_controller.g.dart';


class FazendaController = _FazendaControllerBase with _$FazendaController;


abstract class _FazendaControllerBase with Store{


  @observable
  String NomeCultivo;

  @observable
  Terreno terreno = Terreno();

  @observable
  String estadoAtual="vazio";

  @observable
  String mensagensNoticiasMissoes = "Faça missões e ganhe experiência! | ";

  @observable
  String mensagemExtra = "Você está em um ambiente de econômia solidária |";


  @observable
  Fazendeiro fazendeiro = Fazendeiro();

  @action
  setMensagemMissao(String value) => mensagensNoticiasMissoes = value;

  @action
  evoluirTerreno() {
    if (terreno.valorEstadoAtual<3)
      terreno.valorEstadoAtual++;
    else
      terreno.valorEstadoAtual=0;

    terreno.estadoAtual = terreno.estadosTerreno[terreno.valorEstadoAtual];
    estadoAtual = terreno.estadoAtual;
  }

  @action
  matarTerreno(){
    terreno.valorEstadoAtual=4;
    terreno.estadoAtual = terreno.estadosTerreno[terreno.valorEstadoAtual];
    estadoAtual = terreno.estadoAtual;

  }

  @computed
  String get noticias => "$mensagensNoticiasMissoes $mensagemExtra";



  @action
  gerarMensagensMissoes(){
    if (fazendeiro.avisoNovaMissao){
      setMensagemMissao("Missao concluída! pegue uma nova missão | ");
    }
    else
      setMensagemMissao("Realize sua missão e ganhe experiência | ");

  }

  @action
  bool checarMissao (String acaoRealizada){


    if ((acaoRealizada == fazendeiro.missaAtual) &  (!fazendeiro.missaoConcluida)){
      setMensagemMissao("Missao concluída! Pegue uma nova missão! |");
      fazendeiro.missaoConcluida = true;
      fazendeiro.avisoNovaMissao = true;
      return true;
    }
    return false;
    gerarMensagensMissoes();
  }

  @action
  void produzirAdubo(){
    fazendeiro.adubo++;
    //checarMissao(Missoes.gerarAdubo);
  }

  @action
  void utilizarAdubo (){
    if (fazendeiro.adubo>0)
      fazendeiro.adubo--;
  }

  @action
  void coletarLeite(){
    fazendeiro.leite++;
    //checarMissao(Missoes.coletarLeite);

  }

  @action
  void comer(String nome){
    retirarItem(nome);
  }

  @action
  void adicionarItem(String nomeCultivo){
    int i=0;
    int posicaoSelecionada;
    for (String cultivo in fazendeiro.nomeProdutos){
      if (cultivo == nomeCultivo)
        posicaoSelecionada=i;
      i++;
    }
    fazendeiro.quantidadeProdutos[posicaoSelecionada]++;
  }

  @action
  void retirarItem(String nomeCultivo){
    int i=0;
    int posicaoSelecionada;
    for (String cultivo in fazendeiro.nomeProdutos){
      if (cultivo == nomeCultivo)
        posicaoSelecionada=i;
      i++;
    }
    fazendeiro.quantidadeProdutos[posicaoSelecionada]--;
  }

  @action
  void adicionarValorItemSaude(String item, int valorAserAdicionado){
    if (item == "fome"){
      fazendeiro.fome=fazendeiro.fome + valorAserAdicionado;
      if (fazendeiro.fome > 100)
        fazendeiro.fome = 100;
      if (fazendeiro.fome<=0)
        fazendeiro.fome=0;
    }
    else if (item == "vigorFisico") {
      fazendeiro.vigorFisico = fazendeiro.vigorFisico + valorAserAdicionado;
      if (fazendeiro.vigorFisico > 100)
        fazendeiro.vigorFisico = 100;
      if (fazendeiro.fome<=0)
        fazendeiro.vigorFisico=0;
    }
    else if (item == "experiencia") {
      fazendeiro.experiencia = fazendeiro.experiencia + valorAserAdicionado;
      if (fazendeiro.experiencia> 100)
        fazendeiro.experiencia = 100;
      if (fazendeiro.experiencia<=0)
        fazendeiro.experiencia = 0;
    }
  }
  @action
  void adicionarAgua(){
    //checarMissao(Missoes.coletarAgua);
    fazendeiro.agua++;
  }


  @action
  void utilizarAgua(){
    //checarMissao(Missoes.);
    if(fazendeiro.agua>0)
      fazendeiro.agua--;
  }

  @action
  void utilizarLeite(){
    if(fazendeiro.leite>0)
      fazendeiro.leite--;

  }




}
