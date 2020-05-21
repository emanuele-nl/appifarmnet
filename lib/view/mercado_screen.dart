import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:i_farm_net_new/controller/fazenda/fazenda_controller.dart';
import 'package:i_farm_net_new/model/fazendeiro_model.dart';
import 'package:i_farm_net_new/model/missoes_model.dart';

class MercadoScreen extends StatelessWidget {
  Fazendeiro fazendeiro = Fazendeiro();
  //List<String> itensMercado = ['biscoito','chocolate','racao','refrigerante','Suco de Laranja'];
  List<String> itensMercado = ['biscoito','chocolate','refrigerante','Suco de Laranja'];

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetsItensMercado = gerarImagensMercadorias(context);

    return new Scaffold(
        appBar: AppBar(backgroundColor: Color.fromRGBO(67, 44, 26, 1.0)),
        body: SafeArea(
          child: new Stack(
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("lib/view/assets/mercado/fundo_mercado.jpeg"),
                    fit: BoxFit.cover,),
                ),
              ),
              Semantics(
                excludeSemantics: true,
                child: new Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage("lib/view/assets/mercado/balcaomercado.png"),
                      fit: BoxFit.cover,),
                  ),
                ),
              ),
              Semantics(
                excludeSemantics: true,
                child: new Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage("lib/view/assets/mercado/prateleiramercado.png"),
                      fit: BoxFit.fitHeight),
                  ),
                ),
              ),
              new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage("lib/view/assets/mercado/comerciante.png", ),
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
          ),
        )
    );
  }


  List<Widget> gerarImagensMercadorias(BuildContext context){
    List<Widget> listaFinal = [];


    for (String itens in itensMercado){
      listaFinal.add(
        Flexible(
          flex: 1,
          child: GestureDetector(
            child: Image.asset("lib/view/assets/produtos/"+itens+".png", semanticLabel: itens,),
            onTap:(){
              final controller= GetIt.I.get<FazendaController>();
              showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) {
                    if (controller.fazendeiro.leite <=0)
                      return modalSemLeite(context);
                    else
                      return Questionamento("leite", itens, context);

                  });


            },
          ),
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


  Widget modalSemLeite(BuildContext context) {

    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      content: Container(
        height: 150,
        child: Column(
          children: <Widget>[
            Text("Você não possui leite no seu celeiro. Produza leite para que você possa trocar itens do mercado"),
            Image.asset("lib/view/assets/animal/vaca.png",height: 60,excludeFromSemantics: true,),
          ],
        ),
      ),
      actions: <Widget>[
        BotaoModal(context)
      ],
    );
  }


  Widget trocaConcluida(String produtoDado, String produtoRecebido,BuildContext context) {
    final controller= GetIt.I.get<FazendaController>();
    controller.utilizarLeite();
    if (fazendeiro.nomeProdutos.contains(produtoRecebido))
      controller.adicionarItem(produtoRecebido);
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
        BotaoModalConcluido(context),
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


  Widget BotaoModalConcluido(BuildContext context) {
    final controller= GetIt.I.get<FazendaController>();

    return Container(
      child: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            if ( controller.checarMissao(Missoes.comprarItemMercado)){
              showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return missaoConcluida(context);
                  });
            }

            else{
              Navigator.of(context).pop();
            }

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

  Widget missaoConcluida(BuildContext context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
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
          child: Text("Sim", style: Theme
          .of(context)
          .textTheme
          .button,)
    ));
  }


}
