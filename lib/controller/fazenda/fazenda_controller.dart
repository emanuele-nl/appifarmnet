import 'package:i_farm_net_new/model/fazenda_model.dart';
import 'package:i_farm_net_new/model/terreno_model.dart';
import 'package:mobx/mobx.dart';
part 'fazenda_controller.g.dart';


class FazendaController = _FazendaControllerBase with _$FazendaController;


abstract class _FazendaControllerBase with Store{


  @observable
  Terreno terreno = Terreno();

  @observable
  String estadoAtual="vazio";

  @action
  evoluirTerreno() {
    if (terreno.valorEstadoAtual<3)
      terreno.valorEstadoAtual++;
    else
      terreno.valorEstadoAtual=0;

    terreno.estadoAtual = terreno.estadosTerreno[terreno.valorEstadoAtual];
    estadoAtual = terreno.estadoAtual;
  }


}
