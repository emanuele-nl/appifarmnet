class Pergunta {
  String questao;
  List<String> alternativas;
  String respostaCorreta;
  String assuntoPergunta;

  Pergunta.fromJSON(Map<String, dynamic> jsonPergunta ){
    questao=jsonPergunta["questao"];
    alternativas=jsonPergunta["alternativas"];
    respostaCorreta=jsonPergunta["respostaCorreta"];
    assuntoPergunta=jsonPergunta["assuntoPergunta"];
  }

  
}