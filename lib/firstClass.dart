import 'package:first/drinks.dart';
import 'package:first/interdishes.dart';
import 'package:first/somethinglight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:first/firstClass.dart';
import 'package:first/searchpage.dart';
import 'package:first/homePage.dart';
import 'package:first/localdishes.dart';
import 'package:first/cartpage.dart';
import 'package:onboarding/onboarding.dart';
import 'package:first/beginPage.dart';
import 'package:first/menuPage.dart';

void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: firstClass(),
)
);

class firstClass extends StatelessWidget{
  final TextEditingController _searchController = TextEditingController();

  void orderResponse() {
    print('Chill As we process your order');
  }
  String getTimeOfDayMessage() {
    final currentTime = TimeOfDay.now();
    if (currentTime.hour >= 12 && currentTime.hour < 16) {
      return 'GOOD AFTERNOON';
    } else if (currentTime.hour >= 16) {
      return 'GOOD EVENING';
    } else {
      return 'GOOD MORNING';
    }
  }
  void  clearSearch(){
    _searchController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'igooEATS',
      home : Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
          title: Text('Local Dishes'),
      backgroundColor: Colors.deepOrangeAccent,
      actions: [
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text(
                'OUR CHEFS',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
            PopupMenuItem(
              child: Text(
                'ABOUT igoo-EATS',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
            PopupMenuItem(
              child: Text(
                'EXPLORE',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
        IconButton(
          onPressed:(){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> menuPage()));
          },
          icon: Icon(Icons.home),
          tooltip: 'Go Home',
        ),

        IconButton(
          icon: Icon(Icons.shopping_cart),
          tooltip: 'View shopping Cart',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => cartPage()),
            );
          },
        ),
      ],
      ),

    body:

        ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(),

              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true, // Set to true to enable background color
                  fillColor: Colors.white, // Set the background color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Looking for something?',
                  prefixIcon: Icon(Icons.search, color: Colors.deepOrangeAccent,),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.cancel, color: Colors.deepOrange,),
                    onPressed: clearSearch,
                  ),
                ),
              ),

            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              getTimeOfDayMessage(),
              style: TextStyle(
              color: Colors.red,
                letterSpacing: 5,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            ElevatedButton(
                child:Text('LOCAL DISHES'),
                    style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.redAccent),
            ),
                onPressed:(){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> localDishes()));
                },
                ),

          Container(
            // padding: EdgeInsets.only(),
            child:
            InkWell(
              onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=> localDishes()));
              },
             child:Ink.image(
                 image:AssetImage('assets/images/localdishes.jpg'),
               width: 10200,
               height: 400,
               alignment: Alignment.topCenter,
             ),
            ),
          ),
            // SizedBox(
            //   height: 0.0,
            // ),
            ElevatedButton(
              onPressed:(){
                Navigator.push(context, MaterialPageRoute( builder: (context)=> interDishes()));
              },
              child: Text('INTERNATIONAL DISHES'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent),
              ),

            ),
            Container(
              // padding: EdgeInsets.all(20.0),
              child:
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> interDishes()));
                },
                  child: Ink.image(
                      image: AssetImage('assets/images/internationaldishes.jpeg'),
                    width: 10000,
                    height: 400,
                    alignment: Alignment.topCenter,
                  ),

              ),
            ),


            SizedBox(
              height: 40.0,
            ),
            ElevatedButton(child:Text('SOMETHING LIGHT'),
              onPressed:(){
              Navigator.push(context, MaterialPageRoute (builder: (context)=> somethingLight()));
            },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent),
              ),
            ),

            Container(
              // padding: EdgeInsets.all(20.0),
              child:
              InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute (builder: (context)=>somethingLight()));
              },
                child:
                Ink.image(
                    image:AssetImage('assets/images/somethinglight.jpg',),
                  width: 10000,
                  height: 400,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),

            SizedBox(
              height: 40.0,
            ),
            ElevatedButton(child:Text('DRINKS'),
              onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> drinks()));
            },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent)
              ),
            ),
            Container(
              // padding: EdgeInsets.all(20.0),
              child:
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute (builder: (context)=> drinks())
                  );
                },
                child:
                Ink.image(
                    image: AssetImage('assets/images/drinks.jpg'),
                  width: 10000,
                  height: 400,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),

          ],
        ),



      drawer: Drawer(
          backgroundColor: Colors.yellow,
          child: ListView(
            // itemExtent: 120.0,
            children: [

      DrawerHeader(
        decoration:BoxDecoration(
          image: DecorationImage(image:
              AssetImage('assets/images/momcooking.jpg'),
                 fit: BoxFit.cover,
         ),
              color: Colors.white
          ), child: null,
      ),

      ListTile(
        leading: Icon(Icons.house_sharp), textColor: Colors.deepPurple, iconColor: Colors.red,
        title: Text('Our Locations', style: TextStyle(fontSize: 20)),
      ),
      ListTile(
        leading: Icon(Icons.man), textColor: Colors.deepPurple, iconColor: Colors.red,
        title: Text('Meet Our Chefs', style: TextStyle(fontSize: 20)),
      ),
      ListTile(
        leading: Icon(Icons.child_care), textColor: Colors.deepPurple, iconColor: Colors.red,
        title: Text('Our Contribution to Ending World Hunger', style: TextStyle(fontSize: 20)),
      ),
      ListTile(
        leading: Icon(Icons.account_circle), textColor: Colors.deepPurple, iconColor: Colors.red,
        title: Text('My Profile', style: TextStyle(fontSize: 20)),
      ), ListTile(
                leading: Icon(Icons.logout), textColor: Colors.deepPurple, iconColor: Colors.red,
                title: Text('Log out', style: TextStyle(fontSize: 20)),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute (builder: (context)=> homePage())
                  );
                },
              ),
      ],
    )

    ),
      ),

    );
  }


}