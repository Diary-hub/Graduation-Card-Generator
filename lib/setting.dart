// import 'package:flutter/material.dart';
// class SettingsPage extends StatefulWidget {
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   bool enableNotifications = true;
//   double brightnessValue = 0.5;
//   String selectedTheme = 'Light';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings'),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/Pastel Feminine Flower Wedding Organizer Logo  (1).jpg'), // Background image asset path
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Notification Settings',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SwitchListTile(
//                 title: Text('Enable Notifications'),
//                 value: enableNotifications,
//                 onChanged: (value) {
//                   setState(() {
//                     enableNotifications = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Display Settings',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               Slider(
//                 value: brightnessValue,
//                 onChanged: (value) {
//                   setState(() {
//                     brightnessValue = value;
//                   });
//                 },
//                 min: 0.0,
//                 max: 1.0,
//                 divisions: 10,
//                 label: 'Brightness: ${brightnessValue.toStringAsFixed(1)}',
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Theme Settings',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               DropdownButton<String>(
//                 value: selectedTheme,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedTheme = value!;
//                   });
//                 },
//                 items: ['Light', 'Dark', 'System Default']
//                     .map((theme) => DropdownMenuItem<String>(
//                           value: theme,
//                           child: Text(theme),
//                         ))
//                     .toList(),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () => _showDeleteAccountDialog(context),
//                 child: Text('Delete Account'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showDeleteAccountDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Delete Account'),
//           content: Text('Are you sure you want to delete your account?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 // TODO: Add logic to delete the account
//                 // For now, just print a message
//                 print('Account deleted!');
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text(
//                 'Delete',
//                 style: TextStyle(color: Colors.red),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool enableNotifications = true;
  double brightnessValue = 0.5;
  String selectedTheme = 'Light';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        title: Text('Settings'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/images/Pastel Feminine Flower Wedding Organizer Logo  (1).jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notification Settings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SwitchListTile(
                title: Text('Enable Notifications'),
                value: enableNotifications,
                onChanged: (value) {
                  setState(() {
                    enableNotifications = value;
                    _updateNotificationSetting(value);
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Display Settings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Slider(
                value: brightnessValue,
                onChanged: (value) {
                  setState(() {
                    brightnessValue = value;
                    _updateBrightnessSetting(value);
                  });
                },
                min: 0.0,
                max: 1.0,
                divisions: 10,
                label: 'Brightness: ${brightnessValue.toStringAsFixed(1)}',
              ),
              SizedBox(height: 20),
              Text(
                'Theme Settings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: selectedTheme,
                onChanged: (value) {
                  setState(() {
                    selectedTheme = value!;
                    _updateThemeSetting(value);
                  });
                },
                items: ['Light', 'Dark', 'System Default']
                    .map((theme) => DropdownMenuItem<String>(
                          value: theme,
                          child: Text(theme),
                        ))
                    .toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _showDeleteAccountDialog,
                child: Text('Delete Account'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _logout,
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: mybottom(pageIndex: 4),
    );
  }

  void _updateNotificationSetting(bool value) {
    // Update notification setting in Firestore
    _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      'enableNotifications': value,
    });
  }

  void _updateBrightnessSetting(double value) {
    // Update brightness setting in Firestore
    _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      'brightnessValue': value,
    });
  }

  void _updateThemeSetting(String value) {
    // Update theme setting in Firestore
    _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      'selectedTheme': value,
    });
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text('Are you sure you want to delete your account?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: _deleteAccount,
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteAccount() async {
    try {
      await _auth.currentUser!.delete();
      print('Account deleted successfully.');
      Navigator.of(context).pop(); // Close the dialog
      // Navigate to login screen after account deletion
      // Navigator.of(context).pushReplacementNamed('/login'); // Replace with your login route
    } catch (e) {
      print('Error deleting account: $e');
      // Display error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete account. Please try again.'),
        ),
      );
    }
  }

  Future<void> _logout() async {
    try {
      await _auth.signOut();
      print('User logged out successfully.');
      // Navigate to login screen after logout
      // Navigator.of(context).pushReplacementNamed('/login'); // Replace with your login route
    } catch (e) {
      print('Error logging out: $e');
      // Display error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to logout. Please try again.'),
        ),
      );
    }
  }
}
