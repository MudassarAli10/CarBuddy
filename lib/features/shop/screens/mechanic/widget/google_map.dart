import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';

class GoogleMapScreen extends StatefulWidget {
  final Function(LatLng) onLocationSelected;
  final Function(String, LatLng) onSendMessage;

  const GoogleMapScreen({
    super.key,
    required this.onLocationSelected,
    required this.onSendMessage,
  });

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(31.4504, 73.1350), zoom: 11);
  final Set<Marker> _markers = {};

  final DatabaseReference mechanicsRef = FirebaseDatabase.instance.ref().child('mechanics');

  @override
  void initState() {
    super.initState();
    _fetchMechanics();
  }

  void _fetchMechanics() {
    mechanicsRef.onValue.listen((event) {
      final mechanics = event.snapshot.value as Map?;
      if (mechanics != null) {
        _markers.clear();
        mechanics.forEach((key, value) {
          final marker = Marker(
            markerId: MarkerId(key),
            position: LatLng(value['latitude'], value['longitude']),
            infoWindow: InfoWindow(
              title: 'Mechanic Shop',
              onTap: () {
                widget.onSendMessage(key, LatLng(value['latitude'], value['longitude']));
              },
            ),
          );
          setState(() {
            _markers.add(marker);
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        initialCameraPosition: _kGooglePlex,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: widget.onLocationSelected,
      ),
    );
  }
}
