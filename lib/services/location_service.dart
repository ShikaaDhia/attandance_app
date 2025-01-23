import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<void> getGeoLocationPosition(BuildContext context, Function(Position) onPositionReceived) async {
 Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
 onPositionReceived(position);
}

Future<void> getAddressFromLongLat(Position position, Function(String) onAddressReceived) async{
 List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude); // latitude vertical, klo lontitude horizontal
 Placemark place = placemark[0];
 String address = "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
 onAddressReceived(address);
}

Future<bool> handleLocationPermission(BuildContext context) async {
 bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.location_off,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            "Location service is disabled, please enable it",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      backgroundColor: Colors.blueAccent,
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
    ));
    // untk memblokir user
    return false;
  }
 LocationPermission permission = await Geolocator.checkPermission();
 if (permission == LocationPermission.denied) {
   permission = await Geolocator.requestPermission();
   if (permission == LocationPermission.denied) {
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
       content: Row(
         children: [
           Icon(
             Icons.location_off,
             color: Colors.white,
           ),
           SizedBox(width: 10),
           Text(
             "Location permission is denied",
             style: TextStyle(color: Colors.white),
           )
         ],
       ),
       backgroundColor: Colors.blueAccent,
       shape: StadiumBorder(),
       behavior: SnackBarBehavior.floating,
     ));
     return false;
   }
 }

 if (permission == LocationPermission.deniedForever) {
   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
     content: Row(
       children: [
         Icon(
           Icons.location_off,
           color: Colors.white,
         ),
         SizedBox(width: 10),
         Text(
           "Location permission is denied forever",
           style: TextStyle(color: Colors.white),
         )
       ],
     ),
     backgroundColor: Colors.blueAccent,
     shape: StadiumBorder(),
     behavior: SnackBarBehavior.floating,
   ));
   return false;
 }
 return true;
}