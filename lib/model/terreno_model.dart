import 'package:i_farm_net_new/model/cultivo_model.dart';
import 'package:i_farm_net_new/model/fazendeiro_model.dart';

class Terreno{
  String nomeCultivo;
  int valorEstadoAtual =0;
  List<String> estadosTerreno= ["vazio","semeado","desenvolvimento","completo","morta"];
  String estadoAtual = "vazio";
  Fazendeiro fazendeiro = Fazendeiro();

  void evoluirEstado(){
    if (valorEstadoAtual<4)
      valorEstadoAtual++;
    else
      valorEstadoAtual=0;

    estadoAtual = estadosTerreno[valorEstadoAtual];

  }

  void matarPlantacao(){
    valorEstadoAtual=4;
    estadoAtual = "morta";
  }

  void limparTerreno(){
    valorEstadoAtual=0;
    estadoAtual = estadosTerreno[valorEstadoAtual];
  }


}