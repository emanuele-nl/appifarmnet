import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:i_farm_net_new/controller/selecionar_fazendeiro/selecionar_fazendeiro_controller.dart';
import 'package:i_farm_net_new/view/carteirinha_screen.dart';
import 'package:i_farm_net_new/view/fazenda/fazenda_screen.dart';


class SelecionarFazendeiroScreen extends StatefulWidget {
  @override
  _SelecionarFazendeiroScreenState createState() => _SelecionarFazendeiroScreenState();

}


class _SelecionarFazendeiroScreenState extends State<SelecionarFazendeiroScreen> {

  final controller = SelecionarFazendeiroController();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          body: new Stack(
            children: <Widget>[
              new Container(decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("lib/view/assets/fundo.png"),
                    fit: BoxFit.cover,))),

              Center(
                  child: SingleChildScrollView(
                    child: Column(
                        children: <Widget>[

                          Center(
                            child: Row(
                              children: <Widget>[
                                Container(width:20),
                                GestureDetector(
                                  onTap: controller.anteriorNumeroFazendeiro,
                                  child: Icon(Icons.arrow_back, size: 50),
                                ),
                                Observer(
                                    builder: (_) {
                                      return Hero(
                                        tag: 'fazendeiro',
                                        child: Image.asset(
                                          "lib/view/assets/fazendeiros/" +
                                              controller.numeroFazendeiro.toString() +
                                              ".png", width: 180,),
                                      );
                                    }
                                ),
                                GestureDetector(
                                  onTap: controller.proximoNumeroFazendeiro,
                                  child: Icon(Icons.arrow_forward, size: 50,),
                                ),
                              ],
                            ),
                          ),
                          Container(height:20),

                          Container(
                            color:Color.fromRGBO(125, 125, 125, 0.5),
                            child: Observer(
                                builder: (_) {
                                  return TextFormField(
                                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white) ,
                                    onChanged: controller.mudaNomeFazendeiro,
                                    decoration  : InputDecoration(
                                      labelText: "Nome",
                                      prefixStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                                      labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),//aaaaaaaa
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            const Radius.circular(12.0)),
                                      ),
                                      contentPadding: EdgeInsets.all(MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.035),
                                      //errorText: controller.nomePreenchido? null : "Favor inserir um nome ",
                                    ),
                                  );
                                }

                            ),
                          ),
                          Container(height: 100,),
                          Observer(
                              builder: (_) {
                                return GestureDetector(
                                    onTap: () {
                                      if (controller.nomePreenchido) {
                                        controller.fazendeiro
                                            .gerarListaOrdemPerguntas();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => CarteirinhaScreen()));
                                      }
                                      else {
                                        showCupertinoModalPopup<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return mensagemdigitaNome(context);
                                          },

                                        );
                                      }
                                    },
                                    child: Align(
                                        alignment: FractionalOffset.bottomCenter,
                                        child: Image.asset(
                                            "lib/view/assets/botao-continuar.png",
                                            semanticLabel: "Continuar", height: 100)
                                    )


                                );
                              }
                          )

                        ]
                    ),
                  )

              )
            ],

          )
      ),
    );
  }


  Widget mensagemdigitaNome(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      title: Text(
        "Escolha um nome para o seu fazendeiro!", textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      backgroundColor: Color.fromRGBO(125, 125, 125, 0.5),
      content: Image.asset("lib/view/assets/fazendeiros/" +
          controller.numeroFazendeiro.toString() + ".png", height: 100,),
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
            //mudar isso aqui
            //controller.fazendeiro.avisoNovaMissao=false;
          },
          child: Text("ok", style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white))),
    );
  }


}