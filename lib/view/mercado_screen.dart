import 'package:flutter/material.dart';
import 'package:i_farm_net_new/model/fazendeiro_model.dart';

class SaudeScreen extends StatelessWidget {
  Fazendeiro fazendeiro =Fazendeiro();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[


        ],

      )

    );
  }

  List<Widget> listaImagensMercado(){
    List<Widget> retorno =[];
    for (String item in fazendeiro.itensMercado){
      retorno.add(
        GestureDetector(
          onTap:() {


          },
          child:Image.asset("lib/view/assets/produtos/"+item)
        )
      );
    }

  }

}