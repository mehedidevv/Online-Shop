import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  final RxString selectedRadius = '40'.obs;
  final RxSet<Marker> markers = <Marker>{}.obs;
  GoogleMapController? mapController;

  final CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(23.8103, 90.4125), // Dhaka
    zoom: 12,
  );

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void updateRadius(String newRadius) {
    selectedRadius.value = newRadius;
  }

  void addMarker({required LatLng position, required String title}) {
    final marker = Marker(
      markerId: MarkerId(DateTime.now().toString()),
      position: position,
      infoWindow: InfoWindow(title: title),
    );
    markers.add(marker);
  }

  void clearMarkers() {
    markers.clear();
  }
}
