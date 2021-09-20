import 'package:floor/floor.dart';
import 'package:flutter_application_1/models/agendamento.dart';

@dao
abstract class AgendamentoDao {
  @Query('SELECT * FROM Agendamento')
  Future<List<Agendamento>> findAllAgendamentos();

  @Query('SELECT * FROM Agendamento WHERE id = :id')
  Stream<Agendamento?> findAgendamentoById(int id);

  @insert
  Future<void> insertAgendamento(Agendamento Agendamento);

  @delete
  Future <int> deleteAgendameto(Agendamento agendamento);
}
