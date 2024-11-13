import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sutt_task_1/theme_provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _darkMode = false;
  bool _notificationsEnabled = true;
  String _username = "User123"; // Placeholder for username

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // Add save logic or show confirmation
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Settings saved")),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            const Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Username Field
            ListTile(
              title: const Text('Username'),
              subtitle: Text(_username),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // Open dialog to edit username
                  _editUsernameDialog();
                },
              ),
            ),

            // Dark Mode Toggle
            SwitchListTile(
              title: const Text('Enable Dark Mode'),
              value: _darkMode,
              onChanged: (bool value) {
                setState(() {
                  _darkMode = !_darkMode;
                  themeProvider.toggleTheme();
                });
              },
            ),

            // Notification Toggle
            SwitchListTile(
              title: const Text('Enable Notifications'),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),

            const Divider(),

            // Profile Picture Section
            ListTile(
              title: const Text('Profile Picture'),
              leading: const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person),
              ),
              onTap: () {
                // Handle profile picture change
              },
            ),

            const Divider(),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // Save settings logic (e.g., persist preferences)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Settings Saved')),
                );
              },
              child: const Text('Save Settings'),
            ),
          ],
        ),
      ),
    );
  }

  // Dialog to edit username
  void _editUsernameDialog() {
    TextEditingController _controller = TextEditingController(text: _username);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Username'),
          content: TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: 'Enter new username'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _username = _controller.text;
                });
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
