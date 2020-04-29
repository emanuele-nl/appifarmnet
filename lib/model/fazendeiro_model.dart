import 'package:flutter/scheduler.dart';
import 'package:i_farm_net_new/model/celeiro_model.dart';
import 'package:i_farm_net_new/model/cultivo_model.dart';
import 'package:i_farm_net_new/model/missoes_model.dart';
import 'package:i_farm_net_new/model/pergunta_model.dart';

class Fazendeiro{
  static  final Fazendeiro _instance= Fazendeiro._internalConstructor();
  String nome;
  String nomeImagem = "1";
  List<Cultivo> alimentosDisponiveisParaPlantar;
  Celeiro celeiro;
  int fome = 100;
  int vigorFisico = 100;
  int experiencia = 0;
  int agua = 8;
  int adubo=8;
  int leite = 2;


  List<String> nomeProdutos = ['cenoura'];
  List<int> quantidadeProdutos= [8];
  String cultivoAtual;
  List<String> colheitas = ['cenoura','tomate','morango','alface'];
  List<String> itensMercado = ['Biscoito','chocolate','racao','refrigerante','Suco de Laranja'];

  String missaAtual= Missoes.realizarUmaTroca;
  bool missaoConcluida =false;
  bool avisoNovaMissao = false;
  List<String> missoes = [Missoes.realizarUmaTroca,Missoes.comprarItemMercado,Missoes.coletarAgua,Missoes.colherAlimento,Missoes.comerAlimento,Missoes.coletarLeite,Missoes.coletarLeite];
  int numeroMissao = 0;



  factory Fazendeiro(){
    return _instance;
  }

  Fazendeiro._internalConstructor();



  void gerarListaAlimentoCultivavelInicial(){
    switch (nomeImagem){
      case "1":
          nomeProdutos = ["alface"];
          alimentosDisponiveisParaPlantar = [Cultivo.gerarCultivoInicial("alface")];
          break;
      case "2":
        nomeProdutos = ["morango"];
          alimentosDisponiveisParaPlantar = [Cultivo.gerarCultivoInicial("morango")];
          break;
      case "3":
        nomeProdutos = ["tomate"];
          alimentosDisponiveisParaPlantar = [Cultivo.gerarCultivoInicial("tomate")];
          break;
      case "4":
        nomeProdutos = ["cenoura"];
          alimentosDisponiveisParaPlantar = [Cultivo.gerarCultivoInicial("cenoura")];
          break;
      case "5":
        nomeProdutos = ["alface"];
          alimentosDisponiveisParaPlantar = [Cultivo.gerarCultivoInicial("feijao")];
          break;

      default:
        print("implementar uma exception aqui");

    }

  }





}