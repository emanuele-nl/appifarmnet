import 'package:flutter/scheduler.dart';
import 'package:i_farm_net_new/model/cultivo_model.dart';

class Fazendeiro{
  static  final Fazendeiro _instance= Fazendeiro._internalConstructor();
  String nome;
  String nomeImagem;
  List<Cultivo> alimentosDisponiveisParaPlantar;

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
    for (final alimento in alimentosDisponiveisParaPlantar){
      if (alimento.nome == nome && alimento.quantidade > 0){
        alimento.quantidade--;
        //TODO inserir lógica de melhoria de saúde;
      }
    }




  }




}