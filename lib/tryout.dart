import 'package:flutter/material.dart';



//The widgets whose state can be altered once they are built are called stateful Widgets.
// These states are mutable and can be changed multiple times in their lifetime.
// This simply means the state of an app can change multiple times with different sets of variables, inputs, data. Below is the basic structure of a stateful widget.
// Stateful widget overrides the createState() and returns a State. It is used when the UI can change dynamically. Some examples can be CheckBox, RadioButton, Form, TextField.
// Classes that inherit “Stateful Widget” are immutable. But the State is mutable which changes in the runtime when the user interacts with it.
class Tryout extends StatefulWidget{
  @override
  //This createState() function is used to create a mutable state for this widget at a given location in the tree.
  //The other class which is TryoutState extends the state, which manages all the changes in the widget. Inside that(TryoutState)class, the build function is overridden which takes the BuildContext as the parameter.
  //The build function returns a widget where we design the UI of the app.
  // Since it is a stateful widget the build function is called many times which creates the entire UI once again with all the changes.
  TryoutState createState() => TryoutState();
}

class TryoutState extends State<Tryout>{
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('My name is Destiny');
  }
  @override
  Widget build(BuildContext context){
    //The Scaffold is a widget in Flutter used to implements the basic material design visual layout structure.
    // It is quick enough to create a general-purpose mobile application and contains almost everything we need to create a functional and responsive Flutter apps.
    // This widget is able to occupy the whole device screen.
    // In other words, we can say that it is mainly responsible for creating a base to the app screen on which the child widgets hold on and render on the screen.
    // It provides many widgets or APIs for showing Drawer, SnackBar, BottomNavigationBar, AppBar, FloatingActionButton, and many more.
    //
    // The Scaffold class is a shortcut to set up the look and design of our app that allows us not to build the individual visual elements manually.
    // It saves our time to write more code for the look and feel of the app.
    return Scaffold(
      // The appbar is the other primary and required property of this widget, which will display the main content in the Scaffold.
      appBar: AppBar(),

      // The body is the other primary and required property of this widget, which will display the main content in the Scaffold.
      // It signifies the place below the appBar and behind the floatingActionButton & drawer.
      // The widgets inside the body are positioned at the top-left of the available space by default. See the below code:
      body: Column(
        children: [
          Text('$count', style: TextStyle(fontSize: 50)),

          Center(
            child: MaterialButton(
              color: Colors.purple,
              onPressed: (){
                setState(() {
                  count++;
                });
              },
              child: Text('Press me', style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}