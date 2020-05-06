import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_farm_net_new/model/fazendeiro_model.dart';
import 'package:i_farm_net_new/view/fazenda/fazenda_screen.dart';
import 'package:i_farm_net_new/view/selecionar_fazendeiro_screen.dart';

class CarteirinhaScreen extends StatelessWidget {

  Fazendeiro fazendeiro = Fazendeiro();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
          body: new Stack(
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("lib/view/assets/fundo.png"), fit: BoxFit.cover,),
                ),
              ),
              new Column(
                children: <Widget>[
                  Container(height: 50,),
                  Flexible(
                    flex:   10,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(125, 125, 125, 0.5),
                        shape: BoxShape.rectangle,
                      ),
                      width: 250,
                      child: Text("Olá, "+fazendeiro.nome+"! \nVocê está entrando em um ambiente de econõmica solidária. Essa é a sua carteirinha CADSOL, um cadastro de todos que fazem parte da econômia solidária no país!"
                          ,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white,fontSize: 14),
                      )
                    ),
                  ),
                  Flexible(flex: 2,child: Container(),),
                  Flexible(
                    flex:   10,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                          shape: BoxShape.rectangle,
                        ),
                        width: 250,
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Image.asset("lib/view/assets/cadsol.png",height: 60,),
                                    Container(height: 30,),
                                  ],
                                ),
                                Container(width: 20,),
                                ClipOval(
                                  child: Image.asset(
                                      "lib/view/assets/fazendeiros/"+fazendeiro.nomeImagem+".png",
                                    height: 100,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(color: Colors.white),
                              height: 55,
                              child: Text("Empreendimentos Econômicos Solidários",
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            )


                          ],

                        )
                    ),
                  ),


                  Flexible(flex: 2,child: Container(),),

                  Flexible(
                    flex: 4,
                    child:GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FazendaScreen()));
                        },
                        child: Image.asset("lib/view/assets/botao-continuar.png",semanticLabel: "Continuar", width: 200,)
                    )
                    ,
                  ),
                  Container(height:10),


                ],
                //child: new Text("Hello background"),
              )
            ],
          )
      ),
    );
  }

}