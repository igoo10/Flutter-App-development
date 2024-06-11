import 'package:flutter/material.dart';
// import 'package:seccond_project/main.dart';

class pageOne extends StatelessWidget {
  // String name = getX.read('username');///Thee getX.read is responsible for retreiving something saved based on the key
  // pageOne({this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),

      body: Column(
        children: [

          SizedBox(height: 100),
          Text('My name', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500,)
          ),

          Center(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.amber,
            ),
          ),

          SizedBox(height: 100),
          MaterialButton(
              onPressed: (){
                Navigator.pop(context);//This is what's responsible for returning to a previous page
              },
            color: Colors.red,
            child: Text('Press me'),
          ),
        ],
      ),
    );
  }
}
