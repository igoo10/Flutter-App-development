import 'package:flutter/material.dart';
import 'package:first/cartpage.dart';

void main() {
  runApp(localDishes());
}

List<String> localfoods = [
  "Jollof Rice",
  "EBA",
  "FUFU",
  "POUNDED YAM",
  "MOI-MOI",
  "OFADA RICE",
  "PEPPER- SOUP"
];


class localDishes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("local dishes"), backgroundColor: Colors.red,
          actions: [
            IconButton(onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>cartPage()));
            },
                icon:Icon(Icons.shopping_cart) )
          ],
        ),
        body: Container(
            color: Colors.pink,
            padding: EdgeInsets.all(16.0),
            child: LocalList(localfoods)
        ),
      );

  }
}


class LocalList extends StatelessWidget {
  final List<String> localfoods;

  LocalList(this.localfoods);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: localfoods.length,
      itemBuilder: (context, pos) {
        return Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                child: Text(localfoods[pos], style: TextStyle(
                  fontSize: 18.0,
                  height: 1.6,
                ),),
              ),
            )
        );
      },
    );
  }
}