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
  final jsonPerguntas = {
    "perguntas": [{
      "questao": " Qual a principal característica da economia solidária ?",
      "alternativas": [
        "Quem possuí mais recurso financeiro é a pessoa que deve coordenar o grupo",
        "Uma pessoa deve ser responsável por coordenar o grupo e por esse motivo ela é a pessoa que deve ganhar mais",
        "Igualdade entre as pessoas participantes do grupo",
        "resposta errada"
      ],
      "respostaCorreta": " Igualdade entre as pessoas participantes do grupo",
      "assuntoPergunta": "economia solidária"
    }, {
      "questao": "Quem é o líder dentro do modelo de economia solidária ?",
      "alternativas": [
        "A pessoa que teve o maior lucro no grupo deve liderar o grupo",
        "Ninguém, no modelo de economia solidária todos tem a mesma importância e estão no mesmo nível. Todos podem opinar nas decisões tomadas para o grupo",
        " Quem irá trabalhar mais horas deve liderar o grupo",
        "O líder do grupo é a pessoa cujo a família possuí mais recursos financeiros"
      ],
      "respostaCorreta": "Ninguém, no modelo de economia solidária todos tem a mesma importância e estão no mesmo nível. Todos podem opinar nas decisões tomadas para o grupo",
      "assuntoPergunta": "economia solidária"
    }, {
      "questao": "Quais pilares da economia solidária ?",
      "alternativas": [
        "solidariedade - igualdade -  cooperação",
        "lucro - hierarquia - disputa comercial",
        "solidariedade - igualdade - disputa comercial",
        "lucro - igualdade  - disputa comercial"
      ],
      "respostaCorreta": "solidariedade - igualdade -  cooperação",
      "assuntoPergunta": "economia solidária"
    }, {
      "questao": " Quais os alimentos possuem vitamina A ?",
      "alternativas": [
        "Semente de girassol",
        "Cenoura",
        "Avelã",
        "Castanha"
      ],
      "respostaCorreta": "Cenoura",
      "assuntoPergunta": "saúde do trabalhador"
    }, {
      "questao": "Qual a importância da vitamina A para a saúde ?",
      "alternativas": [
        "Participa da absorção e utilização de dois sais importantes: o cálcio e o fósforo.",
        "Atua como antioxidante.",
        "Apresenta importante papel na visão, atua na manutenção de tecidos epiteliais e imunidade",
        "Possui importante papel na coagulação sanguínea."
      ],
      "respostaCorreta": "Apresenta importante papel na visão, atua na manutenção de tecidos epiteliais e imunidade",
      "assuntoPergunta": "saúde do trabalhador"
    }, {
      "questao": "Quais alimentos possuem uma maior concentração de vitamina D",
      "alternativas": [
        "Hortaliças de coloração verde-escuro; vegetais de coloração alaranjada",
        "Óleos vegetais; nozes; e sementes.",
        "Hortaliças verdes; também é produzida por bactérias presentes no intestino.",
        "Leite e derivados; salmão; e gemas de ovo."
      ],
      "respostaCorreta": "Leite e derivados; salmão; e gemas de ovo.",
      "assuntoPergunta": "saúde do trabalhador"
    }, {
      "questao": "Qual a importância da vitamina D ?",
      "alternativas": [
        "Apresenta importante papel na visão, atua na manutenção de tecidos epiteliais e imunidade.",
        "Atua como antioxidante",
        "Participa da absorção e utilização de dois sais importantes: o cálcio e o fósforo",
        "Possui importante papel na coagulação sanguínea."
      ],
      "respostaCorreta": "Participa da absorção e utilização de dois sais importantes: o cálcio e o fósforo",
      "assuntoPergunta": "saúde do trabalhador"
    }, {
      "questao": "O que a falta de vitamina A causa ao organismo ?",
      "alternativas": [
        "Raquitismo (problema de saúde que desencadeia amolecimento e fragilidade de ossos e, em crianças, causa deformações ósseas) e osteoporose",
        "Problemas no sistema nervoso",
        "Alterações na coagulação sanguínea",
        "Problemas de visão, alterações na pele e alteração na imunidade"
      ],
      "respostaCorreta": "Problemas de visão, alterações na pele e alteração na imunidade",
      "assuntoPergunta": "saúde do trabalhador"
    }, {
      "questao": " O que a falta de vitamina D causa ao organismo ?",
      "alternativas": [
        "Formigamentos, dormência e fadiga",
        "Raquitismo (problema de saúde que desencadeia amolecimento e fragilidade de ossos e, em crianças, causa deformações ósseas) e osteoporose",
        "Lesões gastrointestinais e na pele, e confusão mental",
        "Lesões na pele"
      ],
      "respostaCorreta": "Raquitismo (problema de saúde que desencadeia amolecimento e fragilidade de ossos e, em crianças, causa deformações ósseas) e osteoporose",
      "assuntoPergunta": "saúde do trabalhador"
    }, {
      "questao": "O que é desenvolvimento sustentável ?",
      "alternativas": [
        "Desenvolvimento sustentável significa suprir as necessidades dos indivíduos sem se importar com os efeitos que isso possa causar",
        "Desenvolvimento sustentável significa não utilizar itens de plástico",
        "Desenvolvimento sustentável significa suprir as necessidades do presente sem afetar a habilidade das gerações futuras de suprirem as próprias necessidades",
        "Desenvolvimento sustentável significa explorar o máximo que for possível"
      ],
      "respostaCorreta": "Desenvolvimento sustentável significa suprir as necessidades do presente sem afetar a habilidade das gerações futuras de suprirem as próprias necessidades",
      "assuntoPergunta": "sustentabilidade"
    }, {
      "questao": "Quanto tempo o tomate leva para poder ser cultivado ?",
      "alternativas": [
        "entre 90 e 110 dias",
        "entre 95 e 115 dias",
        "entre 200 e 250 dias",
        "entre 15 e 30 dias"
      ],
      "respostaCorreta": "entre 90 e 110 dias",
      "assuntoPergunta": "cultivo"
    }, {
      "questao": "Quanto tempo a batata leva para poder ser cultivada ?",
      "alternativas": [
        "entre 90 dias a 280 dias",
        "entre 15 dias a 20 dias",
        "entre 75 dias a 180 dias",
        "entre 65 dias a 700 dias"
      ],
      "respostaCorreta": "75 dias a 180 dias",
      "assuntoPergunta": "cultivo"
    }, {
      "questao": "Quanto tempo a mandioca leva para poder ser cultivada ?",
      "alternativas": [
        "entre 16 dias a 20 dias",
        "entre 7 meses a 5 anos",
        "entre 12 meses a 9 anos",
        "6 meses a 3 anos"
      ],
      "respostaCorreta": "6 meses a 3 anos",
      "assuntoPergunta": "cultivo"
    }, {
      "questao": "Quais as condições de temperatura ideal para o cultivo do morango ?",
      "alternativas": [
        "Temperaturas altas e calor",
        "Temperaturas altas e clima umido",
        "Baixas temperaturas e frio"
      ],
      "respostaCorreta": "Baixas temperaturas e frio",
      "assuntoPergunta": "cultivo"
    }, {
      "questao": "Quais os cuidados necessários para ter uma horta saudável",
      "alternativas": [
        "Utilizar pesticidas",
        "Regar excessivamente o solo",
        "Diversificar a plantação",
        "Matar todo e qualquet inseto"
      ],
      "respostaCorreta": "Diversificar a plantação",
      "assuntoPergunta": "cultivo"
    }, {
      "questao": "Quais animais são benéficos para a horta ?",
      "alternativas": [
        "Abelhas",
        "Pulgões",
        "Lagartas",
        "Percevejos"
      ],
      "respostaCorreta": "Abelhas",
      "assuntoPergunta": "cultivo"
    }, {
      "questao": "Por que é importante ter minhocas no solo ?",
      "alternativas": [
        "Devora as pragas",
        "Se alimenta de percevejos",
        "Não é importante, não causa danos e não trás benefícios",
        "Por se alimentar de restos orgânicos de animais e vegetais, suas fezes são transformadas em húmus"
      ],
      "respostaCorreta": "Por se alimentar de restos orgânicos de animais e vegetais, suas fezes são transformadas em húmus",
      "assuntoPergunta": "cultivo"
    }, {
      "questao": "Por que é importante diversificar os cultivos?",
      "alternativas": [
        "Evitar a degradação do solo, aumenta a produtividade e reduz a ocorrência de pragas",
        "Produzir uma quantidade maior em menos tempo ",
        "Ajudar a aumentar degradação do solo",
        "Aumentar o uso de agrotóxicos"
      ],
      "respostaCorreta": "Evitar a degradação do solo, aumenta a produtividade e reduz a ocorrência de pragas",
      "assuntoPergunta": "cultivo"
    }, {
      "questao": "Qual a importância da prática de exercícios físicos e com que frequência ?",
      "alternativas": [
        "Estimular o sistema imunológico, ajuda a prevenir doenças cardíacas, moderam o colesterol",
        "Ficar em forma",
        "Não há importância, praticar exercícios é desnecessário",
        "É importante e o ideal é fazer a cada 60 dias"
      ],
      "respostaCorreta": "Estimular o sistema imunológico, ajuda a prevenir doenças cardíacas, moderam o colesterol",
      "assuntoPergunta": "saude do trabalhador"
    }, {
      "questao": "Quais os alimentos ajudam a diminuir o colesterol",
      "alternativas": [
        "Chocolate",
        "Beterraba",
        "Soja",
        "Alface"
      ],
      "respostaCorreta": "Soja",
      "assuntoPergunta": "saude do trabalhador"
    }]
  };


  Perguntas.fromJSON(Map<String, dynamic> jsonPerguntas){

    Map<String, dynamic> _perguntas = jsonPerguntas;

    for (Map<String,Object> perguntaSelecionada in jsonPerguntas["perguntas"]) {

      Pergunta pergunta = Pergunta.fromJSON(perguntaSelecionada);
      listaPerguntas.add(pergunta);
    }
    }


}