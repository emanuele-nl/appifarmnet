import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:i_farm_net_new/controller/fazenda/fazenda_controller.dart';
import 'package:i_farm_net_new/view/pergunta_screen.dart';


class FazendaScreen extends StatefulWidget {

  @override
  _FazendaScreenState createState() => _FazendaScreenState();

}

class _FazendaScreenState extends State<FazendaScreen> {
  final controller= FazendaController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body:
      Center(
        child:
            Column(
              children:[
               Observer(builder: (_){return Image.asset("lib/view/assets/plantacao/"+controller.estadoAtual+".png");}),
               RaisedButton(
                    onPressed:(){controller.evoluirTerreno();},
                    child: Observer(builder:(_){return Text(controller.estadoAtual);})),
               RaisedButton(
                onPressed:() {
               Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => PerguntaScreen()));
                },
                child: Text("Pergunta"),

                ),


              ]
              )
      )
        );

  }


}


