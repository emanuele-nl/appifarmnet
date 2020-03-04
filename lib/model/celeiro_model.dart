




class Produto{
  String nome;
  int quantidade;
  bool plantavel;

}


class Celeiro{

  List<Produto> produto;



  static  final Celeiro _instance= Celeiro._internalConstructor();

  factory Celeiro(){
    return _instance;
  }

  Celeiro._internalConstructor();



}