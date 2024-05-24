import 'package:flutter/material.dart';
import 'package:flutter_application_1/contacrsupport.dart';
import 'package:flutter_application_1/feedback.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.99,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to the Amazing Help Page!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Here you can find useful information and instructions on how to make the most of our application.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 32),
              Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'How to Get Started:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '1. Create an account: Go to the profile section and create your account.',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '2. Explore Features: Check out different sections to explore features.',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '3. Contact Support: If you have any issues, feel free to contact our support team.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedbackPage()),
                    ); // Navigate to feedback page
                  },
                  child: Text('Provide Feedback'),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactSupportScreen()),
                    ); // Add functionality or navigate to a contact page
                  },
                  child: Text('Contact Support'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
