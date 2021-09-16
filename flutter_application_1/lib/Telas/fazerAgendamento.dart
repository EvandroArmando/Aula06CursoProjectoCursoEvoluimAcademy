
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cores.dart';
import 'package:flutter_application_1/models/Agencia.dart';
import 'package:flutter_application_1/models/agendamento.dart';
import 'package:flutter_application_1/repositorios/agendaRepo.dart';

class FazerAgendamento extends StatefulWidget {
  const FazerAgendamento({Key? key}) : super(key: key);

  @override
  _FazerAgendamentoState createState() => _FazerAgendamentoState();
}

class _FazerAgendamentoState extends State<FazerAgendamento> {
  Agencia? agencia; //aceita null safe
  String servico = "Levantamento";
  int horario = 0;
  TextEditingController controller =
      TextEditingController(); //maunusear as informaç\oes que vem
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      setState(() {
        agencia = ModalRoute.of(context)?.settings.arguments
            as Agencia?; //buscar os argumentos passados da agencia
      });

      //buscar o id da agencia selecionada
    });

    super.initState();
  } //dizer que posteriormente a variavel será vazia

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(top:8,left: 8,right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fazer Agendamento (${agencia?.nome})",
                style: TextStyle(
                    color: azulEscuro, fontWeight: FontWeight.bold, fontSize: 32),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Que serviço pretendes realizar",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 12,
              ),
              Card(
                elevation: 2,
                child: Container(
                  width: MediaQuery.of(context).size.width - 32,
                  height: 60,
                  child: DropdownButton<String>(
                    value: servico,
                    underline: Container(),
                    onChanged: (novo) {
                      setState(() {
                        if (novo != null) {
                          servico = novo;
                        }
                      });
                    },
                    items: [
                      "Levantamento",
                      "Deposito",
                      "Cartões /Cheques",
                      "Abertura de Contas",
                      "Outros"
                    ]
                        .map<DropdownMenuItem<String>>(
                            (String e) => DropdownMenuItem<String>(
                                value: e,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 16),
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      width:
                                          MediaQuery.of(context).size.width - 95,
                                      child: Text(e)),
                                )))
                        .toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Em que dia?"),
                  Card(
                    child: Container(
                      child: TextFormField(
                        controller: controller,
                        maxLength: 10,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "####-##-##"),
                      ),
                    ),
                  )
                ],
              ),
              Text("Selecione o horario pretendido"),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 60,
                    child: HorarioWidget(
                      horario: "08-10h",
                      selecionado: horario == 1,
                      aoClicar: () {
                        setState(() {
                          horario = 1;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 120,
                    height: 60,
                    child: HorarioWidget(
                      horario: "11-13h",
                      selecionado: horario == 2,
                      aoClicar: () {
                        setState(() {
                          horario = 2;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 120,
                    height: 60,
                    child: HorarioWidget(
                      horario: "14-16h",
                      selecionado: horario == 3,
                      aoClicar: () {
                        setState(() {
                          horario = 3;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Container(
                  width: MediaQuery.of(context).size.width - 32,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: ()  async {
                         await salvarAgendamento();
                          Navigator.pop(context);
    
                      },
                      style: ElevatedButton.styleFrom(
                          primary: lilasBaixo,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text("Agendar")))
            ],
          ),
        ),
      ),
    );
  }

  salvarAgendamento() {
    if (controller.text.isNotEmpty) {
      final agendamento = Agendamento(
          1, servico, getHorario(horario), DateTime.parse(controller.text), 1,agencia!);
         AgendaRepo.obterRepositorio(context).addAgendamento(agendamento);

    }

  }

  String getHorario(int horario) {
    if (horario == 1) {
      return "08h-10h";
    }
    if (horario == 2) {
      return "11h-13h";
    }

    if (horario == 3) {
      return "14h-16h";
    }
    return "";
  }
}

class HorarioWidget extends StatelessWidget {
  final String horario;
  final bool selecionado;
  final Function() aoClicar;
  const HorarioWidget({
    Key? key,
    required this.horario,
    this.selecionado = false,
    required this.aoClicar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: aoClicar,
      child: Card(
        elevation: 12,
        color: selecionado ? lilasBaixo : Colors.white,
        child: Center(child: Text(horario)),
      ),
    );
  }
}
