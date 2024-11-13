import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package
import "package:simple_icons/simple_icons.dart";

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  // Function to launch URL in the default web browser
  Future<void> _launchURL() async {
    // Replace with your GitHub URL
    const String url = "https://github.com/kirmada150905";
    final Uri uri = Uri.parse(url);

    // Check if the URL can be launched
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,
          mode: LaunchMode.externalApplication); // Open in web browser
    } else {
      throw 'Could not launch $url'; // If URL cannot be launched
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Information"),
        backgroundColor: Colors.blue, // Customize the color of the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // Page Title
            const Text(
              "App Information",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // App Description
            const Text(
              "This App is made to showcase various kinds of Widgets offered by Flutter's MaterialApp",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // App Icon or Image
            const Center(
              child: Icon(
                Icons.info_outline,
                size: 100,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),

            // Additional Info
            const Text(
              "Version: 1.0.0",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              "Developed by: Kirmada150905",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),

            // GitHub Link with Icon and "Linked" Text
            GestureDetector(
              onTap: _launchURL, // Trigger the URL launch when tapped
              child: // GitHub Icon with Border
                  Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Makes the border circular
                  border: Border.all(
                      color: Colors.black,
                      width: 2.0), // Border color and width
                ),
                child: const Padding(
                  padding: EdgeInsets.all(
                      4.0), // Controls the space between the icon and border
                  child: Icon(
                    SimpleIcons.github,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // More Details Button
            ElevatedButton(
              onPressed: () {
                // Handle action, such as opening a website or navigating to another page
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('More details coming soon!')),
                );
              },
              child: const Text('Learn More'),
            ),
          ],
        ),
      ),
    );
  }
}
