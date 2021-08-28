import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cores.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          renderCartao(context, Icons.check_box_outlined, "100",
                              "Concluidos", [verdeCima, verdeBaixa]),
                          espacoHorizontal(),
                          renderCartao(context, Icons.access_time_outlined,
                              "12", "pendentes", [laranjaClaro, laranjaEscuro]),
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
                          renderCartao(context, Icons.cancel_outlined, "2",
                              "cancelados", [vermelhoCima, vermelhoBaixo]),
                          espacoHorizontal(),
                          renderCartao(context, Icons.person_rounded, "14",
                              "em curso", [lilasCima, lilasBaixo])
                        ],
                      )
                    ],
                  ),
                ],
              ),

              espacoVertical(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Agendamentos", style: TextStyle(fontSize: 24)),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "ver mais",
                        style: TextStyle(fontSize: 24),
                      ))
                ],
              ),
              SizedBox(
                height: 08,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/ver_agendamento");
                        },
                        child: listaAgendamentos());
                  },
                ),
              )
            ],
          ),
        ),
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
    );
  }

  Container listaAgendamentos() {
    return Container(
      height: 85,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "imgs/bma2.png",
              width: 80,
              height: 80,
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Levantamento",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: azulEscuro)),
              espacoPersonalizado(2, 0),
              Row(
                children: [
                  Text("ficha:"),
                  Text(
                    "22 ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              espacoPersonalizado(2, 0),
              Text("22 pessoas na fila"),
            ],
          )
        ],
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
