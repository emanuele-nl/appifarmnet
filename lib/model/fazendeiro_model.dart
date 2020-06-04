import 'dart:convert';
import 'dart:io';

import 'package:i_farm_net_new/model/cultivo_model.dart';
import 'package:i_farm_net_new/model/missoes_model.dart';
import 'dart:math';

import 'package:path_provider/path_provider.dart';


class Fazendeiro{
  static  final Fazendeiro _instance= Fazendeiro._internalConstructor();
  String nome="";
  String nomeImagem = "1";
  String descricaoPersongem ="menina loira de camisa rosa";

  int fome = 100;
  int vigorFisico = 100;
  int experiencia = 0;
  int agua = 0;
  int adubo= 0;
  int leite = 0;
  int fomeVaca =5;
  int racao = 0;
  bool ajudaExterna = false;

  List<String> nomeProdutos = ['cenoura'];
  List<int> quantidadeProdutos= [8];
  String cultivoAtual;
  List<String> colheitas = ['cenoura','tomate','morango','alface'];
  List<String> itensMercado = ['Biscoito','chocolate','racao','refrigerante','Suco de Laranja'];

  String missaoAtual= Missoes.realizarUmaTroca;
  bool missaoConcluida =false;
  bool avisoNovaMissao = false;
  List<String> missoes = [Missoes.coletarAgua,Missoes.caminhar,Missoes.colherAlimento,Missoes.pedalar,Missoes.realizarUmaTroca, Missoes.nadar,Missoes.comprarItemMercado,Missoes.comerAlimento,Missoes.correr,Missoes.coletarLeite,"Não há novas missões"];
  int numeroMissao = 0;

  List<int>ordemPerguntas =[];

  bool arquivoExistente=false;
  bool verdadeiro = true;


  Map<String, dynamic> toJson() => {
      'arquivoExistente' : verdadeiro,
      'nome' : nome,
      'nomeImagem' : nomeImagem ,
      'descricaoPersonagem' : descricaoPersongem ,
      'fome' : fome ,
      'vigorFisico' : vigorFisico,
      'experiencia' : experiencia,
      'agua' : agua,
      'adubo' : adubo,
      'leite' : leite,
      'fomeVaca': fomeVaca,
      'racao' : racao,
      'ajudaExterna' : ajudaExterna,
      'nomeProdutos' : nomeProdutos.cast<String>(),
      'quantidadeProdutos' : quantidadeProdutos.cast<int>(),
      'cultivoAtual' : cultivoAtual,
      'colheitas' : colheitas.cast<String>(),
      'itensMercado' : itensMercado.cast<String>(),
      'missaoAtual' : missaoAtual,
      'missaoConcluida': missaoConcluida,
      'avisoNovaMissao': avisoNovaMissao,
      'numeroMissao' : numeroMissao,
      'ordemPerguntas' : ordemPerguntas.cast<int>(),

  };


  Fazendeiro.fromJson(Map<String, dynamic> json){
        Fazendeiro._instance.arquivoExistente = json ['arquivoExistente'];
        Fazendeiro._instance.nome = json['nome'];
        Fazendeiro._instance.nomeImagem = json['nomeImagem'];
        Fazendeiro._instance.descricaoPersongem = json['descricaoPersonagem'];
        Fazendeiro._instance.fome = json['fome'];
        Fazendeiro._instance.vigorFisico = json['vigorFisico'];
        Fazendeiro._instance.experiencia = json['experiencia'];
        Fazendeiro._instance.agua = json['agua'];
        Fazendeiro._instance.adubo= json['adubo'];
        Fazendeiro._instance.leite = json['leite'];
        Fazendeiro._instance.fomeVaca= json['fomeVaca'];
        Fazendeiro._instance.racao = json['racao'];
        Fazendeiro._instance.ajudaExterna = json['ajudaExterna'];
        Fazendeiro._instance.nomeProdutos = List<String>.from(json['nomeProdutos']);
        Fazendeiro._instance.quantidadeProdutos = List<int>.from(json['quantidadeProdutos']);
        Fazendeiro._instance.cultivoAtual= json['cultivoAtual'];
        Fazendeiro._instance.colheitas = List<String>.from(json['colheitas']);
        Fazendeiro._instance.itensMercado= List<String>.from(json['itensMercado']);
        Fazendeiro._instance.missaoAtual = json['missaoAtual'];
        Fazendeiro._instance.missaoConcluida = json['missaoConcluida'];
        Fazendeiro._instance.avisoNovaMissao = json['avisaNovaMissao'];
        Fazendeiro._instance.numeroMissao = json['numeroMissao'];
        Fazendeiro._instance.ordemPerguntas = List<int>.from(json['ordemPerguntas']);
}





  factory Fazendeiro(){

    return _instance;
  }

  Fazendeiro._internalConstructor();






  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/fazendeiro.txt');
  }

  Future<File> escreverArquivo() async {
    final file = await _localFile;
    print("escrevendo $json.encode(toJson())");
    print(arquivoExistente);

    return file.writeAsString(json.encode(toJson()));
  }



  Future<Fazendeiro> lerArquivo() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();
      print(contents);
      Fazendeiro.fromJson(json.decode(contents));
      arquivoExistente =true;

      print(arquivoExistente);
    } catch (e) {
      // If encountering an error, return 0.
      arquivoExistente = false;
      print("deu ruim!");
      print(e);
      print("$arquivoExistente é arquivo existente");
    }
  }






  void gerarListaAlimentoCultivavelInicial(){
    escreverArquivo();
    switch (nomeImagem){
      case "1":
          nomeProdutos = ["alface"];
          descricaoPersongem="menina branca loira, de óculos e uma camisa rosa";
          break;
      case "2":
        nomeProdutos = ["morango"];
          descricaoPersongem="menina negra morena usando camisa laranja";

        break;
      case "3":
        nomeProdutos = ["tomate"];
          descricaoPersongem="menino branco moreno usando camisa azul";

        break;
      case "4":
        nomeProdutos = ["cenoura"];
          descricaoPersongem="menino negro moreno usando camisa azul";
        break;
      case "5":
        nomeProdutos = ["alface"];
        descricaoPersongem="menina branca morena usando camisa roxa";

        break;
      default:
        print("personagem inexistente!! não deveria bater aqui");

    }

  }

  void gerarListaOrdemPerguntas(){
    var rng = new Random();
    ordemPerguntas = new List.generate(140, (_) =>
        rng.nextInt(75));

  }





}