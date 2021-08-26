import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/cores.dart';

class FazerAgendamento extends StatelessWidget {
  const FazerAgendamento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Fazer Agendamento",
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
                  value: "Levantamento",
                  underline: Container(),
                  onChanged: (novo) {},
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
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "##-##-###"),
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
                  child: Card(
                    elevation: 12,
                    color: vermelhoBaixo,
                    child: Center(
                        child: Text(
                      "08-10h",
                    )),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 120,
                  height: 60,
                  child: Card(
                    elevation: 6,
                    color: Colors.white,
                    child: Center(
                        child: Text(
                      "11h-13h",
                    )),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 120,
                  height: 60,
                  child: Card(
                    elevation: 12,
                    color: lilasBaixo,
                    child: Center(
                      child: Text(
                        "14-16h",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),
            Container(
                width: MediaQuery.of(context).size.width - 32,
                height: 40,
                child: ElevatedButton(

                    onPressed: () {
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
    );
  }
}
