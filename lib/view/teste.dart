import 'package:flutter/material.dart';
import 'package:i_farm_net_new/model/fazendeiro_model.dart';
import 'package:i_farm_net_new/view/selecionar_fazendeiro_screen.dart';

class TesteScreen extends StatelessWidget {

  Fazendeiro fazendeiro = Fazendeiro();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("lib/view/assets/fundo.png"), fit: BoxFit.cover,),
              ),
            ),
            new Column(
              children: <Widget>[
                Flexible(
                  flex:   10,
                  child: Container(),),
                Flexible(
                  flex: 4,
                  child:GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SelecionarFazendeiroScreen()));
                      },
                      child: Image.asset("lib/view/assets/fazendeiros/"+fazendeiro.nomeImagem+".png")
                  )
                  ,
                ),

              ],
              //child: new Text("Hello background"),
            )
          ],
        )
    );
  }

}