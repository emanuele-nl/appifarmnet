import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_farm_net_new/model/fazendeiro_model.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SaudeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Fazendeiro fazendeiro = Fazendeiro();
    return Scaffold(
      backgroundColor: Color.fromRGBO(49, 122, 45, 0.7),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(49, 122, 45, 0.7),
        actions: [Semantics(
          label: "carteirinha",
          child: IconButton(
            icon:  Icon(Icons.assignment_ind, color: Colors.white,),
            onPressed:(){
              showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return carteirinha(context);
                  });


              } ,
          ),
        )],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset("lib/view/assets/fazendeiros/"+fazendeiro.nomeImagem+".png", width: 100,excludeFromSemantics: true,),
            Semantics(
                excludeSemantics: true,
                child: Text(fazendeiro.nome == null? "nulo": fazendeiro.nome,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
            Semantics(
              label:"Nutrição"+fazendeiro.fome.toString()+"de cem",
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: new LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 20,
                  percent: fazendeiro.fome/100,
                  center: Text("Nutrição"),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.greenAccent,
                ),
              ),
            ),
            Semantics(
              label:"Vigor físico"+fazendeiro.vigorFisico.toString()+"de cem",

              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: new LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: fazendeiro.vigorFisico/100,
                  center: Text("Vigor Fisico"),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.redAccent,
                ),
              ),
            ),
            Semantics(
              label:"Experiencia"+fazendeiro.experiencia.toString()+"de cem",
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: new LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: fazendeiro.experiencia/100,
                  center: Text("Experiência"),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.orangeAccent,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget carteirinha (BuildContext context){
    Fazendeiro fazendeiro = Fazendeiro();
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      //backgroundColor: Colors.grey ,
      content: Semantics(
        label:" Sua Carteirinha",
        child: Container(
          height: 220,
          child: Column(
            children: <Widget>[
              Text("Carteirinha CADSOL"),
              Container(
                color: Colors.grey,
                height: 200,
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Hero(
                                tag:'fazendeiro',
                                child: Image.asset("lib/view/assets/cadsol.png",height: 60,)
                            ),
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

                ),
              ),
            ],
          ),
        ),
      ),
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

          },
          child: Text("OK")),
    );
  }



}



