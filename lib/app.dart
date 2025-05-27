import 'package:flutter/material.dart';
import 'package:google_maps_and_geolocator/screens/home_screen.dart';

class GoogleMapAndGeoLocator extends StatelessWidget {
  const GoogleMapAndGeoLocator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
