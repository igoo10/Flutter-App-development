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

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: drinks(),
));

class drinks extends StatelessWidget {
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

  final TextEditingController _searchController = TextEditingController();

  void clearSearch() {
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: 'Search',
              prefixIcon: Icon(Icons.search, color: Colors.deepOrangeAccent),
              suffixIcon: IconButton(
                icon: Icon(Icons.cancel, color: Colors.deepOrangeAccent),
                onPressed: clearSearch,
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: 10.0),
            Text(
              getTimeOfDayMessage(),
              style: TextStyle(
                color: Colors.red,
                letterSpacing: 5,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            buildScrollableRow(),
            SizedBox(height: 20.0),
            Text(
              'Drinks Menu',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            buildSixClickableBoxesAbove(),
            SizedBox(height: 20.0),
            buildSixClickableBoxesBelow(),
          ],
        ),
      ),
    );
  }

  Widget buildScrollableRow() {
    final List<String> items = [
      'Foods',
      'Drinks',
      'Something Light',
      'Cakes',
      'Groceries',
    ];

    final List<String> itemImages = [
      'assets/images/foodclipart.jpeg',
      'assets/images/drinksclipart.jpg',
      'assets/images/somethinglightclipart.jpeg',
      'assets/images/cakeclipart.png',
      'assets/images/groceryclipart.jpg',
    ];

    int selectedRowIndex = -1; // Track the selected row index

    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onHover: (value) {
                // Handle hover events
                // You can add additional hover effects if needed
              },
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedRowIndex == index
                          ? Colors.orange
                          : Colors.grey,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: Ink.image(
                        width: 2,
                        height: 2,
                        image: AssetImage(itemImages[index]),
                        fit: BoxFit.cover,
                        child: InkWell(
                          onTap: () => handleItemClick(context, index),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    items[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildSixClickableBoxesAbove() {
    final List<String> newBoxImages = [
      'assets/images/softdrinks.jpg',
      'assets/images/juice.jpg',
      'assets/images/coffeetea.jpeg',
    ];
    final List<String> drinkitems = [
      'Soft Drinks',
      'Fruit Juice',
      'Teas and Coffees',
    ];

    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newBoxImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: InkWell(
              onTap: () {
                handleNewBoxClick(context, index);
              },
              onHover: (value) {
                // Handle hover events
                // You can add additional hover effects if needed
              },
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: Ink.image(
                        width: 2,
                        height: 2,
                        image: AssetImage(newBoxImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    drinkitems[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildSixClickableBoxesBelow() {
    final List<String> newBoxImages = [
      'assets/images/wines.jpg',
      'assets/images/liquor.jpg',
      'assets/images/beer.jpg',
    ];
    final List<String> drinkitems = [
      'Wines ',
      'Liquor',
      'Beer',
    ];
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newBoxImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only (left: 10.0),
            child: InkWell(
              onTap: () {
                handleNewBoxClick(
                    context, index + 3); // Adjust index for below boxes
              },
              onHover: (value) {
                // Handle hover events
                // You can add additional hover effects if needed
              },
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: Ink.image(
                        width: 2,
                        height: 2,
                        image: AssetImage(newBoxImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    drinkitems[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void handleItemClick(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => menuPage()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => drinks()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => menuPage()));
        break;
      case 3:
      // Handle click on Cakes
        break;
      case 4:
      // Handle click on Groceries
        break;
      default:
        break;
    }
  }

  void handleNewBoxClick(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => localDishes()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => interDishes()));
        break;
      case 2:
      // Navigator.push(context,
      // MaterialPageRoute(builder: (context) => menuPage()));
        break;
      case 3:
      // Handle click on Cakes
        break;
      case 4:
      // Handle click on Groceries
        break;
      default:
        break;
    }
  }
}
