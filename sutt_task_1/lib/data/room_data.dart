import 'package:flutter/material.dart';

List<Map<String, Object>> roomData = [
  {
    "name": "Living Room",
    "Fan": 1,
    "Light": 1,
    "AC": {"temp": 20},
    "icon": Icons.weekend,  // Sofa icon for living room
  },
  {
    "name": "Kitchen",
    "Fan": 1,
    "Light": 1,
    "Stove": {"On": 1},
    "icon": Icons.kitchen,  // Kitchen icon
  },
  {
    "name": "Bedroom",
    "Fan": 1,
    "Light": 1,
    "AC": {"temp": 20},
    "icon": Icons.bed,  // Bed icon for bedroom
  },
  {
    "name": "Bathroom",
    "Fan": 0,
    "Light": 1,
    "Geyser": {"On": 0},
    "icon": Icons.bathtub,  // Bathtub icon for bathroom
  },
  {
    "name": "Dining Room",
    "Fan": 1,
    "Light": 2,
    "icon": Icons.restaurant,  // Dining icon
  },
  {
    "name": "Study Room",
    "Fan": 1,
    "Light": 1,
    "Heater": {"On": 0},
    "icon": Icons.book,  // Book icon for study room
  },
  {
    "name": "Garage",
    "Fan": 0,
    "Light": 1,
    "icon": Icons.garage,  // Garage icon
  },
  {
    "name": "Laundry Room",
    "Fan": 0,
    "Light": 1,
    "Washer": {"On": 1},
    "icon": Icons.local_laundry_service,  // Laundry icon
  }
];
