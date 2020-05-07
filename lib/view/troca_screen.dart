import 'package:auto_size_text/auto_size_text.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:i_farm_net_new/controller/fazenda/fazenda_controller.dart';
import 'package:i_farm_net_new/model/fazendeiro_model.dart';
import 'package:i_farm_net_new/model/missoes_model.dart';

class TrocaScreen extends StatelessWidget {
  Fazendeiro fazendeiro = Fazendeiro();
  List<String> personagensTroca = ["1","2","3","4","5"];
  List<String> itensTroca = ["tomate","alface","ração","cenoura","morango"];


  @override
  Widget build(BuildContext context) {
    List<String> cultivosParaTroca = fazendeiro.colheitas;
    personagensTroca.remove(fazendeiro.nomeImagem);
    itensTroca.remove(fazendeiro.nomeProdutos[0]);


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(49, 122, 45, 0.7),
        ),
        backgroundColor: Color.fromRGBO(49, 122, 45, 0.7),
      body: Stack(
        children: [

          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("lib/view/assets/troca/fundo.png"), fit: BoxFit.cover,),
            ),
          ),
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("lib/view/assets/troca/fundo_troca.png"), fit: BoxFit.fitHeight,),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: [
                  GestureDetector(
                    child: Stack(
                      children: <Widget>[
                        Image.asset("lib/view/assets/troca/casa_troca.png",height: 75,),
                        Row(
                          children: <Widget>[
                            Container(width:20),
                            Image.asset("lib/view/assets/fazendeiros/"+personagensTroca[0]+".png",height: 50,

                            ),
                          ],
                        )
                      ],
                    ),
                    onTap: (){
                      oferecerProdutoParaTroca(itensTroca[0],personagensTroca[0],context);
                      },),
                  Container(width: 60,),
                  GestureDetector(
                    child: Stack(
                      children: <Widget>[
                        Image.asset("lib/view/assets/troca/casa_troca.png",height: 75,),
                        Row(
                          children: <Widget>[
                            Container(width:20),
                            Image.asset("lib/view/assets/fazendeiros/"+personagensTroca[1]+".png",height: 50,

                            ),
                          ],
                        )
                      ],
                    ),

                    onTap: (){
                      oferecerProdutoParaTroca(itensTroca[1],personagensTroca[1],context);
                    },)
                ],
              ),
              Container(height: 60),
              Row(
                children: [
                  GestureDetector(
                    child: Stack(
                      children: <Widget>[
                        Image.asset("lib/view/assets/troca/casa_troca.png",height: 75,),
                        Row(
                          children: <Widget>[
                            Container(width:20),
                            Image.asset("lib/view/assets/fazendeiros/"+personagensTroca[2]+".png",height: 50,

                            ),
                          ],
                        )
                      ],
                    ),

                    onTap: (){
                      oferecerProdutoParaTroca(itensTroca[2],personagensTroca[2],context);
                    },),
                  Container(width: 60,),
                  GestureDetector(
                    //child: Image.asset("lib/view/assets/troca/casa_troca.png",height: 75,),
                    child: Stack(
                      children: <Widget>[
                        Image.asset("lib/view/assets/troca/casa_troca.png",height: 75,),
                        Row(
                          children: <Widget>[
                            Container(width:20),
                            Image.asset("lib/view/assets/fazendeiros/"+personagensTroca[3]+".png",height: 50,

                            ),
                          ],
                        )
                      ],
                    ),

                    onTap: (){
                      oferecerProdutoParaTroca(itensTroca[3],personagensTroca[3],context);
                    },)
                ],

              ),
            ],
          ),

        ],


      )

    );
  }


  Future<void> oferecerProdutoParaTroca(String produtoOfertado, String nomeImagem, BuildContext context) async {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;

    BubbleStyle styleSomebody = BubbleStyle(
      nip: BubbleNip.leftTop,
      color: Colors.white,
      //elevation: 1 * px,
      //margin: BubbleEdges.only(top: 8.0, right: 10.0),
      //alignment: Alignment.topLeft,
    );

    String textoBalaoDeFala = "Você gostaria de trocar algo comigo por um " + produtoOfertado;

    double tamanhoImagem =40;
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),
          content: Container(
            height: 200,
            child: Column(
              children: [
                Row(
                  children: [
                    ClipOval(
                        child: Image.asset("lib/view/assets/fazendeiros/"+nomeImagem+".png",
                          width: tamanhoImagem,
                        )
                    ),

                    Bubble(
                      style: styleSomebody,
                      nip: BubbleNip.leftBottom,
                      child:Text("Olá,"+fazendeiro.nome+"!"),
                    )
                  ],

                ),


                Container(
                  child: Row(
                    children: [
                      Container(width: tamanhoImagem,),
                      Bubble(
                        style: styleSomebody,
                        nip: BubbleNip.leftBottom,
                        child: AutoSizeText("quer " + produtoOfertado+"?", maxLines: 3,),
                      )
                    ],
                  ),
                ),


                Column(
                  children:[
                    ButtonTheme(
                      minWidth: 5,
                      buttonColor: Colors.lightGreen,
                      child: RaisedButton(
                        child: Text("Não, valeu!"),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 5,
                      buttonColor: Colors.lightGreen,
                      child: RaisedButton(
                        child: Text("Sim, por favor!"),
                        onPressed: (){
                          Navigator.of(context).pop();
                          pedirProdutoEmTroca(produtoOfertado,context);
                        },
                      ),
                    ),
                  ],
                )

              ],
            ),

          )

        );

      },
    );

  }



  Future<void> pedirProdutoEmTroca(String produtoOfertado,BuildContext context) async {

    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Qual desses produtos vocẽ gostaria de dar para ser trocado em troca do "+ produtoOfertado + "?",
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
          backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),
          content: Column(children: gerarListaProdutosDisponiveisParaTroca(context, produtoOfertado)),
        );

      },
    );

  }

  List<Widget> gerarListaProdutosDisponiveisParaTroca(BuildContext context,String produtoOfertado){
    List<Widget> listaItensASerTrocado= [];
    for (String produtoASerDado in fazendeiro.nomeProdutos){
      if(fazendeiro.colheitas.contains(produtoASerDado)) {
        listaItensASerTrocado.add(
            ButtonTheme(
              minWidth: 400,
              buttonColor: Colors.grey,
              child: RaisedButton(
                child: Row(
                  children: <Widget>[
                    Image.asset("lib/view/assets/produtos/" + produtoASerDado + ".png",height: 10,),
                    Text(produtoASerDado),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  showCupertinoModalPopup<void>(
                    context: context, builder: (BuildContext context) {
                      return   trocaConcluida(produtoASerDado, produtoOfertado, context);
                     });
                  },
              ),
            )
        );
      }

    }

    return listaItensASerTrocado;
  }



  Widget trocaConcluida(String produtoDado, String produtoRecebido,BuildContext context) {

    final controller= GetIt.I.get<FazendaController>();

    controller.retirarItem(produtoDado);


    if(produtoRecebido == "ração"){
      produtoRecebido = "racao";
      fazendeiro.racao++;
    }
    else if (fazendeiro.nomeProdutos.contains(produtoRecebido))
      controller.adicionarItem(produtoRecebido);
    else {
      fazendeiro.nomeProdutos.add(produtoRecebido);
      fazendeiro.quantidadeProdutos.add(1);
    }
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Image.asset("lib/view/assets/produtos/"+produtoDado+".png", width: 50,) ,
            Image.asset("lib/view/assets/seta.png",width: 50,),
            Image.asset("lib/view/assets/produtos/"+produtoRecebido+".png", width: 50,) ,

          ]

      ),
      actions: <Widget>[
        BotaoModalTroca(context),
      ],
    );
  }

  Widget BotaoModalTroca(BuildContext context) {
    final controller= GetIt.I.get<FazendaController>();


    return Container(
      child: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (controller.checarMissao(Missoes.realizarUmaTroca)){
              showCupertinoModalPopup<void>(
                  context: context, builder: (BuildContext context) {
                return   missaoConcluida(context);
              });
            }
            else{
              Navigator.of(context).pop();
            }
          },
          child: Text("ok", style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white))
    ));
  }


  Widget missaoConcluida(BuildContext context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),
      title:Text("Missão Concluída! Pegue sua nova missão!", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      content: Image.asset("lib/view/assets/barraPrincipal/missao.png",height: 100,),
      actions: <Widget>[
        botaoModal(context),
      ],
    );
  }

  Widget botaoModal(BuildContext context) {
    return Container(
      child: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          child: Text("ok", style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
    );
  }




}


