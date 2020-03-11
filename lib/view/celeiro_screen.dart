//import 'package:flutter/material.dart';
//import 'package:i_farm_net_new/model/celeiro_model.dart';
//
//class CeleiroScreen extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//
//    Celeiro celeiro = Celeiro();
//
//    return Scaffold(
//      body: SafeArea(
//        child: Column(
//          //children: gerarWidgetsItensCeleiro(produtos, quantidades) +
//          //[RaisedButton(child:Text("voltar"),onPressed:() {Navigator.of(context).pop();})],
//
//        ),
//
//      ),
//
//    );
//
//  }
//
//
//
//  List<Widget> gerarWidgetsItensCeleiro(List<String> produtos, List<int> quantidades){
//    List<Widget> itensLista= []  ;
//    int i=0;
//    for (String itens in produtos){
//      itensLista.add(ListTile(
//        leading: Image.asset("lib/view/assets/produtos/"+itens+".png", width: 50,),
//        trailing: Text(quantidades[i].toString()),
//        title: Text(itens),
//
//      ));
//      i++;
//    }
//
//
//    return itensLista;
//  }
//
//  void adicionarProduto (String nomeProduto){
//    Celeiro celeiro;
//    celeiro.nomeProdutos.add(nomeProduto);
//    celeiro.quantidadeProdutos.add(1);
//  }
//
//
//
//  Widget celeiro(BuildContext context) {
//
//    final tamanhoIcone = MediaQuery
//        .of(context)
//        .size
//        .width * 0.2
//
//    return AlertDialog(
//      shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(12)),
//      contentPadding: EdgeInsets.only(
//          left: MediaQuery.of(context).size.height * 0.04,
//          right: MediaQuery.of(context).size.height * 0.04,
//          top: MediaQuery.of(context).size.height * 0.01,
//          bottom: MediaQuery.of(context).size.height * 0.01),
//      title:Text("Celeiro", textAlign: TextAlign.start,),
//      content: Column(
//        children: gerarWidgetsItensCeleiro(produtos, quantidades),
//      ),
//      actions: <Widget>[
//        BotaoModal(context),
//      ],
//    );
//  }
//
//
//
//
//  Widget BotaoModal(BuildContext context) {
//    return Container(
//      child: FlatButton(
//          onPressed: () {
//    Navigator.of(context).pop();
//    }, child: Text("OK", style: Theme.of(context).textTheme.button,)),
//    );
//
//
//
//
//
//
//
//
//  }
