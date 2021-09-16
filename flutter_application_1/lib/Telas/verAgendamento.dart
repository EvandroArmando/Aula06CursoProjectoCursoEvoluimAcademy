import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Telas/selectAgencia.dart';
import 'package:flutter_application_1/cores.dart';
import 'package:flutter_application_1/models/agendamento.dart';

class VerAgendamentoPage extends StatefulWidget {

   VerAgendamentoPage({
    Key? key, 
     
  }) : super(key: key);

  @override
  _VerAgendamentoPageState createState() => _VerAgendamentoPageState();
}

class _VerAgendamentoPageState extends State<VerAgendamentoPage> {
     Agendamento? agendamento;

@override
void initState() { 
  super.initState();
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      setState(() {
        agendamento = ModalRoute.of(context)?.settings.arguments
            as Agendamento?; //buscar os argumentos passados da agencia
      });

      //buscar o id da agencia selecionada
    });

}


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child:agendamento== null ?Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ): Column(
              children: [
                Center(
                  child: Text(
                    "Levantamento",
                    style: TextStyle(
                        color: azulEscuro,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 180,
                  width: 200,
                  child: Card(
                    elevation: 7,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Ficha",
                            style: TextStyle(
                                color: azulEscuro,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${agendamento!.num_ficha}",
                            style: TextStyle(
                                color: azulEscuro,
                                fontSize: 60,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${agendamento!.dia} ",
                                style: TextStyle(color: azulEscuro),
                              ),
                              
                              
                            ],
                          ),
                          SizedBox(
                                height: 4,
                              ),  
                              Text(
                                " ${agendamento!.Periodo}",
                                style: TextStyle(color: azulEscuro),
                              ),
                            
                          

                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                AgenciaWidget(agencia: agendamento!.agencia),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "-- servidor Atendimento a ficha:",
                          style: (TextStyle(color: azulEscuro)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "--Em espera:",
                          style: TextStyle(color: azulEscuro),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "--02",
                          style: (TextStyle(
                              color: azulEscuro,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          "--20 pessoas:",
                          style: TextStyle(
                              color: azulEscuro,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Container(
                    width: MediaQuery.of(context).size.width - 32,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () async {
                          await dialogoDoProcesso(context);
                          Navigator.pushNamed(context, "/home");
                        },
                        style: ElevatedButton.styleFrom(
                            primary: vermelhoBaixo,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        child: Text("Cancelar")))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> dialogoDoProcesso(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        content: Container(
          height: 180,
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check,
                color: verdeBaixa,
                size: 80,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Agendamento Cancelado com \n com sucesso",
                style: TextStyle(
                    color: azulEscuro,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

