import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:i_farm_net_new/controller/selecionar_fazendeiro/selecionar_fazendeiro_controller.dart';
import 'package:i_farm_net_new/view/fazenda/fazenda_screen.dart';


class SelecionarFazendeiroScreen extends StatefulWidget {
  @override
  _SelecionarFazendeiroScreenState createState() => _SelecionarFazendeiroScreenState();

}


class _SelecionarFazendeiroScreenState extends State<SelecionarFazendeiroScreen> {

  final controller = SelecionarFazendeiroController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("lib/view/assets/fundo.png"),
                  fit: BoxFit.cover,))),

            Center(
                child: Column(
                    children: <Widget>[

                      Center(
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: controller.anteriorNumeroFazendeiro,
                              child: Icon(Icons.arrow_back,size: 50),
                            ),
                            Observer(
                              builder:  (_) {
                                return Image.asset("lib/view/assets/fazendeiros/"+controller.numeroFazendeiro.toString() +".png", width: 180,);
                              }
                            ),
                            GestureDetector(
                              onTap: controller.proximoNumeroFazendeiro,
                              child: Icon(Icons.arrow_forward, size: 50,),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        color: Colors.white,
                        child: Observer(
                            builder: (_) {
                              return TextFormField(
                              onChanged: controller.mudaNomeFazendeiro,
                              decoration: InputDecoration( labelText: "Nome",
                                border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(const Radius.circular(12.0)),
                              ),
                              contentPadding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),
                              //errorText: "favor inserir um nome ",
                              ),
                              );
                            }

                        ),
                      ),
                      Observer(
                        builder: (_) {
                            return GestureDetector(
                              onTap: () {
                                if (controller.nomePreenchido)
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => FazendaScreen()));


                                },
                              child: Image.asset("lib/view/assets/botao-continuar.png",semanticLabel: "Continuar",)
                        );
                        }
                      )

                    ]
                )

            )
          ],

        )
    );
  }





}