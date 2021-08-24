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
           Text("Fazer Agendamento",style: TextStyle(color: azulEscuro,fontWeight: FontWeight.bold,fontSize: 32),),
           SizedBox(height: 30,),
           Text("Que serviço pretendes realizar",style:TextStyle(fontSize: 16),)

         ],
         
       ),
     ),

    );
    
  }
}