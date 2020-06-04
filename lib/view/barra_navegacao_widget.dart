import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:i_farm_net_new/controller/fazenda/fazenda_controller.dart';
import 'package:i_farm_net_new/model/fazendeiro_model.dart';
import 'package:i_farm_net_new/model/missoes_model.dart';
import 'package:i_farm_net_new/view/mercado_screen.dart';
import 'package:i_farm_net_new/view/saude_screen.dart';
import 'package:i_farm_net_new/view/troca_screen.dart';

class BarraNavegacao extends StatelessWidget implements PreferredSizeWidget {


  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight* 1.2);

  @override
  Widget build(BuildContext context) {
    final controller= GetIt.I.get<FazendaController>();
    return SafeArea(
        child: Container(
          color: Color.fromRGBO(8, 64, 4, 1.0),
          child:  Row(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: GestureDetector(
                  onTap:() {

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SaudeScreen()));

                  },
                  child: Semantics(
                      child: Image.asset("lib/view/assets/barraPrincipal/saude.png",
                      ),
                    hint: "saúde",
                    onTapHint: "para ir para a tela de saúde",

                  ),
                ),
              ),
              Flexible(
                flex:2,
                child:Container(),

              ),
              Flexible(
                flex:3,
                child: GestureDetector(
                  onTap: () {
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return atividadeFisica(context);
                      },);

                  },
                  child: Semantics(
                      child: Image.asset("lib/view/assets/barraPrincipal/exercicio.png", ),
                      label:"Atividade física",
                      onTapHint: "praticar exercício físico",

                  ),

                ),
              ),
              Flexible(
                flex:3,
                child: GestureDetector(
                  onTap:  (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TrocaScreen()));
                  },
                  child: Semantics(
                      child: Image.asset("lib/view/assets/barraPrincipal/troca.png", ),
                      label: "Troca",
                      onTapHint: "ir para a tela de troca",
                  ),
                ),
              ),
              Flexible(
                flex:3,
                child: GestureDetector(
                  onTap:(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MercadoScreen()));
                  },
                  child: Semantics(
                      child: Image.asset("lib/view/assets/barraPrincipal/mercado.png", ),
                      label:"Mercado",
                      onTapHint: "ir ao mercado",
                  ),
                ),
              ),
              Flexible(
                  flex:2,
                  child:Container(),
              ),
              Flexible(
                flex:3,
                child: GestureDetector(
                  onTap: () {
                    controller.fazendeiro.avisoNovaMissao=false;
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return missao(context);
                      },);

                  },
                  child: Semantics(
                      child: Image.asset("lib/view/assets/barraPrincipal/missao.png",),
                      label:"Missão",
                      onTapHint: "ver sua missão ",

                  ),
                ),
              )
            ],



          ),
        ));

  }


  Widget atividadeFisica(BuildContext context) {
    final controller= GetIt.I.get<FazendaController>();
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
                        Image.asset("lib/view/assets/atividadeFisica/bicicleta.png",height: 20,),
                        Text("  Pedalar", style: TextStyle(fontSize: 16),)
                      ],
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();

                      if(controller.fazendeiro.fome>10) {
                        controller.adicionarValorItemSaude("vigorFisico", 8);
                        controller.adicionarValorItemSaude("fome", -10);
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return confirmarPedalar(context);
                          },
                        );
                      }
                      else{
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return modalFome(context);
                          },
                        );
                      }
                    }

                ),
                RaisedButton(
                    child: Row(
                      children: <Widget>[
                        Image.asset("lib/view/assets/atividadeFisica/caminhar.png",height: 20
                        ),
                        Text("     Caminhar",style: TextStyle(fontSize: 16),)
                      ],
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();

                      if(controller.fazendeiro.fome>10) {
                        controller.adicionarValorItemSaude("vigorFisico", 8);
                        controller.adicionarValorItemSaude("fome", -10);
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return confirmarCaminhada(context);
                          },
                        );
                      }
                      else{
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return modalFome(context);
                          },
                        );
                      }
                    }

                ),

                RaisedButton(
                    child: Row(
                      children: <Widget>[
                        Image.asset("lib/view/assets/atividadeFisica/correr.png",height: 20),
                        Text("   Correr",style: TextStyle(fontSize: 16),)
                      ],
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();
                      if(controller.fazendeiro.fome>10) {
                        controller.adicionarValorItemSaude("vigorFisico", 8);
                        controller.adicionarValorItemSaude("fome", -10);
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return confirmarCorrida(context);
                          },
                        );
                      }
                      else{
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return modalFome(context);
                          },
                        );
                      }
                    }

                ),
                RaisedButton(
                    child: Row(
                      children: <Widget>[
                        Image.asset("lib/view/assets/atividadeFisica/nadar.png",height: 20,),
                        Text("    Nadar",style: TextStyle(fontSize: 16),)
                      ],
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();
                      if(controller.fazendeiro.fome>10) {
                        controller.adicionarValorItemSaude("vigorFisico", 8);
                        controller.adicionarValorItemSaude("fome", -10);
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return confirmarNatacao(context);
                          },
                        );
                      }
                      else{
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return modalFome(context);
                          },
                        );
                      }

                    }

                ),
              ]
          ),
        ));


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
        botaoModal(context, Missoes.nadar),
      ],
    );
  }

  Widget confirmarCorrida(BuildContext context) {
    Fazendeiro fazendeiro =Fazendeiro();
    return AlertDialog(
      backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),
      content: Container(
        height: 220,
        child: Column(
          children: <Widget>[
            Image.asset("lib/view/assets/atividadeFisica/corrida/corrida"+fazendeiro.nomeImagem+".png", height: 200,),
            Text("Você correu!!",textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
          ],
        ),
      ),
      actions: <Widget>[
        botaoModal(context,Missoes.correr),
      ],
    );
  }


  Widget confirmarCaminhada(BuildContext context) {
    Fazendeiro fazendeiro =Fazendeiro();
    return AlertDialog(
      backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),
      content: Container(
        height: 220,
        child: Column(
          children: <Widget>[
            Image.asset("lib/view/assets/atividadeFisica/caminhada/caminhada"+fazendeiro.nomeImagem+".png", height: 200,),
            Text("Você caminhou!!",textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
          ],
        ),
      ),
      actions: <Widget>[
        botaoModal(context,Missoes.caminhar),
      ],
    );
  }

  Widget confirmarPedalar(BuildContext context) {
    Fazendeiro fazendeiro =Fazendeiro();
    return AlertDialog(
      backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),
      content: Container(
        height: 220,
        child: Column(
          children: <Widget>[
            Image.asset("lib/view/assets/atividadeFisica/bicicleta/bicicleta"+fazendeiro.nomeImagem+".png", height: 200,),
            Text("Você pedalou!",textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
          ],
        ),
      ),
      actions: <Widget>[
        botaoModal(context,Missoes.pedalar),
      ],
    );
  }







  Widget missao(BuildContext context) {
    final controller= GetIt.I.get<FazendaController>();

    Fazendeiro fazendeiro = Fazendeiro();
    fazendeiro.missaoConcluida?fazendeiro.numeroMissao++:null;
    fazendeiro.missaoAtual = fazendeiro.missoes[fazendeiro.numeroMissao];
    fazendeiro.missaoConcluida? controller.adicionarValorItemSaude("experiencia", 10):null;
    fazendeiro.missaoConcluida =false;

    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      title:Text("Missão", textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),
      content:  Text(fazendeiro.missaoAtual,textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
      actions: <Widget>[
        botaoModal(context,""),
      ],
    );
  }


  Widget botaoModal(BuildContext context, String missao) {
    final controller= GetIt.I.get<FazendaController>();

    return Container(
      child: FlatButton(
          onPressed: () {
            if ( controller.checarMissao(missao)){
              Navigator.of(context).pop();

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
          child: Text("OK",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
    );
  }


  Widget modalFome(BuildContext context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),
      title:Text("Você está com fome! coma um item do celeiro para aumentar sua nutrição", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      content: Image.asset("lib/view/assets/celeiro.png",height: 100, excludeFromSemantics: true,),
      actions: <Widget>[
        botaoModal(context,""),
      ],
    );
  }




  Widget missaoConcluida(BuildContext context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),
      title:Text("Missão Concluída! Pegue sua nova missão!", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),

      actions: <Widget>[
        botaoModal(context,""),
      ],
    );
  }




}

