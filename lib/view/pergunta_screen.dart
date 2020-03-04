import 'package:flutter/material.dart';
import 'package:i_farm_net_new/controller/pergunta/pergunta_controller.dart';
import 'package:i_farm_net_new/model/fazendeiro_model.dart';
import 'package:i_farm_net_new/model/pergunta_model.dart';
import 'package:i_farm_net_new/view/selecionar_fazendeiro_screen.dart';

class PerguntaScreen extends StatelessWidget {
  final jsonPergunta = {
    "questao": "teste3",
    "alternativas": [
      "resposta correta",
      "resposta errada",
      "resposta errada",
      "resposta errada"
    ],
    "respostaCorreta": "resposta correta",
    "assuntoPergunta": "teste de questao 3"
  };
  PerguntaController controller = PerguntaController();
  @override
  Widget build(BuildContext context) {
    Pergunta pergunta = Pergunta.fromJSON(jsonPergunta);
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
                Flexible(child: Container(),flex:24),
                Flexible(
                  flex:   10,
                  child: Container(
                    child: Text(pergunta.questao,),
                  ),),
                Flexible(
                  flex: 20,
                  child: Container(
                    child: Column(
                      children: List.generate(pergunta.alternativas.length,(index){
                        return RaisedButton(
                              onPressed: controller.verificarResposta(pergunta.respostaCorreta),
                              child: Center(child: Text(pergunta.alternativas[index]))
                        );
                      },
                    ),
                )
             )
                )

              ],
             ) //child: new Text("Hello background"),

          ],
        )
    );
  }

}
