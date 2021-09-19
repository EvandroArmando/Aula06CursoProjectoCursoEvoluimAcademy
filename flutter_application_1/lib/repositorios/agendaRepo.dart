import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/models/Agencia.dart';
import 'package:flutter_application_1/models/agendamento.dart';
import 'package:flutter_application_1/models/banco.dart';
import 'package:flutter_application_1/models/usuario.dart';
import 'package:provider/provider.dart';

class AgendaRepo extends ChangeNotifier {
  //changeNotifier notifica sempre que existir uma mudança
  Usuario? _usuario = Usuario(1, "Evandro");

  List<Agencia> _agencias = [
       Agencia("kilamba 1 avenida", 1, "Agencia agostinho neto", Banco("Banco Bai","imgs/bma2.png", 2)),
      Agencia("Rocha 1 avenida", 1, "Agencia  Feira", Banco("Banco Atlantico", "imgs/bma2.png", 2))


  ];
  List<Agendamento> _agendamentos = [];

  Usuario? getUser() {
    return this._usuario;
  }

  setUser(Usuario usuario) {
    this._usuario = usuario;
    notifyListeners(); //notificar sempre a mudança sempre que haver um novo agendamento
  }

  List<Agencia> getAgencia() {
    return this._agencias;
  }

  List<Agendamento> getAgendamento() {
    return this._agendamentos;
  }

  void addAgencia(Agencia agencia) {
    this._agencias.add(agencia);
    notifyListeners();
     //notificar sempre a mudança sempre que haver um novo agendamento
  }

  void addAgendamento(Agendamento agendamento) {
    this._agendamentos.add(agendamento);
    notifyListeners();
  }  

  static AgendaRepo obterRepositorio(BuildContext context) {
    return Provider.of<AgendaRepo>(context,
        listen: false); //Tornar a classe global
  }

  int qtdAgendamentoByEstado(EstadoAgendamento estado) {    //funçao para verificar sa quantidade de estados existentes é igual a guardada no banco e retonar a quantidade
    final items = _agendamentos.where((element) => element.estado == estado);
    return items.length;
  }
}
