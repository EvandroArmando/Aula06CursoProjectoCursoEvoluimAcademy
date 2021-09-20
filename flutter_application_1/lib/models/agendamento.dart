import 'package:floor/floor.dart';
import 'package:flutter_application_1/models/Agencia.dart';

enum EstadoAgendamento { concluido, listaEspera, emCurso, cancelado }

@entity
class Agendamento {
  @primaryKey
  final int id;
  final String servico;
  final DateTime dia;
  EstadoAgendamento estado = EstadoAgendamento.listaEspera;
  final String Periodo;
  final agencia_id;
  final Usuario_id;
  final int num_ficha;
  final Agencia agencia;

  Agendamento(this.id, this.servico, this.Periodo, this.dia, this.num_ficha,
      this.agencia, this.agencia_id, this.Usuario_id);
}
