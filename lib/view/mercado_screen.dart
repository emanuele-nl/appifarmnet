import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_farm_net_new/model/fazendeiro_model.dart';

class MercadoScreen extends StatelessWidget {
  Fazendeiro fazendeiro = Fazendeiro();
  //List<String> itensMercado = ['biscoito','chocolate','racao','refrigerante','Suco de Laranja'];
  List<String> itensMercado = ['biscoito','chocolate','refrigerante','Suco de Laranja'];

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetsItensMercado = gerarImagensMercadorias(context);

    return new Scaffold(
        appBar: AppBar(backgroundColor: Color.fromRGBO(67, 44, 26, 1.0)),
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("lib/view/assets/mercado/fundo_mercado.jpeg"),
                  fit: BoxFit.cover,),
              ),
            ),
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("lib/view/assets/mercado/balcaomercado.png"),
                  fit: BoxFit.cover,),
              ),
            ),
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("lib/view/assets/mercado/prateleiramercado.png"),
                  fit: BoxFit.fitHeight),
              ),
            ),
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("lib/view/assets/mercado/comerciante.png"),
                    fit: BoxFit.fitWidth),
              ),
            ),

            new Column(
              children: <Widget>[
//                Flexible(
//                  flex: 5,
//                  child: Container(),
//                ),
                Flexible(
                  flex:6,
                  child: Row(
                    children: widgetsItensMercado,
                  ),
                ),
                Flexible(
                  flex:30,
                  child: Container(),
                )

              ],
            )
          ],
        )
    );
  }


  List<Widget> gerarImagensMercadorias(BuildContext context){
    List<Widget> listaFinal = [];

    for (String itens in itensMercado){
      listaFinal.add(
        GestureDetector(
          child: Image.asset("lib/view/assets/produtos/"+itens+".png"),
          onTap:(){

            showCupertinoModalPopup<void>(
                context: context,
                builder: (BuildContext context) {
                  return Questionamento("cenoura", itens, context);

                });


          },
        )

      );
    }
    return listaFinal;
  }



  Widget Questionamento(String produtoDado, String produtoRecebido,BuildContext context) {

    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      content: Text("Você gostaria de trocar "+produtoDado+ " por "+ produtoRecebido+"?"),
      actions: <Widget>[
        BotaoModalSim(produtoDado, produtoRecebido, context),
        BotaoModalNao(context)
      ],
    );
  }


  Widget trocaConcluida(String produtoDado, String produtoRecebido,BuildContext context) {

    fazendeiro.retirarItem(produtoDado);
    if (fazendeiro.nomeProdutos.contains(produtoRecebido))
      fazendeiro.adicionarItem(produtoRecebido);
    else {
      fazendeiro.nomeProdutos.add(produtoRecebido);
      fazendeiro.quantidadeProdutos.add(1);
    }
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
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

  Widget BotaoModalNao(BuildContext context) {
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


  Widget BotaoModalSim(String produtoDado,String produtoRecebido, BuildContext context) {
    return Container(
      child: FlatButton(
          onPressed: () {

            Navigator.of(context).pop();

            showCupertinoModalPopup<void>(
                context: context,
                builder: (BuildContext context) {
                  return trocaConcluida(produtoDado, produtoRecebido, context);
                });


          },
          child: Text("Sim", style: Theme
              .of(context)
              .textTheme
              .button,)),
    );
  }


}
