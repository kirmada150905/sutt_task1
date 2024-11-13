import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final Map<String, Object> room;
  const RoomCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Icon(
            room["icon"] as IconData,
            size: 50,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Text(
            room["name"].toString(),
            style: const TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
