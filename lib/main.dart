import 'package:flutter/material.dart';
import 'barWidgets.dart';
import 'tryout.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_storage/get_storage.dart;

final getX = GetStorage();
void main() async{
  //The runApp basically attaches your U.I to your screen
  await GetStorage.init();
  runApp(FirstProject());
}



//Stateless widget is useful when the part of the user interface you are
// describing does not depend on anything other than the configuration information and
// the BuildContext whereas a Stateful widget is useful when the part of the user interface you are describing can change dynamically.
class FirstProject extends StatelessWidget{
  const FirstProject({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'My app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: barWidgets(),
    );
  }
}






//The widgets whose state can not be altered once they are built are called stateless widgets.
// These widgets are immutable once they are built i.e any amount of change in the variables, icons, buttons, or retrieving data can not change the state of the app. Below is the basic structure of a stateless widget.
// Stateless widget overrides the build() method and returns a widget. For example, we use Text or the Icon is our flutter application where the state of the widget does not change in the runtime.
// It is used when the UI depends on the information within the object itself. Other examples can be Text, RaisedButton, IconButtons.

//
// class Tryout extends StatelessWidget{
//   int count = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: Icon(Icons.arrow_back_ios),
//           elevation: 4,
//           title: Text('Welcome to deebug'),
//         ),
//         body: Column(
//           children: [
//             Text('$count', style: TextStyle(fontSize: 50)),
//
//             Center(
//               child: MaterialButton(
//                 color: Colors.purple,
//                 onPressed: (){
//                   count++;
//                 },
//                 child: Text('Press me', style: TextStyle(color: Colors.white),),
//               ),
//             ),
//           ],
//         ),
//         );
//   }
// }




