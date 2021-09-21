import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cores.dart';
import 'package:flutter_application_1/models/Agencia.dart';
import 'package:flutter_application_1/repositorios/agendaRepo.dart';
import 'package:provider/provider.dart';

class SelecionarAgenciaPage extends StatelessWidget {
  const SelecionarAgenciaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selecione a Agencia",
                style: TextStyle(
                    color: azulEscuro, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 30, width: 30),
              Expanded(
                  child: Consumer<AgendaRepo>(builder: (context, state, widget) {
                return ListView.builder(
                    itemCount: state.getAgencia().length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {  //passar agencia selecionada
                      final agencia =state.getAgencia()[index];
                      return InkWell(
                          onTap: () async {
                            await Navigator.pushNamed(context, "/agendar",
                            
                            arguments: agencia); //passar informaçoes para outra tela
                            Navigator.pop(context);
                          },
                          child:
                              AgenciaWidget(agencia: agencia));
                    });
              }))
            ],
          ),
        ),
      ),
    );
  }
}

class AgenciaWidget extends StatelessWidget {
  final Agencia? agencia;
  const AgenciaWidget({
    Key? key,
    required this.agencia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final agencia = this.agencia!;
    return Container(
      height: 90,
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                //colocar imagem  redonda
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  agencia.banco!.logo,
                  width: 80,
                  height: 80,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        agencia.nome,
                        style: TextStyle(color: azulEscuro, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        agencia.banco!.nome,
                        style: TextStyle(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [Text(agencia.endereco)],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
