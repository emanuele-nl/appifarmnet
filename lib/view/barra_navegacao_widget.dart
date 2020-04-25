import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_farm_net_new/model/fazendeiro_model.dart';
import 'package:i_farm_net_new/view/mercado_screen.dart';
import 'package:i_farm_net_new/view/saude_screen.dart';
import 'package:i_farm_net_new/view/troca_screen.dart';

class BarraNavegacao extends StatelessWidget implements PreferredSizeWidget {


  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 0.9);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 100.0,
      backgroundColor: Color.fromRGBO(33, 82, 30, 0.1),
      actions: <Widget>[
        GestureDetector(
          onTap:() {

            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SaudeScreen()));

          },
          child: Image.asset("lib/view/assets/barraPrincipal/saude.png", width: 50,),
        ),
        Container(width: 30),
        GestureDetector(
          onTap: () {
            showCupertinoModalPopup<void>(
            context: context,
            builder: (BuildContext context) {
            return atividadeFisica(context);
            },);

          },
          child: Image.asset("lib/view/assets/barraPrincipal/exercicio.png", width: 50,),
        ),
        GestureDetector(
          onTap:  (){
              Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => TrocaScreen()));
            },
          child: Image.asset("lib/view/assets/barraPrincipal/troca.png", width: 50,),
        ),
        GestureDetector(
          onTap:(){
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MercadoScreen()));
          },
          child: Image.asset("lib/view/assets/barraPrincipal/mercado.png", width: 50,),
        ),
        Container(width: 30),
        GestureDetector(
          onTap: () {
            showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) {
                return missao(context);
              },);

          },
          child: Image.asset("lib/view/assets/barraPrincipal/tresPontos.png", width: 50,),
        )
      ],

    );
  }


//  Widget atividadeFisica(BuildContext context) {
//    Fazendeiro fazendeiro = Fazendeiro();
//    return AlertDialog(
//      title:Text("Atividade Física", textAlign: TextAlign.start,),
//      content: Column(
//        children: <Widget>[
//          Container(
//            height: 70,
//            child: GestureDetector(
//              onTap: (){
//                Navigator.of(context).pop();
//                fazendeiro.adicionarValorItemSaude("vigorFisico", 8);
//                showCupertinoModalPopup<void>(
//                  context: context,
//                  builder: (BuildContext context) {
//                    return confirmarAtividadeFisica(context);
//                  },);
//              },
//              child: Text("Nadar"),
//            ),
//          ),
//          Container(
//            height: 70,
//            child: GestureDetector(
//              onTap: (){
//                Navigator.of(context).pop();
//                fazendeiro.adicionarValorItemSaude("vigorFisico", 8);
//                showCupertinoModalPopup<void>(
//                  context: context,
//                  builder: (BuildContext context) {
//                    return confirmarAtividadeFisica(context);
//                  },);
//              },
//              child: Text("Correr"),
//            ),
//          ),
//          Container(
//            height: 70,
//            child: GestureDetector(
//              onTap: (){
//                Navigator.of(context).pop();
//                fazendeiro.adicionarValorItemSaude("vigorFisico", 8);
//                showCupertinoModalPopup<void>(
//                  context: context,
//                  builder: (BuildContext context) {
//                    return confirmarAtividadeFisica(context);
//                  },);
//              },
//              child: Text("Caminhar"),
//            ),
//          ),
//        ],
//
//      ),
//      actions: <Widget>[
//        BotaoModal(context),
//      ],
//    );
//  }

  Widget atividadeFisica(BuildContext context) {
    Fazendeiro fazendeiro = Fazendeiro();


    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      title:Text("Atividade Física", textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),
      content: Container(
        height: 200,
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Row(
                children: <Widget>[
                  Image.asset("lib/view/assets/atividadeFisica/caminhar.png",height: 20
                  ),
                  Text("Caminhar",)
                ],
              ),
              onPressed: (){
                Navigator.of(context).pop();
                fazendeiro.adicionarValorItemSaude("vigorFisico", 8);
                showCupertinoModalPopup<void>(
                context: context,
                builder: (BuildContext context) {
                return confirmarAtividadeFisica(context);
                },
                );
                }

          ),

            RaisedButton(
                child: Row(
                  children: <Widget>[
                    Image.asset("lib/view/assets/atividadeFisica/correr.png",height: 20),
                    Text("Correr",)
                  ],
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                  fazendeiro.adicionarValorItemSaude("vigorFisico", 8);
                  showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return confirmarAtividadeFisica(context);
                    },
                  );
                }

            ),
            RaisedButton(
                child: Row(
                  children: <Widget>[
                    Image.asset("lib/view/assets/atividadeFisica/nadar.png",height: 20,),
                    Text("Nadar",)
                  ],
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                  fazendeiro.adicionarValorItemSaude("vigorFisico", 8);
                  showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return confirmarNatacao(context);
                    },
                  );
                }

            ),
          ]
        ),
      ));


  }



  Widget confirmarAtividadeFisica(BuildContext context) {
    return AlertDialog(
      content: Text("Você praticou atividade Física!",textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),

      actions: <Widget>[
        BotaoModal(context),
    ],
    );
  }

  Widget confirmarNatacao(BuildContext context) {
    Fazendeiro fazendeiro =Fazendeiro();
    return AlertDialog(
      backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),
      content: Container(
        height: 220,
        child: Column(
          children: <Widget>[
            Image.asset("lib/view/assets/atividadeFisica/natacao/natacao"+fazendeiro.nomeImagem+".png", height: 200,),
            Text("Você nadou!",textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
          ],
        ),
      ),
      actions: <Widget>[
        BotaoModal(context),
      ],
    );
  }





//  Widget missao(BuildContext context){
//    Fazendeiro fazendeiro =Fazendeiro();
//    return AlertDialog(
//        shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(12)),
//      title:Text("Missão Atual", textAlign: TextAlign.center,),
//      content: Column(
//        children: <Widget>[
//          fazendeiro.missaoConcluida?Text("Missao concluída",style: TextStyle(color: Colors.green),):Text("Missão em andamento",style: TextStyle(color: Colors.yellowAccent),),
//          Text(fazendeiro.missaAtual),
//          fazendeiro.missaoConcluida? RaisedButton(
//            child: Text("Requerer nova Missão"),
//            onPressed: () {
//              Navigator.of(context).pop();
//              fazendeiro.numeroMissao++;
//              fazendeiro.missaAtual = fazendeiro.missoes[fazendeiro.numeroMissao];
//              fazendeiro.missaoConcluida =false;
//              missao(context);
//            }
//
//
//          ):RaisedButton(
//            child: Text("Fechar"),
//            onPressed: (){
//              Navigator.of(context).pop();
//            },
//          )]));
//
//}

  Widget missao(BuildContext context) {
    Fazendeiro fazendeiro = Fazendeiro();
    fazendeiro.missaoConcluida?fazendeiro.numeroMissao++:null;
    fazendeiro.missaAtual = fazendeiro.missoes[fazendeiro.numeroMissao];
    fazendeiro.missaoConcluida? fazendeiro.adicionarValorItemSaude("experiencia", 10):null;
    fazendeiro.missaoConcluida =false;

    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      title:Text("Missão", textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),
      content:  Text(fazendeiro.missaAtual,textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
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
          child: Text("OK",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
    );
  }

  


}

