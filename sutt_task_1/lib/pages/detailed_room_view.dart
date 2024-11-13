import 'package:flutter/material.dart';

class DetailedRoomView extends StatefulWidget {
  final Map<String, Object> room;
  const DetailedRoomView({super.key, required this.room});

  @override
  State<DetailedRoomView> createState() => _DetailedRoomViewState();
}

class _DetailedRoomViewState extends State<DetailedRoomView> {
  late Map<String, Object> devices;

  @override
  void initState() {
    super.initState();
    // Create a local copy of the room's devices for toggling and adjustments
    devices = Map<String, Object>.from(widget.room)
      ..remove("name")
      ..remove("icon");
  }

  @override
  Widget build(BuildContext context) {
    final String roomName = widget.room["name"] as String;
    final IconData roomIcon = widget.room["icon"] as IconData;

    return Scaffold(
      appBar: AppBar(
        title: Text(roomName),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Room Icon and Name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(roomIcon, size: 50, color: Colors.blue),
                const SizedBox(width: 10),
                Text(
                  roomName,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Display list of devices
            Expanded(
              child: ListView(
                children: devices.entries
                    .map((entry) => DeviceWidget(
                          name: entry.key,
                          value: entry.value,
                          onToggle: (newValue) {
                            setState(() {
                              // Update the device state (1 or 0) when toggled
                              devices[entry.key] = newValue ? 1 : 0;
                            });
                          },
                          onAdjust: (newValue) {
                            setState(() {
                              // Update the temperature for devices like AC
                              (devices[entry.key] as Map)['temp'] = newValue;
                            });
                          },
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget to display each device with toggles and sliders
class DeviceWidget extends StatelessWidget {
  final String name;
  final Object value;
  final ValueChanged<bool>? onToggle;
  final ValueChanged<int>? onAdjust;

  const DeviceWidget(
      {super.key,
      required this.name,
      required this.value,
      this.onToggle,
      this.onAdjust});

  @override
  Widget build(BuildContext context) {
    Widget deviceWidget;

    // Check if the device is a simple on/off or has an adjustable setting
    if (value is int) {
      // Simple on/off device (like Fan, Light, etc.)
      deviceWidget = Row(
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 18),
          ),
          const Spacer(),
          Switch(
            value: value == 1, // Check if the device is ON (1) or OFF (0)
            onChanged: (newValue) {
              if (onToggle != null) {
                // Pass a bool (newValue) and convert it to int (1 or 0)
                onToggle!(newValue);
              }
            },
          ),
        ],
      );
    } else if (value is Map) {
      // For devices with adjustable settings (like AC with temperature)
      final int currentTemp =
          (value as Map)['temp'] ?? 20; // Default to 20 if no temp is set
      deviceWidget = Row(
        children: [
          Text(
            "$name (Temp)",
            style: const TextStyle(fontSize: 18),
          ),
          const Spacer(),
          Text(
            "$currentTemp°",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.thermostat, color: Colors.blue),
            onPressed: () {
              _showTempAdjustDialog(context, currentTemp);
            },
          ),
        ],
      );
    } else {
      deviceWidget = const Text("Unknown device type");
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: deviceWidget,
      ),
    );
  }

  // Function to show a slider dialog to adjust temperature
  void _showTempAdjustDialog(BuildContext context, int currentTemp) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int selectedTemp = currentTemp;
        return AlertDialog(
          title: const Text("Adjust Temperature"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "$selectedTemp°",
                style: const TextStyle(fontSize: 20),
              ),
              Slider(
                min: 16,
                max: 30,
                divisions: 14,
                value: selectedTemp.toDouble(),
                onChanged: (newValue) {
                  selectedTemp = newValue.toInt();
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (onAdjust != null) {
                  onAdjust!(selectedTemp);
                }
                Navigator.pop(context);
              },
              child: const Text("Set"),
            ),
          ],
        );
      },
    );
  }
}
