import 'package:auto_size_text/auto_size_text.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_farm_net_new/model/fazendeiro_model.dart';
import 'package:i_farm_net_new/model/missoes_model.dart';

class TrocaScreen extends StatelessWidget {
  Fazendeiro fazendeiro = Fazendeiro();

  @override
  Widget build(BuildContext context) {
    List<String> cultivosParaTroca = fazendeiro.colheitas;

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
                    child: Image.asset("lib/view/assets/troca/casa_troca.png",height: 75,),
                    onTap: (){
                      oferecerProdutoParaTroca("alface",context);
                      },),
                  Container(width: 60,),
                  GestureDetector(
                    child: Image.asset("lib/view/assets/troca/casa_troca.png",height: 75,),
                    onTap: (){
                      oferecerProdutoParaTroca("tomate",context);
                    },)
                ],
              ),
              Container(height: 60),
              Row(
                children: [
                  GestureDetector(
                    child: Image.asset("lib/view/assets/troca/casa_troca.png",height: 75,),
                    onTap: (){
                      oferecerProdutoParaTroca("morango",context);
                    },),
                  Container(width: 60,),
                  GestureDetector(
                    child: Image.asset("lib/view/assets/troca/casa_troca.png",height: 75,),
                    onTap: (){
                      oferecerProdutoParaTroca("cenoura",context);
                    },)
                ],

              ),
            ],
          ),

        ],


      )

    );
  }


  Future<void> oferecerProdutoParaTroca(String produtoOfertado,BuildContext context) async {
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
            child: Column(
              children: [
                Row(
                  children: [
                    ClipOval(
                        child: Image.asset("lib/view/assets/fazendeiros/"+fazendeiro.nomeImagem+".png",
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

    fazendeiro.retirarItem(produtoDado);
    if (fazendeiro.nomeProdutos.contains(produtoRecebido))
      fazendeiro.adicionarItem(produtoRecebido);
    else {
      fazendeiro.nomeProdutos.add(produtoRecebido);
      fazendeiro.quantidadeProdutos.add(1);
    }
    fazendeiro.checarMissao(Missoes.realizarUmaTroca);
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


}


