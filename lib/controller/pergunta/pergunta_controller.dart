import 'package:mobx/mobx.dart';
part 'pergunta_controller.g.dart';


class PerguntaController = _PerguntaControllerBase with _$PerguntaController;



abstract class _PerguntaControllerBase with Store {

  @observable
  String resultadoPergunta;

  @observable
  String respostaSelecionada;


  @action
  verificarResposta(String respostaEsperada){

    if (respostaEsperada == respostaSelecionada)
      resultadoPergunta="acertou";
    else
      resultadoPergunta="errou";
  }





}