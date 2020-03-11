class Pergunta {
  String questao;
  List<String> alternativas;
  String respostaCorreta;
  String assuntoPergunta;
  bool perguntaRespondida = false;

  Pergunta.fromJSON(Map<String, dynamic> jsonPergunta ){
    questao=jsonPergunta["questao"];
    alternativas=jsonPergunta["alternativas"];
    respostaCorreta=jsonPergunta["respostaCorreta"];
    assuntoPergunta=jsonPergunta["assuntoPergunta"];
  }

}

class Perguntas {
  int questoesRespondidas=0;
  List<dynamic> listaPerguntas = [];
  Map<String, Perguntas> perguntasJson = {};



  Perguntas.fromJSON(Map<String, dynamic> jsonPerguntas){

    Map<String, dynamic> _perguntas = jsonPerguntas;

    for (Map<String,Object> perguntaSelecionada in jsonPerguntas["perguntas"]) {

      Pergunta pergunta = Pergunta.fromJSON(perguntaSelecionada);
      listaPerguntas.add(pergunta);
    }


    }


}