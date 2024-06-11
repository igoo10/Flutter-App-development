import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first/cartpage.dart';

void main(){
  runApp(interDishes());
}
class interDishes extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text('INTERNATIONAL DISHES'),
        actions: [
          IconButton(onPressed:() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>cartPage()));
          },
              icon:Icon(Icons.shopping_cart) )
        ],
      ),

    );
  }
}