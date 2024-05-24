import 'package:flutter/material.dart';
import 'package:flutter_application_1/invitationDetails.dart';

class engagmentcard extends StatelessWidget {
  // List of image paths
  final List<String> imagePaths = [
    'assets/images/engamement.png',
    'assets/images/engagement1.png',
    'assets/images/engagement3.png',
    'assets/images/engagement7.png',
    'assets/images/engagement5.png',
    'assets/images/engagement6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Engagement Card'),
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height * 0.99,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/Pastel Feminine Flower Wedding Organizer Logo  (1).jpg'), // Replace 'background.jpg' with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InvitationDetails(
                      selectedImagePath:
                          imagePaths[index], // Pass selected image path
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Image.asset(
                  imagePaths[index],
                  fit: BoxFit.fill,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
