import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(33.6844, 73.0479), zoom: 14);

  List<Marker> _marker = [];
  List<Marker> list = [
    const Marker(
      markerId: MarkerId("1"),
      position: LatLng(33.6844, 73.0479),
      infoWindow: InfoWindow(title: "My Position"),
    ),
    const Marker(
      markerId: MarkerId("2"),
      position: LatLng(39.6844, 80.0479),
      infoWindow: InfoWindow(title: "My Position"),
    ),
    const Marker(
      markerId: MarkerId("3"),
      position: LatLng(37.6844, 79.0479),
      infoWindow: InfoWindow(title: "My Position"),
    ),
    const Marker(
      markerId: MarkerId("4"),
      position: LatLng(35.6844, 75.0479),
      infoWindow: InfoWindow(title: "My Position"),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        markers: Set<Marker>.of(list),
        compassEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: _cameraPosition,
      ),
    );
  }
}
