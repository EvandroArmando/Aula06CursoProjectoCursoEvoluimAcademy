import 'package:flutter_application_1/models/banco.dart';

class Agencia {
  final int id;
  final String nome;
  final String endereco;
  final Banco banco;

  List<Agencia> agencias = [];
  Agencia(this.endereco, this.id, this.nome,this.banco);
}
