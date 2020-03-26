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
          //onTap: ,
          child: Image.asset("lib/view/assets/barraPrincipal/tresPontos.png", width: 50,),
        )
      ],

    );
  }


  Widget atividadeFisica(BuildContext context) {
    Fazendeiro fazendeiro = Fazendeiro();
    return AlertDialog(
      title:Text("Atividade Física", textAlign: TextAlign.start,),
      content: Column(
        children: <Widget>[
          Container(
            height: 70,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
                fazendeiro.adicionarValorItemSaude("vigorFisico", 8);
                showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return confirmarAtividadeFisica(context);
                  },);
              },
              child: Text("Nadar"),
            ),
          ),
          Container(
            height: 70,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
                fazendeiro.adicionarValorItemSaude("vigorFisico", 8);
                showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return confirmarAtividadeFisica(context);
                  },);
              },
              child: Text("Correr"),
            ),
          ),
          Container(
            height: 70,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
                fazendeiro.adicionarValorItemSaude("vigorFisico", 8);
                showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return confirmarAtividadeFisica(context);
                  },);
              },
              child: Text("Caminhar"),
            ),
          ),
        ],

      ),
      actions: <Widget>[
        BotaoModal(context),
      ],
    );
  }

  Widget confirmarAtividadeFisica(BuildContext context) {
    return AlertDialog(
      content: Text("Vocẽ praticou atividade Física!"),
      actions: <Widget>[BotaoModal(context)],
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

