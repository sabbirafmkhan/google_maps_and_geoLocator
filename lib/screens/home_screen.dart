import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(
          zoom: 17,
          target: LatLng(23.81460772209191, 90.42415152104499),
        ),
        zoomControlsEnabled: true,
        compassEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        onTap: (LatLng latLng) {
          print(latLng);
        },
        onLongPress: (LatLng latLng) {
          print('Long press at : $latLng');
        },
        markers: {
          Marker(
            markerId: MarkerId('my-location'),
            position: LatLng(23.81460772209191, 90.42415152104499),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueCyan,
            ),
            infoWindow: InfoWindow(title: 'my location'),
          ),
          Marker(
            markerId: MarkerId('your-location'),
            position: LatLng(23.81460772209191, 90.42415152104499),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueGreen,
            ),
            infoWindow: InfoWindow(title: 'my location'),
          ),
          Marker(
            markerId: MarkerId('drag-location'),
            position: LatLng(23.81460772209191, 90.42415152104499),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueGreen,
            ),
            infoWindow: InfoWindow(title: 'my location'),
            visible: true,
            draggable: true,
            onDrag: (LatLng latLng) {},
            onDragStart: (LatLng startLatLng) {},
            onDragEnd: (LatLng endLatLng) {},
          ),
        },
        polylines: {
          Polyline(
            polylineId: PolylineId('Straight'),
            width: 8,
            color: Colors.purple,
            startCap: Cap.roundCap,
            endCap: Cap.roundCap,
            points: [
              LatLng(23.83690627671127, 90.41818628801182),
              LatLng(23.825050832163893, 90.46985636406872),
            ],
            jointType: JointType.round,
          ),
        },
        circles: {
          Circle(
            circleId: CircleId('virus'),
            center: LatLng(23.81460772209191, 90.42415152104499),
            radius: 500,
            strokeWidth: 3,
            strokeColor: Colors.red,
            fillColor: Colors.red.withOpacity(0.2),
          ),
        },
        polygons: {
          Polygon(
            polygonId: PolygonId('random'),
            fillColor: Colors.pink.withOpacity(0.2),
            strokeColor: Colors.yellow,
            strokeWidth: 4,
            points: [
              LatLng(23.83690627671127, 90.41818628801182),
              LatLng(23.825050832163893, 90.46985636406872),
            ],
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.train),
        onPressed: () {
          // _mapController.moveCamera(
          //   CameraUpdate.newCameraPosition(
          //     CameraPosition(
          //       target: LatLng(23.730694370560517, 90.41302529819471),
          //     ),
          //   ),
          // );
          _mapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                zoom: 14,
                target: LatLng(23.730694370560517, 90.41302529819471),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
