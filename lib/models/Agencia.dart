// ignore_for_file: non_constant_identifier_names

import 'package:floor/floor.dart';
import 'package:flutter_application_1/models/banco.dart';

@entity
class Agencia {
  @PrimaryKey (autoGenerate: true)
  final int? id;
  final String nome;
  final String endereco;
  final int banco_id;
  @ignore
  final Banco? banco;
  Agencia(this.endereco, this.id, this.nome, this.banco_id, {this.banco});
}
