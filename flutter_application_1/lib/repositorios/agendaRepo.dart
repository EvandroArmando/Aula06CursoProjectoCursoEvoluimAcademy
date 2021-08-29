import 'package:flutter_application_1/models/Agencia.dart';
import 'package:flutter_application_1/models/agendamento.dart';
import 'package:flutter_application_1/models/usuario.dart';

class AgendaRepo {
  Usuario? _usuario;

  List<Agencia> _agencias = [];
  List<Agendamento> _agendamentos = [];

  Usuario? getUser() {
    return this._usuario;
  }

  setUser(Usuario usuario) {
    this._usuario = usuario;
  }

  List<Agencia> getAgencia() {
    return this._agencias;
  }

  List<Agendamento> getAgendamento() {
    return this._agendamentos;
  }

  void addAgencia(Agencia agencia) {
    this._agencias.add(agencia);
  }

  void addAgendamento(Agendamento agendamento) {
    this._agendamentos.add(agendamento);
  }
}
