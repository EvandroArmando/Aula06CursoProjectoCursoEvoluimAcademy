
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cores.dart';

class HomePage extends StatelessWidget {
  const HomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
       body: SafeArea(child: 
       Padding(
         padding: const EdgeInsets.all(16.0),
         child: Column(
          crossAxisAlignment :CrossAxisAlignment.start,
           children: [
            Row(
              children: [
                ClipOval(
                  child:Container(
                    width: 50,
                    height: 50,
                    color: Colors.white,
                    child: Icon(
                      Icons.person,
                    ),
                  ) ,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      child: Text("Segunda 16 de agosto",style:TextStyle(
                      fontSize: 18,
                      color: azulEscuro,
                      fontWeight: FontWeight.bold,
                      ),),
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
                         renderCartao(context, Icons.check_box_outlined, "100", "Concluidos", [verdeCima,verdeBaixa]),
                         espacoHorizontal(),
                         renderCartao(context, Icons.access_time_outlined, "12", "pendentes", [laranjaClaro,laranjaEscuro]),
                         espacoHorizontal(),
                       ], 
                     ),
                     
                   ],
                ) ,
                espacoVertical(),
                Row(
                       children: [
                         Row(
                           children: [
                             renderCartao(context, Icons.cancel_outlined, "2", "cancelados",[vermelhoCima,vermelhoBaixo]),
                         espacoHorizontal(),
                         renderCartao(context, Icons.person_rounded, "14", "em curso", [lilasCima,lilasBaixo])
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
              Text("Agendamentos",style:TextStyle(fontSize:24)),
              TextButton(onPressed:(){}, child: Text("ver mais",style: TextStyle(fontSize: 24),))
            ],
          )      
        ],

         ),
       ),
       ),

      ),
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

  Container renderCartao(BuildContext context,IconData icone,String qtd,String nome,List<Color> cores) {
    return Container(
                 alignment: Alignment.center,
                 height: 120,
                 width: MediaQuery.of(context).size.width/2-32,
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                    begin:Alignment.topCenter,
                    end: Alignment.bottomCenter,
                     colors: cores,
                   ),
                   borderRadius: BorderRadius.circular(
                     18
                   ),
                 ),
                 //icones e textos do cartao
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icone,color: Colors.white,size:24,),
                      SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        height: 58,
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [    
                            Text(qtd,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                            Text(nome,style: TextStyle(fontSize: 18,color: Colors.white30),)
                          ],
                        ),
                      ),
                    ],
                 ),
               );
  }
}