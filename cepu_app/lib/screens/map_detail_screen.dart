import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; // Import flutter_map
import 'package:latlong2/latlong.dart'; // Import latlong2
import '../models/post.dart'; // Sesuaikan path model Post kamu

class MapDetailScreen extends StatelessWidget {
  final Post post;

  const MapDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    // Ambil koordinat dari objek post
    final double latitude = double.tryParse(post.latitude ?? '') ?? 0.0;
    final double longitude = double.tryParse(post.longitude ?? '') ?? 0.0;

    return Scaffold(
      appBar: AppBar(title: Text('Lokasi ${post.category ?? 'Detail'}')),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(latitude, longitude), // Titik tengah peta
          initialZoom: 15.0, // Level zoom
        ),
        children: [
          // Layer 1: Sumber Peta (OpenStreetMap)
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          // Layer 2: Marker (Penanda Lokasi)
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(latitude, longitude),
                width: 80,
                height: 80,
                child: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
