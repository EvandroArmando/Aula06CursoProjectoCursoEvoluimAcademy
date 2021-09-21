import 'package:floor/floor.dart';
import 'package:flutter_application_1/models/Agencia.dart';

@dao
abstract class AgenciaDao {
  @Query('SELECT * FROM Agencia')
  Future<List<Agencia>> findAllAgencias();

  @Query('SELECT * FROM Agencia WHERE id = :id')
  Stream<Agencia?> findAgenciaById(int id);

  @insert
  Future<void> insertAgencia(Agencia agencia);

  @delete
  Future <int>deleteAgendameto(Agencia agencia);
}
