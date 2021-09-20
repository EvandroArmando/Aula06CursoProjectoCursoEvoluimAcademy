import 'package:floor/floor.dart';
import 'package:flutter_application_1/models/banco.dart';

@entity
class Agencia {
  @primaryKey
  final int id;
  final String nome;
  final String endereco;
  final int banco_id;
  final Banco banco;
  Agencia(this.endereco, this.id, this.nome, this.banco, this.banco_id);
}
