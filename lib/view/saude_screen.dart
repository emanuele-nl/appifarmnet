import 'package:flutter/material.dart';
import 'package:i_farm_net_new/model/fazendeiro_model.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SaudeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Fazendeiro fazendeiro = Fazendeiro();
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset("lib/view/assets/fazendeiros/"+fazendeiro.nomeImagem+".png", width: 100,),
            Text(fazendeiro.nome == null? "nulo": fazendeiro.nome),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: fazendeiro.fome/100,
                center: Text("Nutrição"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ),
            ),
            Padding(
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
            Padding(
              padding: EdgeInsets.all(15.0),
              child: new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: fazendeiro.sabedoria/100,
                center: Text("Sabedoria"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.orangeAccent,
              ),
            )

          ],
        ),
      ),
    );
  }

}



