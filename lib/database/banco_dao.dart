import 'package:floor/floor.dart';
import 'package:flutter_application_1/models/banco.dart';

@dao
abstract class BancoDao {
  @Query('SELECT * FROM Banco')
  Future<List<Banco>> findAllBancos();

  @Query('SELECT * FROM Banco WHERE id = :id')
  Stream<Banco?> findBancoById(int id);

  @insert
  Future<void> insertBanco(Banco banco);

  @delete
  Future <int> deleteBanco(Banco banco);
}
