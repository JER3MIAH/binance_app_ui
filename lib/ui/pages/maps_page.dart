import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:food_delivery_app/ui/components/components.dart';
import 'package:food_delivery_app/secrets/secrets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  // final Completer<GoogleMapController> _googleMapController = Completer();

  final LatLng driverLocation = const LatLng(6.605874, 3.349149);
  final LatLng deliveryLocation = const LatLng(6.4999, 4.11667);

  List<LatLng> polylineCoordinates = [];

  late BitmapDescriptor driverIcon;
  late BitmapDescriptor deliveryIcon;

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleMapsApiKey,
      PointLatLng(driverLocation.latitude, driverLocation.longitude),
      PointLatLng(deliveryLocation.latitude, deliveryLocation.longitude),
      // travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    getPolyPoints();
    _loadMarkerImages();
    super.initState();
  }

  Future<void> _loadMarkerImages() async {
    driverIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(48, 48)),
        'assets/icons/driver.png');

    deliveryIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(48, 48)),
        'assets/icons/delivery-marker.png');

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            // onMapCreated: (controller) {},
            initialCameraPosition: CameraPosition(
              target: driverLocation,
              zoom: 12.0,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('driver'),
                position: driverLocation,
                icon: driverIcon,
                infoWindow: const InfoWindow(title: 'Driver\'s Location'),
              ),
              Marker(
                markerId: const MarkerId('delivery'),
                position: deliveryLocation,
                icon: deliveryIcon,
                infoWindow: const InfoWindow(title: 'Delivery Location'),
              ),
            },
            polylines: {
              Polyline(
                polylineId: const PolylineId('route'),
                points: polylineCoordinates,
              )
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const LightBackButton(
                        size: 19,
                      ),
                      FillerContainer(
                        icon: Icons.my_location_outlined,
                        onTap: () {},
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              detailsTile(
                                title: '10 - 15 minutes',
                                icon: Icons.access_time,
                                subtitle: 'Delivery time',
                              ),
                              detailsTile(
                                title: '70 Washington Square',
                                icon: Icons.location_on_outlined,
                                subtitle: 'Delivery address',
                              ),
                              const SizedBox(height: 100),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 8, left: 2),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: SizedBox(
                            height: 70,
                            width: 70,
                            child: CircleAvatar(
                              child:
                                  Image.asset('assets/images/avatar-image.png'),
                            ),
                          ),
                          title: Text(
                            'Jordan Keith',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Courier',
                              style: GoogleFonts.montserrat(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w400)),
                          trailing: const LightFillerContainer(
                            icon: Icons.call,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListTile detailsTile(
      {required String title,
      required String subtitle,
      required IconData icon}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: LightFillerContainer(
        icon: icon,
      ),
      title: Text(
        title,
        style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
      ),
      subtitle:
          Text(subtitle, style: GoogleFonts.lato(fontWeight: FontWeight.w400)),
    );
  }
}
