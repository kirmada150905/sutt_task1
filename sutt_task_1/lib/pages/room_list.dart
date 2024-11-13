import 'package:flutter/material.dart';
import 'package:sutt_task_1/data/room_data.dart';
import 'package:sutt_task_1/pages/detailed_room_view.dart';
import 'package:sutt_task_1/pages/room_card.dart';

class RoomList extends StatelessWidget {
  RoomList({super.key});
  final rooms = roomData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select Room"),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: Center(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailedRoomView(room: rooms[index]),
                      ),
                    );
                  },
                  child: RoomCard(room: rooms[index]),
                );
              },
              padding: const EdgeInsets.all(8),
            ),
          ),
        ));
  }
}
