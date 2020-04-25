import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avisos {

  final String missaoconcluida = "missao_concluida";


  Widget aviso (String aviso, BuildContext context){
    showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) {
      if (aviso == missaoconcluida){
        return missaoConcluida(context);
      }
    });

  }


  Widget missaoConcluida(BuildContext context){
    return AlertDialog(
      content: Text("Missao Cumprida",textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),

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
