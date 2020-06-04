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
  Fazendeiro fazendeiro = Fazendeiro();


  @action
  evoluirTerreno() {
    adicionarValorItemSaude("fome",-10);

    if (terreno.valorEstadoAtual<3) {
      terreno.valorEstadoAtual++;
    }
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





  @action
  bool checarMissao (String acaoRealizada){

    if ((acaoRealizada == fazendeiro.missaoAtual) &  (!fazendeiro.missaoConcluida)){
      fazendeiro.missaoConcluida = true;
      fazendeiro.avisoNovaMissao = true;
      fazendeiro.escreverArquivo();
      return true;
    }
    return false;
  }

  @action
  void produzirAdubo(){
    fazendeiro.adubo++;
    fazendeiro.escreverArquivo();

    //checarMissao(Missoes.gerarAdubo);
  }

  @action
  void utilizarAdubo (){
    if (fazendeiro.adubo>0)
      fazendeiro.adubo--;
    fazendeiro.escreverArquivo();

  }

  @action
  void coletarLeite(){
    fazendeiro.leite++;
    fazendeiro.escreverArquivo();

    //checarMissao(Missoes.coletarLeite);

  }

  @action
  void comer(String alimento){
    List<String> alimentosSaudaveis = ["cenoura","tomate","alface","morango"];
    retirarItem(alimento);
    
    if(alimentosSaudaveis.contains(alimento)){
      adicionarValorItemSaude("fome", 15);
      adicionarValorItemSaude("vigorFisico", -10);
    }
    else {
      adicionarValorItemSaude("fome", 15);
      adicionarValorItemSaude("vigorFisico", -30);
    }
    fazendeiro.escreverArquivo();

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
    fazendeiro.escreverArquivo();

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
    //se for o item original, garantir que sempre tenha 1 mas gerar aviso de ajuda externa
    if(posicaoSelecionada==0){
      if(fazendeiro.quantidadeProdutos[posicaoSelecionada]>1) {
        fazendeiro.quantidadeProdutos[posicaoSelecionada]--;
      }
      else{
        fazendeiro.ajudaExterna = true;
      }
    }

    else{
      if(fazendeiro.quantidadeProdutos[posicaoSelecionada]>1){
        fazendeiro.quantidadeProdutos[posicaoSelecionada]--;
      }

      else {
        fazendeiro.quantidadeProdutos.removeAt(posicaoSelecionada);
        fazendeiro.nomeProdutos.removeAt(posicaoSelecionada);
      }

    }

    fazendeiro.escreverArquivo();


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
    fazendeiro.escreverArquivo();

  }
  @action
  void adicionarAgua(){
    //checarMissao(Missoes.coletarAgua);
    fazendeiro.agua++;
    fazendeiro.escreverArquivo();

  }


  @action
  void utilizarAgua(){
    //checarMissao(Missoes.);
    if(fazendeiro.agua>0)
      fazendeiro.agua--;
    fazendeiro.escreverArquivo();

  }

  @action
  void utilizarLeite(){
    if(fazendeiro.leite>0)
      fazendeiro.leite--;

    fazendeiro.escreverArquivo();

  }

  @action
  void utilizarRacao(){
    if(fazendeiro.racao>0)
      fazendeiro.racao--;

    fazendeiro.escreverArquivo();

  }





}
