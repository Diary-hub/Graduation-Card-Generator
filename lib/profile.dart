import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/history.dart';
import 'package:flutter_application_1/setting.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User? _user;

  @override
  void initState() {
    super.initState();
    _getUserProfile();
  }

  Future<void> _getUserProfile() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    setState(() {
      _user = currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 181, 207, 232),
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor:
            Color.fromARGB(255, 181, 207, 232), // Customize the app bar color
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/Pastel Feminine Flower Wedding Organizer Logo  (1).jpg'), // Background image asset path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: _user != null
                    ? NetworkImage(_user!.photoURL ??
                        'https://media.istockphoto.com/id/1393750072/vector/flat-white-icon-man-for-web-design-silhouette-flat-illustration-vector-illustration-stock.jpg?s=612x612&w=0&k=20&c=s9hO4SpyvrDIfELozPpiB_WtzQV9KhoMUP9R9gVohoU=')
                    : null,
                // Placeholder or default image if user's profile photo is not available
                child: _user == null
                    ? Icon(Icons.person,
                        size: 70, color: const Color.fromARGB(255, 0, 0, 0))
                    : null,
              ),
              SizedBox(height: 16),
              Text(
                _user?.displayName ??
                    '', // Display user's name or fallback to 'Guest'
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                _user?.email ?? '', // Display user's email
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 16),
              _buildProfileCard(
                title: 'My Card',
                icon: Icons.card_giftcard,

                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ECardHistoryPage())); // Handle "Settings" tap
                }, // Handle "My Card" tap
              ),
              _buildProfileCard(
                title: 'Settings',
                icon: Icons.settings,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SettingsPage())); // Handle "Settings" tap
                },
              ),
              // Add more profile cards or content as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, size: 30, color: Colors.green),
        title: Text(title, style: TextStyle(fontSize: 18)),
        onTap: onTap,
      ),
    );
  }
}
