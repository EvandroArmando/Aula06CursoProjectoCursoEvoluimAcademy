
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
            Row(
               
            )           
        ],

         ),
       ),
       ),

      ),
    );
  }
}