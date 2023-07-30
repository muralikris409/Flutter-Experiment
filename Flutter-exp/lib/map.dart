import "package:flutter/material.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  @override
  Widget build(BuildContext context) {
    BitmapDescriptor marker=BitmapDescriptor.defaultMarker;
    void customMarker(){
      BitmapDescriptor.fromAssetImage(ImageConfiguration(), "assets/img.png").then((value) => marker=value);
    }


    return  Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: GoogleMap(initialCameraPosition: const CameraPosition(target: LatLng(
              10,22),
              zoom: 14.3,

            ),
            markers: {
              const Marker(markerId: MarkerId("User_loc"),
              position:LatLng(10,22),
              ),

              },





            ),
          ),



        ),
      ),
    );
  }
}
