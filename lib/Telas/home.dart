import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cores.dart';
import 'package:flutter_application_1/models/agendamento.dart';
import 'package:flutter_application_1/repositorios/agendaRepo.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Consumer<AgendaRepo>(builder: (context, repositorios, widget) {

              final agendamentos = repositorios.getAgendamento().length;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.white,
                          child: Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Text(
                              "Segunda 16 de agosto",
                              style: TextStyle(
                                fontSize: 18,
                                color: azulEscuro,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  //cartaos
                  SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  renderCartao(
                                      context,
                                      Icons.check_box_outlined,
                                      "${repositorios.qtdAgendamentoByEstado(EstadoAgendamento.concluido)}",
                                      "Concluidos",
                                      [verdeCima, verdeBaixa]),
                                  espacoHorizontal(),
                                  renderCartao(
                                      context,
                                      Icons.access_time_outlined,
                                      "${repositorios.qtdAgendamentoByEstado(EstadoAgendamento.listaEspera)}",
                                      "pendentes",
                                      [laranjaClaro, laranjaEscuro]),
                                  espacoHorizontal(),
                                ],
                              ),
                            ],
                          ),
                          espacoVertical(),
                          Row(
                            children: [
                              Row(
                                children: [
                                  renderCartao(
                                      context,
                                      Icons.cancel_outlined,
                                      "${repositorios.qtdAgendamentoByEstado(EstadoAgendamento.cancelado)}",
                                      "cancelados",
                                      [vermelhoCima, vermelhoBaixo]),
                                  espacoHorizontal(),
                                  renderCartao(
                                      context,
                                      Icons.person_rounded,
                                      "${repositorios.qtdAgendamentoByEstado(EstadoAgendamento.emCurso)}",
                                      "em curso",
                                      [lilasCima, lilasBaixo])
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  espacoVertical(),
                  espacoPersonalizado(50, 0),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: agendamentos == 0
                          ? Text(
                              "Sem agendamentos",
                              style: TextStyle(color: Colors.red),
                            )
                          : ListView.builder(
                              itemCount: agendamentos,
                              itemBuilder: (BuildContext context, index) {
                                final agendamento = repositorios.getAgendamento()[index]; //passar valores para proxima tela
                                return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, "/ver_agendamento",arguments: agendamento);
                                    },
                                    child: ListaAgendamento(
                                        agendamento: agendamento) //passar valores por parametros

                                    );
                              },
                            ),
                    ),
                  ),
                ],
              ),
            );
          }),
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: azulEscuro,
              onTap: (pos) {
                if (pos == 1) {
                  Navigator.pushNamed(context, "/listar_agencias");
                } else {}
              },
              currentIndex: 0,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Inicio",
                    backgroundColor: verdeCima),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Icon(
                        Icons.add,
                        color: azulEscuro,
                      ),
                      Text("Agendar")
                    ],
                  ),
                  label: "Agendar",
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Icon(
                        Icons.history,
                        color: azulEscuro,
                      ),
                      Text("Historico")
                    ],
                  ),
                  label: "Historico",
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Icon(
                        Icons.business,
                        color: azulEscuro,
                      ),
                      Text("Em espera")
                    ],
                  ),
                  label: "Em espera",
                ),
              ]),
        ),
      ),
    );
  }

  SizedBox espacoPersonalizado(double altura, double largura) {
    return SizedBox(
      height: altura,
      width: largura,
    );
  }

  SizedBox espacoVertical() {
    return SizedBox(
      height: 12,
    );
  }

  SizedBox espacoHorizontal() {
    return SizedBox(
      width: 12,
    );
  }

  Container renderCartao(BuildContext context, IconData icone, String qtd,
      String nome, List<Color> cores) {
    return Container(
      alignment: Alignment.center,
      height: 120,
      width: MediaQuery.of(context).size.width / 2 - 32,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: cores,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      //icones e textos do cartao
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icone,
            color: Colors.white,
            size: 24,
          ),
          SizedBox(
            width: 8,
          ),
          SizedBox(
            height: 58,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  qtd,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  nome,
                  style: TextStyle(fontSize: 18, color: Colors.white30),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListaAgendamento extends StatelessWidget {
  final Agendamento agendamento;
  const ListaAgendamento({
    Key? key,
    required this.agendamento,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              agendamento.agencia!.banco!.logo,
              width: 80,
              height: 80,
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(agendamento.servico,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: azulEscuro)),
              SizedBox(height: 2),
              Row(
                children: [
                  Text("ficha:"),
                  Text(
                    "${agendamento.id}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 2),
              Text("22 pessoas na fila"),
            ],
          )
        ],
      ),
    );
  }
}