import 'package:first/menuPage.dart';
import 'package:flutter/material.dart';

import 'package:first/firstClass.dart';
import 'package:flutter/material.dart';
import 'package:first/homePage.dart';
import 'package:onboarding/onboarding.dart';
import 'package:first/homePage.dart';
import 'package:first/locationPage.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: beginPage(),
));

class beginPage extends StatefulWidget {
  @override
  _beginPageState createState() => _beginPageState();
}

class _beginPageState extends State<beginPage> {
  final List<Widget> pages = [
    Center(
      child: Builder(
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/foodsicons1.gif',
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
            SizedBox(height: 10),
            Text(
              'igooEATS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Eat Healthy',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                ElevatedButton(
                  child: Text('SIGN IN'),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homePage()),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text('CREATE AN ACCOUNT'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NextPage()),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent)
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextButton(
              child: Text(
                "Naa, I'm too hungry, I'll SKIP",
                style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 2.0
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => menuPage()),
                );
              },
            ),
          ],
        ),
      ),
    ),
  ];

  final PageController _pageController = PageController(initialPage: 0);

  void _startAutoSwipe(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      if (_pageController.page != pages.length - 1) {
        _pageController.nextPage(
          duration: Duration(seconds: 2),
          curve: Curves.easeOut,
        );
        _startAutoSwipe(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _startAutoSwipe(context);

    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: PageView(
        controller: _pageController,
        children: pages,
      ),
    );
  }
}



class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('SIGN UP'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 150),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Please enter your information:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.red,
                        backgroundColor: Colors.white38,
                      ),
                      labelText: 'USERNAME',
                      hintText: 'Enter a username',
                      icon: Icon(Icons.person, color: Colors.black54),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.red,
                        backgroundColor: Colors.white38,
                      ),
                      labelText: 'PASSWORD',
                      hintText: 'Enter a password',
                      icon: Icon(Icons.lock, color: Colors.black54),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.red,
                      ),
                      labelText: 'RE-ENTER PASSWORD',
                      hintText: 'Re-enter password',
                      icon: Icon(Icons.lock, color: Colors.black54),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => homePage()));
                    // Perform sign-in action
                  },
                  child: Text('Sign In'),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'OR Sign up with',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.facebook),
                      tooltip: "Sign up with your facebook account",
                      onPressed: () {
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.g_mobiledata_sharp),
                      tooltip: 'Sign up with your Google account',
                      onPressed: () {
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.apple_sharp),
                      tooltip: "Sign up with your Apple Account",
                      onPressed: () {
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
