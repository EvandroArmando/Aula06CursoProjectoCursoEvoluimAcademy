
import 'package:floor/floor.dart';
@entity
class Usuario {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String nome;


  Usuario(this.id, this.nome);
}