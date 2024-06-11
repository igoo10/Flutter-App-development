import 'package:first/firstClass.dart';
import 'package:first/locationPage.dart';
import 'package:first/statemanagementSolutionsRouting/navigate.dart';
// import 'package:first/statemanagementSolutionsRouting/navigate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: homePage(),
));
class homePage extends StatelessWidget {
  void orderResponse() {
    print('Chill As we process your order');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'igoo EATS',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }
          ),
          title: Text(
            'igoo EATS',
          ),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Image.asset('assets/images/chefthumbs.jpg'),
              SizedBox(height: 40),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 0),
                    child: Text(
                      'Sign In',
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                      textScaleFactor: 1.5,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelStyle: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                        labelText: 'NAME',
                        hintText: 'Username',
                        icon: Icon(Icons.person, color: Colors.black54,),

                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelStyle: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                        labelText: 'PASSWORD',
                        hintText: 'Password',
                        icon: Icon(Icons.lock, color: Colors.black54,),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => locationPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                      padding: EdgeInsets.symmetric( horizontal: 40, vertical: 20),
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => forgotPage()),
                    );
                  },
                  child: Text(
                    'Forgot Password?', style: TextStyle(
                    color: Colors.black54
                  ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
class forgotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Forgot Password',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 60.0,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Enter your registered phone number or E-mail address.',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Phone number or E-mail Address',
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent)
              ),
                onPressed: (){
               Navigator.push(context,
                   MaterialPageRoute(builder: (context)=>receiveTextPage())
               );
            },
                child: Text(
              'Next', style: TextStyle(
            ),)
            )
          ],
        ),
      )

    ),
    );
  }
}
class receiveTextPage extends StatelessWidget{
  @override
  Widget build(BuildContext context ){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
        body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  'Authentication',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'An OTP was sent to your phone/E-mail, Enter the code here.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  obscureText: true,
                  maxLength: 6,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Enter OTP Code',
                  ),
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent)
                  ),
                  onPressed: (){
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context)=>receiveTextPage())
                    // );
                  },
                  child: Text(
                    'Next', style: TextStyle(
                  ),)
              )
            ],
          ),
        )
    )
    );

  }
}
