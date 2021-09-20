import 'package:floor/floor.dart';
import 'package:flutter_application_1/models/Usuario.dart';

@dao
abstract class UsuarioDao {
  @Query('SELECT * FROM Usuario')
  Future<List<Usuario>> findAllUsuarios();

  @Query('SELECT * FROM Usuario WHERE id = :id')
  Stream<Usuario?> findUsuarioById(int id);

  @insert
  Future<void> insertUsuario(Usuario usuario);

  @delete
  Future <int> deleteAgendameto(Usuario usuario);
}
