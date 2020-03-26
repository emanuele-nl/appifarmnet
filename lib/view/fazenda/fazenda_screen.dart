import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:i_farm_net_new/controller/fazenda/fazenda_controller.dart';
import 'package:i_farm_net_new/model/celeiro_model.dart';
import 'package:i_farm_net_new/model/fazendeiro_model.dart';
import 'package:i_farm_net_new/model/pergunta_model.dart';
import 'package:i_farm_net_new/view/barra_navegacao_widget.dart';
import 'package:i_farm_net_new/view/celeiro_screen.dart';


class FazendaScreen extends StatefulWidget {

  @override
  _FazendaScreenState createState() => _FazendaScreenState();

}

class _FazendaScreenState extends State<FazendaScreen> {
  final controller= FazendaController();

  @override
  Widget build(BuildContext context) {
    //List<String> nomeProdutos= ["cenoura"];

    return new Scaffold(
        backgroundColor: Color.fromRGBO(49, 122, 45, 0.7),
        appBar: BarraNavegacao(),
        body:
      Center(
        child:
            Row(
              children: <Widget>[
                Container(width: 20),
                Column(
                  children: <Widget>[
                    terreno(),
                  ],
                ),
                Container(width: 60,),
                Column(
                  children:[
                          GestureDetector(
                              child: Image.asset("lib/view/assets/celeiro.png",height: 100,),
                              onTap:() {
                                showCupertinoModalPopup<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return celeiro(context);
                                  },

                                );
                              }
                          ),
                          Container(height: 70,),
                          GestureDetector(
                            child: Image.asset("lib/view/assets/poco.png",height:100),
                            onTap: (){
                                controller.fazendeiro.adicionarAgua();
                                showCupertinoModalPopup<void>(
                                context: context,
                                builder: (BuildContext context) {
                                return celeiro(context);
                                },
                                );
                                }
                          )
                        ],
                      ),
              ]
            )));
  }


  Future<void> aparecerPergunta(Pergunta pergunta) async {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(pergunta.questao, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
          backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),
          content: Column(children:alternativasPergunta(pergunta)),
        );

      },
    );
  }

  List<Widget> alternativasPergunta(Pergunta pergunta){
    List<Widget> alternativas = [];

    for (String alternativa in pergunta.alternativas){
      alternativas.add(
        RaisedButton(
          child: Text(alternativa),
          onPressed: (){
              evoluiOuMorre(alternativa, pergunta.respostaCorreta);
              Navigator.of(context).pop();

          },
        )
      );

    }

    return alternativas;


  }

  Widget terreno(){

    int numeroPergunta = 0;
    Perguntas perguntas = Perguntas.fromJSON(jsonPerguntas);
    Pergunta pergunta = perguntas.listaPerguntas[numeroPergunta];


    return Stack(
      children: [
        Image.asset("lib/view/assets/plantacao/cercaplantacoes.png", height: 125.0),
        GestureDetector(
          child: Observer(builder: (_){
            double altura = 120.0;
            String cultivoAtual = controller.fazendeiro.cultivoAtual;
            if (cultivoAtual == null|| controller.estadoAtual == "vazio")
              return Image.asset("lib/view/assets/plantacao/"+controller.estadoAtual+".png",height: altura,);
            return Image.asset("lib/view/assets/plantacao/"+cultivoAtual+"/"+controller.estadoAtual+".png",height: altura,);}),
          onTap:(){

            if (controller.estadoAtual == "morta"){
              controller.evoluirTerreno();
            }

            else if (controller.estadoAtual == "vazio"){
              aparecerOpcoesCultivo(controller.fazendeiro.nomeProdutos);
            }

            else if (controller.estadoAtual == "completo"){
              controller.evoluirTerreno();
              controller.fazendeiro.adicionarItem(controller.fazendeiro.cultivoAtual);
              controller.fazendeiro.adicionarItem(controller.fazendeiro.cultivoAtual);

            }

            else if (controller.estadoAtual != "vazio") {
              aparecerPergunta(pergunta);
              numeroPergunta++;
              pergunta = perguntas.listaPerguntas[numeroPergunta];
            }

          }

      )],
    );


  }

  Future<void> aparecerOpcoesCultivo(List<String> cultivos) async {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          message: Text("Selecione um cultivo"),
          actions: _gerarOpcoesCultivos(cultivos),

          //cancelButton: ,
        );
      },
    );

  }

  List<Widget>_gerarOpcoesCultivos (List<String> cultivos){
    List<Widget> widgetsCultivo = [];
    for (String cultivo in cultivos){
        widgetsCultivo.add(CupertinoActionSheetAction(
          child: Text(cultivo),
          onPressed:()  { controller.evoluirTerreno();
          controller.fazendeiro.cultivoAtual = cultivo;
          Navigator.of(context).pop();
          controller.fazendeiro.retirarItem(controller.fazendeiro.cultivoAtual);
          },
        ));
    }
    return widgetsCultivo;


  }


  void evoluiOuMorre(String respostaSelecionada,String repostaEsperada){
    if (respostaSelecionada == repostaEsperada){
      controller.evoluirTerreno();
      controller.fazendeiro.adicionarValorItemSaude("sabedoria", 1);
      controller.fazendeiro.adicionarValorItemSaude("vigorfísico", -5);
      controller.fazendeiro.adicionarValorItemSaude("fome", -6);
    }
    else{
      controller.matarTerreno();
      controller.fazendeiro.adicionarValorItemSaude("fome", -9);
      controller.fazendeiro.adicionarValorItemSaude("vigorfísico", -3);
    }
    controller.fazendeiro.agua--;

  }


  List<Widget> gerarWidgetsItensCeleiro(List<String> produtos, List<int> quantidades){
    List<Widget> itensLista= []  ;
    int i=0;
    for (String itens in produtos){
      itensLista.add(
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
              showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) {
              return comerItemCeleiro(context,itens);
              });

            },
            child: ListTile(
               leading: Image.asset("lib/view/assets/produtos/"+itens+".png", width: 50,),
               trailing: Text(quantidades[i].toString()),
               title: Text(itens),
      ),
          ));
      i++;
    }

    itensLista.add(Text("agua x"+controller.fazendeiro.agua.toString()));
    return itensLista;
  }

  Widget comerItemCeleiro(BuildContext context,String itemSelecionado){
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      content: Column(
        children: <Widget>[
          Image.asset("lib/view/assets/produtos/" + itemSelecionado ),
          Text("Você gostaria de consumir "+itemSelecionado+"?")
        ],
      ),
      actions: <Widget>[
        BotaoRecusa(context),
        BotaoConfirma(context,itemSelecionado)
      ],
    );

  }

  Widget celeiro(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      title:Text("Celeiro", textAlign: TextAlign.start,),
      content: Column(children: gerarWidgetsItensCeleiro(controller.fazendeiro.nomeProdutos,controller.fazendeiro.quantidadeProdutos ),
    ),
      actions: <Widget>[
        BotaoModal(context),
      ],
    );
  }

  Widget BotaoModal(BuildContext context) {
    return Container(
      child: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("ok", style: Theme
              .of(context)
              .textTheme
              .button,)),
    );
  }

  Widget BotaoRecusa(BuildContext context) {
    return Container(
      child: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Não", style: Theme
              .of(context)
              .textTheme
              .button,)),
    );
  }

  Widget BotaoConfirma(BuildContext context,String alimento) {
    return Container(
      child: FlatButton(
          onPressed: () {
            controller.fazendeiro.adicionarValorItemSaude("fome", 15);
            controller.fazendeiro.comer(alimento);
            Navigator.of(context).pop();
          },
          child: Text("Sim", style: Theme
              .of(context)
              .textTheme
              .button,)),
    );
  }


  final jsonPerguntas ={
    "perguntas": [{
      "questao": "Quanto tempo o tomate leva para poder ser cultivado ?",
      "alternativas": [
        "entre 90 e 110 dias",
        "entre 95 e 115 dias",
        "entre 200 e 250 dias",
        "entre 15 e 30 dias"
      ],
      "respostaCorreta": "entre 90 e 110 dias",
      "assuntoPergunta": "cultivo"
    }, {
      "questao": "Quanto tempo a batata leva para poder ser cultivada ?",
      "alternativas": [
        "entre 90 dias a 280 dias",
        "entre 15 dias a 20 dias",
        "entre 75 dias a 180 dias",
        "entre 65 dias a 700 dias"
      ],
      "respostaCorreta": "75 dias a 180 dias",
      "assuntoPergunta": "cultivo"
    }, {
      "questao": "Quanto tempo a mandioca leva para poder ser cultivada ?",
      "alternativas": [
        "entre 16 dias a 20 dias",
        "entre 7 meses a 5 anos",
        "entre 12 meses a 9 anos",
        "6 meses a 3 anos"
      ],
      "respostaCorreta": "6 meses a 3 anos",
      "assuntoPergunta": "cultivo"
    },
      {
        "questao": "Organismos vivos contribuem para a formação do solo com?",
        "alternativas": [
          "material orgânico em decomposição",
          "urbanização",
          "lixiviação",
          "assoreamento"
        ],
        "respostaCorreta": "material orgânico em decomposição",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual ser vivo contribuem escavando canais no solo?",
        "alternativas": [
          "Quero-quero",
          "Borboleta",
          "Tatu",
          "Minhoca"
        ],
        "respostaCorreta": "Minhoca",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual agente provoca a lixiviação?",
        "alternativas": [
          "Maresia",
          "Terremoto",
          "Chuva",
          "Homem"
        ],
        "respostaCorreta": "Chuva",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Quando a lixiviação é intensa e contínua, ela causa:",
        "alternativas": [
          "Laterização",
          "Falta de saneamento",
          "Superprodução",
          "Poluição do ar"
        ],
        "respostaCorreta": "Laterização",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual item não é um macronutriente essencial do solo?",
        "alternativas": [
          "Nitrogênio",
          "Fósforo",
          "Potássio",
          "Cálcio"
        ],
        "respostaCorreta": "Cálcio",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "O que é húmus?",
        "alternativas": [
          "Material inorgânico em decomposição",
          "Um alimento a base de soja",
          "Um sal",
          "Material orgânico em decomposição"
        ],
        "respostaCorreta": "Material orgânico em decomposição",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "O que é resíodo radioativo?",
        "alternativas": [
          "Restos de pilhas",
          "Água tônica",
          "Lixo derivado de peças de rádio",
          "Subproduto da energia nuclear"
        ],
        "respostaCorreta": "Subproduto da energia nuclear",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "O que é lixívia?",
        "alternativas": [
          "Lixiviação",
          "Aterros sanitários",
          "Saneamento básico",
          "Chorume"
        ],
        "respostaCorreta": "Chorume",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual o produto final da compostagem?",
        "alternativas": [
          "Adubo",
          "Material orgânico",
          "Desertificação",
          "Aço"
        ],
        "respostaCorreta": "Adubo",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "A lata de lixo verde se destina para:",
        "alternativas": [
          "Madeira",
          "Vidro",
          "Papel",
          "Plástico"
        ],
        "respostaCorreta": "Vidro",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "A lata de lixo cinza se destina para:",
        "alternativas": [
          "Madeira",
          "Vidro",
          "Papel",
          "Plástico"
        ],
        "respostaCorreta": "Madeira",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "A lata de lixo vermelha se destina para:",
        "alternativas": [
          "Madeira",
          "Vidro",
          "Papel",
          "Plástico"
        ],
        "respostaCorreta": "Plástico",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "A lata de lixo azul se destina para:",
        "alternativas": [
          "Madeira",
          "Vidro",
          "Papel",
          "Plástico"
        ],
        "respostaCorreta": "Papel",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "A lata de lixo marrom se destina para:",
        "alternativas": [
          "Madeira",
          "Orgânico",
          "Papel",
          "Plástico"
        ],
        "respostaCorreta": "Orgânico",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual dessas características pertencem as tundras?",
        "alternativas": [
          "Solo pobre em nutrientes",
          "Solo rico em nutrientes",
          "Fauna rica",
          "Flora rica"
        ],
        "respostaCorreta": "Solo pobre em nutrientes",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses biomas não ocorre na América Latina?",
        "alternativas": [
          "Floresta Ombrófila",
          "Formação Hermácea",
          "Deserto",
          "Tundra"
        ],
        "respostaCorreta": "Tundra",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses biomas é o predominante no Brasil?",
        "alternativas": [
          "Floresta Ombrófila",
          "Floresta Temperada",
          "Tundra",
          "Taiga"
        ],
        "respostaCorreta": "Floresta Ombrófila",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual paisagem natural é predominante na região norte?",
        "alternativas": [
          "Floresta Amazônica",
          "Mata Atlântica",
          "Pampas",
          "Caatinga"
        ],
        "respostaCorreta": "Floresta Amazônica",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual paisagem natural é predominante na região nordeste?",
        "alternativas": [
          "Floresta Amazônica",
          "Mata Atlântica",
          "Pampas",
          "Caatinga"
        ],
        "respostaCorreta": "Caatinga",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual paisagem natural é predominante no Pantanal?",
        "alternativas": [
          "Floresta Amazônica",
          "Mata Atlântica",
          "Cerrado",
          "Caatinga"
        ],
        "respostaCorreta": "Cerrado",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual dessas áreas alagam durante as cheias dos rios?",
        "alternativas": [
          "Matas de igapós",
          "Matas de várzea",
          "Cerrado",
          "Matas de terra firme"
        ],
        "respostaCorreta": "Matas de várzea",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual dessas áreas alagam durante todo o ano?",
        "alternativas": [
          "Matas de igapós",
          "Matas de várzea",
          "Cerrado",
          "Matas de terra firme"
        ],
        "respostaCorreta": "Matas de igapós",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual dessas áreas não alaga?",
        "alternativas": [
          "Matas de igapós",
          "Matas de várzea",
          "Pantanal",
          "Matas de terra firme"
        ],
        "respostaCorreta": "Matas de terra firme",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses itens não é um nome dado as Pampas?",
        "alternativas": [
          "Pradarias Mistas",
          "Campos Sulinos",
          "Campos Gaúchos",
          "Matas de terra firme"
        ],
        "respostaCorreta": "Matas de terra firme",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Em qual dessas regiões se encontra as Pampas",
        "alternativas": [
          "Norte",
          "Sul",
          "Nordeste",
          "Sudeste"
        ],
        "respostaCorreta": "Sul",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Em qual dessas regiões se encontra o Lavrado",
        "alternativas": [
          "Norte",
          "Sul",
          "Nordeste",
          "Sudeste"
        ],
        "respostaCorreta": "Norte",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses não é um causador direto da chuva ácida?",
        "alternativas": [
          "Veículos automotores",
          "Indústrias",
          "Usinas Termelétricas",
          "Usinas Nucleares"
        ],
        "respostaCorreta": "Usinas Nucleares",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses itens é o maior emissor de gás carbônico no Brasil?",
        "alternativas": [
          "Agricultura",
          "Geração de energia",
          "Processos industriais",
          "Tratamento de resíduos"
        ],
        "respostaCorreta": "Agricultura",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses é o maior poluidor?",
        "alternativas": [
          "China",
          "Estados Unidos",
          "União Européia",
          "Brasil"
        ],
        "respostaCorreta": "China",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses itens não é uma fonte de energia limpa?",
        "alternativas": [
          "Hidrelétricas",
          "Usinas Geotérmicas",
          "Usinas Nucleares",
          "Usinas Termelétricas"
        ],
        "respostaCorreta": "Usinas Termelétricas",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses métodos é usado para gerar energia nas Termelétricas?",
        "alternativas": [
          "Calor do solo",
          "Luz solar",
          "Queima de carvão",
          "Ventos"
        ],
        "respostaCorreta": "Queima de carvão",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual dessas fases do ciclo da água se refere as chuvas?",
        "alternativas": [
          "Evaporação",
          "Infiltração",
          "Absorção",
          "Precipitação"
        ],
        "respostaCorreta": "Precipitação",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual dessas fases do ciclo da água causam os rios subterrâneos?",
        "alternativas": [
          "Evaporação",
          "Infiltração",
          "Absorção",
          "Precipitação"
        ],
        "respostaCorreta": "Infiltração",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses não é um strato dos organismos aquáticos?",
        "alternativas": [
          "Nécton",
          "Venon",
          "Plâncton",
          "Bento"
        ],
        "respostaCorreta": "Venon",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses não é uma característica dos manguezais?",
        "alternativas": [
          "Solos alagados",
          "Solos ricamente oxigenados",
          "Solos instáveis",
          "Solos ricos em matéria orgânica"
        ],
        "respostaCorreta": "Solos ricamente oxigenados",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses não é uma divisão do ecossistema marítimo?",
        "alternativas": [
          "Zona manguezal",
          "Domínio bentônico",
          "Zona afótica",
          "Zona fótica"
        ],
        "respostaCorreta": "Zona manguezal",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses tem a maior porcentagem da população com acesso a água potável?",
        "alternativas": [
          "Países industrializados",
          "América Latina e Caribe",
          "Sul da Ásia",
          "África Subsaariana"
        ],
        "respostaCorreta": "Países industrializados",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Em qual desses itens é onde se  gasta mais água em uma casa no Brasil?",
        "alternativas": [
          "Descarga",
          "Higiene corporal",
          "Lavagem de Roupa",
          "Cozinhar"
        ],
        "respostaCorreta": "Descarga",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses países se gasta mais água per capita?",
        "alternativas": [
          "Estados Unidos",
          "Argentina",
          "México",
          "Brasil"
        ],
        "respostaCorreta": "Estados Unidos",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Em qual dos países da América Latina mais se gasta água per capita?",
        "alternativas": [
          "Brasil",
          "Chile",
          "Argentina",
          "Peru"
        ],
        "respostaCorreta": "Argentina",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses itens não é consequências do acúmulo de sedimentos na água?",
        "alternativas": [
          "Redução da penetração de Luz",
          "Morte de animais aquáticos",
          "Aumento da água mineral potável",
          "Diminuição da vazão dos cursos de água"
        ],
        "respostaCorreta": "Aumento da água mineral potável",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual dessas doenças não é transmitida pela água",
        "alternativas": [
          "Cólera",
          "Poliomielite",
          "Cisticercose",
          "COVID-19"
        ],
        "respostaCorreta": "COVID-19",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses itens é uma característica do tratamento primário do esgoto?",
        "alternativas": [
          "Remoção de resíduos sólidos na superfície",
          "Passagem por aeradores",
          "Processos químicos",
          "Ação de microorganismos"
        ],
        "respostaCorreta": "Remoção de resíduos sólidos na superfície",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses itens é uma característica do tratamento terciário do esgoto?",
        "alternativas": [
          "Remoção de resíduos sólidos na superfície",
          "Passagem por aeradores",
          "Processos químicos",
          "Ação de microorganismos"
        ],
        "respostaCorreta": "Processos químicos",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses itens é uma característica do tratamento secundário do esgoto?",
        "alternativas": [
          "Remoção de resíduos sólidos na superfície",
          "Passagem por aeradores",
          "Processos químicos",
          "Uso de cloro"
        ],
        "respostaCorreta": "Passagem por aeradores",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual dessas regiões tem a maior porcentagem de casas ligadas a rede pública de esgoto?",
        "alternativas": [
          "Norte",
          "Sul",
          "Nordeste",
          "Sudeste"
        ],
        "respostaCorreta": "Sudeste",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual dessas regiões tem a menor porcentagem de casas ligadas a rede pública de esgoto?",
        "alternativas": [
          "Norte",
          "Sul",
          "Nordeste",
          "Sudeste"
        ],
        "respostaCorreta": "Norte",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual dessas não é uma alternativa para os resíduos orgânicos?",
        "alternativas": [
          "Fossa negra",
          "Fossa marítima",
          "Fossa séptica",
          "Biodigestor"
        ],
        "respostaCorreta": "Fossa marítima",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses não é uma das ideias de Charles Darwin?",
        "alternativas": [
          "Evolução das espécies",
          "Geração espontânea",
          "Ancestralidade Comum",
          "Seleção Natural"
        ],
        "respostaCorreta": "Geração espontânea",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses não é um aspecto do lamarckismo?",
        "alternativas": [
          "Geração espontânea",
          "Impulso interno",
          "Seleção natural",
          "Sequência linear"
        ],
        "respostaCorreta": "Seleção natural",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual dessas é a maior obra de Charles Darwin?",
        "alternativas": [
          "Crepúsculo",
          "Harry Potter",
          "A evolução do relevo da terra",
          "A origem das espécies"
        ],
        "respostaCorreta": "A origem das espécies",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses não é exemplo de microevolução?",
        "alternativas": [
          "Insetos e inseticidas",
          "Bactérias e antibióticos",
          "Melanismo industrial",
          "Adaptação"
        ],
        "respostaCorreta": "Adaptação",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "O que é a Meia-vida?",
        "alternativas": [
          "Um fóssil",
          "Metade do tempo médio de vida de um homem",
          "Metade do tempo necessário para a massa de um isótopo se torne outro",
          "50 anos"
        ],
        "respostaCorreta": "Metade do tempo necessário para a massa de um isótopo se torne outro",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses é um consumidor primário?",
        "alternativas": [
          "Grilo",
          "Rato",
          "Cobra",
          "Águia"
        ],
        "respostaCorreta": "Grilo",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses é um consumidor secundário?",
        "alternativas": [
          "Grilo",
          "Rato",
          "Cobra",
          "Águia"
        ],
        "respostaCorreta": "Rato",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses é um produtor?",
        "alternativas": [
          "Grilo",
          "Rato",
          "Cobra",
          "Planta"
        ],
        "respostaCorreta": "Planta",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses não é uma simbiose?",
        "alternativas": [
          "Mutualismo",
          "Comensalismo",
          "Parasitismo",
          "Malabarismo"
        ],
        "respostaCorreta": "Malabarismo",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses não é uma relação harmônica??",
        "alternativas": [
          "Mutualismo",
          "Comensalismo",
          "Parasitismo",
          "Protocooperação"
        ],
        "respostaCorreta": "Parasitismo",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses não é uma relação desarmônica?",
        "alternativas": [
          "Mutualismo",
          "Competição",
          "Parasitismo",
          "Amensalismo"
        ],
        "respostaCorreta": "Mutualismo",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses não é uma simbiose?",
        "alternativas": [
          "Mutualismo",
          "Comensalismo",
          "Parasitismo",
          "Malabarismo"
        ],
        "respostaCorreta": "Malabarismo",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses não é um indicador de social e de saúde?",
        "alternativas": [
          "Taxa de desemprego",
          "Taxa de mortalidade infantil",
          "Taxa de mortalidade geral",
          "Taxa de produto externo"
        ],
        "respostaCorreta": "Taxa de produto externo",
        "assuntoPergunta": "Biologia"
      },
      {
        "questao": "Qual desses não é um fator abiótico?",
        "alternativas": [
          "Radiação solar",
          "Relevo",
          "Antropomorfismo",
          "Ressurgência"
        ],
        "respostaCorreta": "Antropomorfismo",
        "assuntoPergunta": "Biologia"
      }, {
        "questao": "O que você entende pelo termo agricultura familiar?",
        "alternativas": [
          "Fundo de alto risco de grandes investidores",
          "Modo de organização da prodrução agrícola por pequenos produtores, quando há unidade entre a gestão e o trabalho",
          "Capacidade de compra de toneladas de produtos",
          "Impacto da mudança climática do Brasil "
        ],
        "respostaCorreta": "Modo de organização da prodrução agrícola por pequenos produtores, quando há unidade entre a gestão e o trabalho",
        "assuntoPergunta": "Sociologia"
      }, {
        "questao": "O que você entende pelo modelo patronal?",
        "alternativas": [
          "Aquele que utiliza trabalhadores contratados, com a gestão separada do trabalho",
          "Aquele que utiliza trabalhadores rurais, com a gestão unificada ao trabalho",
          "Aquele que utiliza trabalhadores contratados, com a gestão unificada ao trabalho",
          "Aquele que utiliza cooperadores, com a gestão unificada ao trabalho "
        ],
        "respostaCorreta": "Aquele que utiliza trabalhadores contratados, com a gestão separada do trabalho",
        "assuntoPergunta": "Sociologia"
      }, {
        "questao": "De acordo com o Banco Mundial nos anos 2007 e 2008 o preço dos alimentos subiram em média 83%. O aumento dos produtos alimentícios acaba gerando ainda mais probeza e fome na população, colocando famílias em uma situação de vulnerabilidade. Há muitas causas para o aumento expressivo no preço dos alimentos. Cite algumas delas?",
        "alternativas": [
          "Maior demanda por combustíveis, especulação do mercado financeiro, revolução verde",
          "Maior demanda por combustíveis, especulação do mercado financeiro,distribuição dos estabelecimentos ",
          "Distribuição dos estabelecimentos, revolução verde, mudanças climáticas",
          "Aumento da demanda por alimentos, diminuição da terra, mudanças climáticas "
        ],
        "respostaCorreta": "Aumento da demanda por alimentos, diminuição da terra, mudanças climáticas",
        "assuntoPergunta": "Sociologia"
      }, {
        "questao": "São exemplos de economia solidária: Associações, cooperativas, clubes de troca e grupos de produção. Ao jogar IFarmNet, em quais dos exemplos acima você estava inserido?",
        "alternativas": [
          "Associação e/ou Cooperativa",
          "Clube de troca e/ou Grupo de produção",
          "todas as categorias",
          "nenhuma das categorias"
        ],
        "respostaCorreta": "Clube de troca e/ou Grupo de produção",
        "assuntoPergunta": "Sociologia"
      }, {
        "questao": "Todas as atividades abaixo são realizadas na economia solidária, quais delas você realiza ao jogar IFarmNet?",
        "alternativas": [
          "Produção de bens e serviços",
          "Comércio justo",
          "Consumo solidário e trocas",
          "Finanças solidárias"
        ],
        "respostaCorreta": "Consumo solidário e trocas",
        "assuntoPergunta": "Sociologia"
      }, {
        "questao": "A ideia de desenvolvimento sustentáveltem sido cada vez mais discutida junto às questões que se referem ao crescimento econômico. De acodo com esse conceito, considera-se que:",
        "alternativas": [
          "o meio ambiente é fundamental para a vida humana e, portanto, deve ser intocável",
          "ocorre uma oposição entre desenvolvimento e proteção ao meio ambiente e, portanto, é inevitável que os riscos ambientais sustentem o crescimento econômico dos povos",
          "deve-se buscar uma forma de progresso socioeconômico que não comprometa o meio ambiente sem que, com isso, deixemos de utilizar os recursos nele disponíveis",
          "são as riquezas acumuladas nos países ricos, em prejuízo das antigas colônias durante a expansão colonial, que devem, hoje, sustentar o crescimento econômico dos povos"
        ],
        "respostaCorreta": "deve-se buscar uma forma de progresso socioeconômico que não comprometa o meio ambiente sem que, com isso, deixemos de utilizar os recursos nele disponíveis",
        "assuntoPergunta": "Sociologia"
      }, {
        "questao": "O que é sustentabilidade?",
        "alternativas": [
          "é um termo usado para definir ações e atividades humanas que visam destruir a natureza",
          "é um termo usado para definir ações e atividades humanas que visam esgotar os recursos da natureza ",
          "é um termo usado para definir ações e atividades humanas que visam suprir as necessidades atuais dos seres humanos, comprometendo o futuro das próximas gerações",
          "é um termo usado para definir ações e atividades humanas que visam suprir as necessidades atuais dos seres humanos, sem comprometer o futuro das próximas gerações"
        ],
        "respostaCorreta": "é um termo usado para definir ações e atividades humanas que visam suprir as necessidades atuais dos seres humanos, sem comprometer o futuro das próximas gerações",
        "assuntoPergunta": "Sociologia"
      }, {
        "questao": "O que é meio ambiente?",
        "alternativas": [
          "Engloba todos os elementos vivos e não-vivos que estão relacionados com a vida na Terra. É tudo aquilo que nos cerca, como a água, o solo, a vegetação, o clima, os animais, os seres humanos, dentre outros",
          "É a proteção sem a intervenção humana. Significa a natureza intocável ",
          "objetivo de mitigar o impacto dos problemas ambientais",
          "É a proteção com uso racional da natureza, através do manejo sustentável"
        ],
        "respostaCorreta": "Engloba todos os elementos vivos e não-vivos que estão relacionados com a vida na Terra. É tudo aquilo que nos cerca, como a água, o solo, a vegetação, o clima, os animais, os seres humanos, dentre outros",
        "assuntoPergunta": "Biologia"
      }, {
        "questao": "Algumas posturas devem ser adotadas para um melhor desenvolvimento de tarefas diárias. Sobre o andar, assinale a alternativa correta",
        "alternativas": [
          " O calçado deve ser preferencialmente, com salto de altura mínima de 5 cm",
          "Ao pisar, deve-se primeiro apoiar a ponta do pé, depois a planta e em seguida o calcanhar ",
          "Olhar sempre para baixo",
          "A base e parte anterior do calçado devem ser estreitas"
        ],
        "respostaCorreta": "Ao pisar, deve-se primeiro apoiar a ponta do pé, depois a planta e em seguida o calcanhar",
        "assuntoPergunta": "Biologia"
      }, {
        "questao": "Solos saudáveis são fundamentais para os suprimentos de alimentos, combustíveis, fibras e até medicamentos, disse a Organização das Nações Unidas para Alimentação e Agricultura (FAO) […]. De acordo com a FAO, a América Latina e o Caribe têm as maiores reservas de terras cultiváveis do mundo; portanto, o cuidado e a preservação dos seus solos é fundamental para que a região alcance a meta de erradicação da fome. Existem várias técnicas nos sistemas de cultivo que permitem o uso do solo sem afetar a sua conservação, EXCETO:",
        "alternativas": [
          " terraceamento",
          "rotação de culturas ",
          "adubação orgânica",
          "fertilização química"
        ],
        "respostaCorreta": "fertilização química",
        "assuntoPergunta": "Biologia"
      }
    ]
  };

}



