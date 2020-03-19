import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_farm_net_new/model/fazendeiro_model.dart';

class TrocaScreen extends StatelessWidget {
  Fazendeiro fazendeiro = Fazendeiro();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.green,
      body: GestureDetector(
      child: Image.asset("lib/view/assets/seta.png",height: 60,),
      onTap: (){
        oferecerProdutoParaTroca(context);
       },)
    );
  }


  Future<void> oferecerProdutoParaTroca(BuildContext context) async {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
            message: Text("Qual desses produtos vocẽ gostaria de dar para ser trocado?"),
            actions: gerarListaProdutosDisponiveisParaTroca(context)
          //cancelButton: ,
        );
      },
    );
  }

  List<Widget> gerarListaProdutosDisponiveisParaTroca(BuildContext context){
    List<Widget> listaItensASerTrocado= [];
    for (String produto in fazendeiro.nomeProdutos){
      listaItensASerTrocado.add(CupertinoActionSheetAction(
        child: Text(produto),
        onPressed: () {
          Navigator.of(context).pop();
          _sugerirProdutoAserTrocado(produto,context);
        },
      )
      );

    }
    return listaItensASerTrocado;
  }

  Future<void> _sugerirProdutoAserTrocado(String produtoAserTrocado,BuildContext context) async {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          //title: Text('Favorite Dessert'),
            message: Text("Qual desses produtos vocẽ gostaria de adquirir?"),
            actions: gerarListaProdutosASerTrocado(produtoAserTrocado,context)
          //cancelButton: ,
        );
      },
    );
  }


  List<Widget> gerarListaProdutosASerTrocado(String produtoAserDado,BuildContext context){

    List<Widget> listaItensASerTrocado= [];
    for (String produto in fazendeiro.colheitas){
      listaItensASerTrocado.add(CupertinoActionSheetAction(
        child: Text(produto),
        onPressed: () {
          trocaConcluida(produtoAserDado,produto,context);
          Navigator.of(context).pop();
        },
      )
      );

    }
    return listaItensASerTrocado;
  }


  Widget trocaConcluida(String produtoDado, String produtoRecebido,BuildContext context) {

    fazendeiro.retirarItem(produtoDado);
    if (fazendeiro.nomeProdutos.contains(produtoRecebido))
      fazendeiro.adicionarItem(produtoDado);
    else {
      fazendeiro.nomeProdutos.add(produtoRecebido);
      fazendeiro.quantidadeProdutos.add(1);
    }
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      content: Row(
          children:[
            Image.asset("lib/view/assets/produtos/"+produtoDado+".png", width: 50,) ,
            Image.asset("lib/view/assets/seta.png"),
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


