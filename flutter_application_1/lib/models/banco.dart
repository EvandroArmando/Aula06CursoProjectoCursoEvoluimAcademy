
import 'package:floor/floor.dart';

import 'Agencia.dart';

@entity
class Banco { 
  @PrimaryKey (autoGenerate: true)
  final int? id;
  final String nome;
  final String logo;
  List<Agencia> agencias = [];

  Banco(this.nome,this.logo,this.id);
}
