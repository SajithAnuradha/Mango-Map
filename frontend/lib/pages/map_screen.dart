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
      body: Stack(
        children: [
          GoogleMap(
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
          Positioned(
            top: 40.0,
            left: 15.0,
            right: 15.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Enter a location',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: _searchLocation,
                  ),
                  IconButton(
                    icon: Icon(Icons.local_fire_department, color: Colors.red),
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
