import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cores.dart';

class BoasvindasPage extends StatelessWidget {
  const BoasvindasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.all(16.0),
        
        child: 
        Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               
               Text("Bem vindo ao ",style: TextStyle(color:azulEscuro,fontSize: 30,fontWeight: FontWeight.bold),),
               SizedBox(height:12),
               Text("Agenda Aqui",style: TextStyle(color: azulEscuro,fontSize:60,fontWeight: FontWeight.bold),),
            
               SizedBox(
                 height: 20,
               ),
               Text("A tua fila é onde tu quiseres marque apatir de casa \n E espere a tua vez!"),
               SizedBox(height: 82,),
               Text("Podes Dizer-nos o seu nome?"),
               
               SizedBox(height:8,),
               Card(
                 
                 shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                          color: Colors.white,
                          elevation: 3,
                          
                  child: Container( 

                   // conteudo dentro do container
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8),
                   color: Colors.white,
                  
                 ),
                    //botao
                 child: TextFormField(decoration:InputDecoration(
                 hintText: "Escreva um nome",
                 border: InputBorder.none,
                 
                 ) ,),
               )
            
                 
            
               ),
               
              ],),


              
            ),
            SizedBox(height: 12,),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width -16,
                  child: ElevatedButton(onPressed:(){}, child: 
                  Text("Continuar"),style: ElevatedButton.styleFrom(primary:azulEscuro),),
                ),
              ),
            )
          ],
        ),
      )
      
      ),
      
    );
  }
}