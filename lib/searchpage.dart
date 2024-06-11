import 'package:flutter/material.dart';
void main() {
  runApp(searchPage());
}

class searchPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
         title:Container(
           decoration: BoxDecoration(
             color: Colors.white, borderRadius: BorderRadius.circular(5)),
               child:TextField(
                decoration: InputDecoration(
                  hintText: 'What are you looking for?',
                   prefixIcon: Icon(Icons.search),
                  suffixIcon:IconButton(
                    icon:Icon(Icons.cancel),
                    onPressed:(){

                    }
                  ),
                ),
         )
           ),
         ),
      );

  }
}
