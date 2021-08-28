enum EstadoAgendamento { concluido, listaEspera, emCurso, cancelado }

class Agendamento {
  final int id;
  final String servico;
  final DateTime dia;
  EstadoAgendamento estado = EstadoAgendamento.listaEspera;
  final String Periodo;
  final int num_ficha;

  Agendamento(this.id, this.servico, this.Periodo, this.dia, this.num_ficha);
}
