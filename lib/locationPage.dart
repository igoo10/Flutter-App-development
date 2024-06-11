import 'package:first/menuPage.dart';
import 'package:flutter/material.dart';
import 'package:first/firstClass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(locationPage());
}

class locationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocationScreen(),
    );
  }
}

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool _locationPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    checkLocationPermission();
  }

  Future<void> checkLocationPermission() async {
    var permissionStatus = await Permission.locationWhenInUse.status;
    setState(() {
      _locationPermissionGranted = permissionStatus.isGranted;
    });
  }

  Future<void> requestLocationPermission() async {
    var status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      setState(() {
        _locationPermissionGranted = true;
      });
      showLocationEnabledDialog();
    }
  }

  void showLocationEnabledDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Location Enabled'),
        content: Text('You have enabled location permission.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              navigateToNextScreen();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Location Permission is ${_locationPermissionGranted ? 'granted' : 'denied'}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
              ),
              onPressed: () {
                if (_locationPermissionGranted) {
                  showLocationEnabledDialog();
                } else if (!_locationPermissionGranted) {
                  requestLocationPermission().then((status) {
                    if (_locationPermissionGranted) {
                      setState(() {
                        _locationPermissionGranted = true;
                      });
                      showLocationEnabledDialog();
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => menuPage()));
                    }
                  });
                }
              },
              child: Text(_locationPermissionGranted ? 'Proceed' : 'Enable Location'),
            ),

            SizedBox(height: 10),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => menuPage()));
              },
              child: Text(
                "No, I'll do it later",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToNextScreen() {
    // Here you can navigate to the next screen or perform any action.
    print('User has allowed location permission. Navigating to the next screen...');
    // Navigating to another page after location is enabled
    Navigator.push(context, MaterialPageRoute(builder: (context) => menuPage()));
  }
}
