
import 'package:flutter/material.dart';
import 'package:i_farm_net_new/view/home_screen.dart';


void main(){
  runApp(MyApp());
}



class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'IFarmNET',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }

}