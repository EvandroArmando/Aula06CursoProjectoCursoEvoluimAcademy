import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cores.dart';

class SelecionarAgenciaPage extends StatelessWidget {
  const SelecionarAgenciaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () async{
                           await Navigator.pushNamed(context, "/agendar");
                            Navigator.pop(context);
                          },
                          child: AgenciaWidget());
                    }))
          ],
        ),
      ),
    );
  }
}

class AgenciaWidget extends StatelessWidget {
  const AgenciaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  "imgs/bma2.png",
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
                        "Agencia Talatona",
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
                        "Banco Bai",
                        style: TextStyle(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [Text("Av Comandante Gika")],
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
