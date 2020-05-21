class Produto{
  String nome;
  int quantidade = 1;
  bool plantavel = true;

  Produto(String nomeProduto){
    this.nome = nomeProduto;
  }

  //Produto.nome(this.nome);
}


class Celeiro{

  List<String> nomeProdutos = ['cenoura'];
  List<int> quantidadeProdutos= [8];


  static  final Celeiro _instance= Celeiro._internalConstructor();

  factory Celeiro(){
    return _instance;
  }

  Celeiro._internalConstructor();





}