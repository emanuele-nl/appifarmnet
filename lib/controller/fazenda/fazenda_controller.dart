import 'package:i_farm_net_new/model/fazendeiro_model.dart';
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
      mensagensNoticiasMissoes = "Missao concluída! pegue uma nova missão | ";
    }
    else
      mensagensNoticiasMissoes = "Realize sua missão e ganhe experiência | ";
  }


}
