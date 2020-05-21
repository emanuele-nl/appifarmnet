
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:i_farm_net_new/controller/fazenda/fazenda_controller.dart';
import 'package:i_farm_net_new/view/home_screen.dart';


void main(){

  GetIt getIt =GetIt.I;
  getIt.registerSingleton<FazendaController>(FazendaController());
  runApp(MyApp());
}



class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'IFarmNET',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }

}