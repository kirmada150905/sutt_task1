import 'package:flutter/material.dart';

class DetailedRoomView extends StatefulWidget {
  final Map<String, Object> room;
  const DetailedRoomView({super.key, required this.room});

  @override
  State<DetailedRoomView> createState() => _DetailedRoomViewState();
}

class _DetailedRoomViewState extends State<DetailedRoomView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          widget.room["name"].toString(),
        ),
      ),
    );
  }
}
