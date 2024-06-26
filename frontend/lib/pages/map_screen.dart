import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  TextEditingController searchController = TextEditingController();
  LatLng _initialPosition = LatLng(6.9271, 79.8612);
  LatLng _searchPosition = LatLng(6.9271, 79.8612);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _searchLocation() async {
    String searchAddress = searchController.text;
    List<Location> locations = await locationFromAddress(searchAddress);
    if (locations.isNotEmpty) {
      Location location = locations.first;
      _searchPosition = LatLng(location.latitude, location.longitude);
      mapController?.animateCamera(CameraUpdate.newLatLng(_searchPosition));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mango Map Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Enter a location',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchLocation,
                ),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 10.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('searchLocation'),
                  position: _searchPosition,
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
