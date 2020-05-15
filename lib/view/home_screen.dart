import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_farm_net_new/view/selecionar_fazendeiro_screen.dart';
import 'package:i_farm_net_new/view/video_tutorial_screen.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("lib/view/assets/telainicial.png"), fit: BoxFit.cover,),
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
                    child: Image.asset("lib/view/assets/botao-iniciar.png",semanticLabel: "iniciar", width: 200,)
                  )
                  ,
                ),
                Container(height:10),
                Flexible(
                  flex: 4,
                  child:GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup<void>(
                            context: context, builder: (BuildContext context) {
                          return   avisoConsumoDados(context);
                        });

                      },
                      child: Image.asset("lib/view/assets/botao-tutorial.png",semanticLabel: "Tutorial",width: 200,)
                  )
                  ,
                ),

              ],
            )
          ],
        )
    );
  }


  Widget avisoConsumoDados(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),
      content:Text("Atenção \n O tutorial pode consumir seu pacote de dados",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      actions: <Widget>[
        botaoModalCancelar(context),
        botaoModalOk(context),

      ],
    );
  }

  Widget botaoModalCancelar(BuildContext context) {
    return Container(
      child: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancelar", style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
    );
  }

  Widget botaoModalOk(BuildContext context) {
    return Container(
      child: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideoTutorialScreen()));
          },
          child: Text("Continuar", style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
    );
  }









}