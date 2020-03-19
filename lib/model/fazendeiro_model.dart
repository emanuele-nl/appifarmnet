import 'package:flutter/scheduler.dart';
import 'package:i_farm_net_new/model/celeiro_model.dart';
import 'package:i_farm_net_new/model/cultivo_model.dart';

class Fazendeiro{
  static  final Fazendeiro _instance= Fazendeiro._internalConstructor();
  String nome;
  String nomeImagem = "1";
  List<Cultivo> alimentosDisponiveisParaPlantar;
  Celeiro celeiro;
  int fome = 100;
  int vigorFisico = 100;
  int sabedoria = 0;
  int agua = 8;


  List<String> nomeProdutos = ['cenoura'];
  List<int> quantidadeProdutos= [8];
  String cultivoAtual;
  List<String> colheitas = ['cenoura','tomate','morango','alface'];
  List<String> itensMercado = ['Biscoito','chocolate','racao','refrigerante','Suco de Laranja'];




  factory Fazendeiro(){
    return _instance;
  }

  Fazendeiro._internalConstructor();



  void gerarListaAlimentoCultivavelInicial(){
    switch (nomeImagem){
      case "1":
          alimentosDisponiveisParaPlantar = [Cultivo.gerarCultivoInicial("alface")];
          break;
      case "2":
          alimentosDisponiveisParaPlantar = [Cultivo.gerarCultivoInicial("morango")];
          break;
      case "3":
          alimentosDisponiveisParaPlantar = [Cultivo.gerarCultivoInicial("tomate")];
          break;
      case "4":
          alimentosDisponiveisParaPlantar = [Cultivo.gerarCultivoInicial("cenoura")];
          break;
      case "5":
          alimentosDisponiveisParaPlantar = [Cultivo.gerarCultivoInicial("feijao")];
          break;

      default:
        print("implementar uma exception aqui");

    }

  }

  void comer(String nome){
    retirarItem(nome);
  }

  void adicionarItem(String nomeCultivo){
    int i=0;
    int posicaoSelecionada;
    for (String cultivo in nomeProdutos){
      if (cultivo == nomeCultivo)
        posicaoSelecionada=i;
      i++;
    }
    quantidadeProdutos[posicaoSelecionada]++;
  }

  void retirarItem(String nomeCultivo){
    int i=0;
    int posicaoSelecionada;
    for (String cultivo in nomeProdutos){
      if (cultivo == nomeCultivo)
        posicaoSelecionada=i;
      i++;
    }
    quantidadeProdutos[posicaoSelecionada]--;
  }

  void adicionarValorItemSaude(String item, int valorAserAdicionado){
    if (item == "fome"){
      fome=fome + valorAserAdicionado;
      if (fome > 100)
        fome = 100;
    }
    else if (item == "vigorFisico") {
        vigorFisico = vigorFisico + valorAserAdicionado;
        if (vigorFisico > 100)
          vigorFisico = 100;
      }
    else if (item == "sabedoria") {
      sabedoria = sabedoria + valorAserAdicionado;
      if (sabedoria> 100)
        sabedoria = 100;
    }
  }

  void adicionarAgua(){
    agua++;
  }



}