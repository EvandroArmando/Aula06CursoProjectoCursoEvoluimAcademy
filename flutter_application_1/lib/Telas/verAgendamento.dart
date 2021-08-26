import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Telas/selectAgencia.dart';
import 'package:flutter_application_1/cores.dart';

class VerAgendamentoPage extends StatelessWidget {
  const VerAgendamentoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(child: Text("Levantamento",style: TextStyle(color: azulEscuro,fontSize: 24,fontWeight: FontWeight.bold),
              ),
              ),
              SizedBox(
                height:12,
              ),
              Container(   
              
                height: 150,
                width: 200,
                child: Card(
                  elevation :7,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: 
                  BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Ficha",style:TextStyle(color:azulEscuro,fontSize: 14,fontWeight: FontWeight.bold),),
                        Text("22",style: TextStyle(color: azulEscuro,fontSize:60,fontWeight: FontWeight.bold),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("06-04-2021",style:TextStyle(color:azulEscuro),),
                            SizedBox(
                              width: 4,
                              height: 05,
                            ),
                            Text("08h as 10h",style:TextStyle(color:azulEscuro),),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),

              ),
              SizedBox(
                height:16,
              ),
                
                  AgenciaWidget(),

                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Atendimento a ficha:",style: (TextStyle(color: azulEscuro)),),
                          SizedBox(
                           height: 8,
                          ),
                          Text("Em espera:",style: TextStyle(color: azulEscuro),),
                          
                        ], 
                         
                      ),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("02",style: (TextStyle(color: azulEscuro,fontSize: 20,fontWeight: FontWeight.bold)),),
                          SizedBox(
                            height: 1,
                           ),
                          Text("20 pessoas:",style: TextStyle(color: azulEscuro,fontSize:20,fontWeight: FontWeight.bold),),
                          
                        ],  
                      ),
                      
                      

                    ],


                  ),
                  Expanded(child: Container(

                  )),
                   Container(
                      width: MediaQuery.of(context).size.width -32,
                      height: 60,
                      child: ElevatedButton(onPressed: () {}, 
                      style: ElevatedButton.styleFrom(primary: vermelhoBaixo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                      ),
                      child: Text("Cancelar")))

                  
                ],
              

            
            
          ),
           
        ),
      ),
    );
  }
}