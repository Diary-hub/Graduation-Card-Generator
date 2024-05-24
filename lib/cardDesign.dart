import 'package:flutter/material.dart';
import 'package:flutter_application_1/invitationDetails.dart';

class InnerScreen extends StatelessWidget {
  // List of image paths
  final List<String> imagePaths = [
    'assets/images/Birthday.png',
    'assets/images/Birthdayy.png',
    'assets/images/1.png',
    'assets/images/bb.png',
    'assets/images/2.png',
    'assets/images/Birth.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birthday Card'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/Pastel Feminine Flower Wedding Organizer Logo  (1).jpg'), // Replace 'background.jpg' with your image path
            fit: BoxFit.fill,
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

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/cardDetails.dart';
// import 'package:flutter_application_1/login.dart';

// class InnerScreen extends StatefulWidget {
//   @override
//   _InnerScreenState createState() => _InnerScreenState();
// }

// class _InnerScreenState extends State<InnerScreen> with SingleTickerProviderStateMixin {
//   // List of image paths
//   final List<String> imagePaths = [
//     'assets/images/Birthday.png',
//     'assets/images/Birthdayy.png',
//     'assets/images/1.png',
//     'assets/images/bb.png',
//     'assets/images/2.png',
//     'assets/images/Birth.png',
//   ];

//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 5, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 181, 207, 232),
//       appBar: AppBar(
//         title: Text('Category Items'),
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: [
//             Tab(text: 'Engagement'),
//             Tab(text: 'Wedding'),
//             Tab(text: 'Graduation'),
//             Tab(text: 'Birthday'),
//             Tab(text: 'Event'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           buildGridView(),
//           buildGridView(),
//           buildGridView(),
//           buildGridView(),
//           buildGridView(),
//         ],
//       ),
//     );
//   }

//   Widget buildGridView() {
//     return GridView.count(
//       crossAxisCount: 2,
//       children: List.generate(6, (index) {
//         return InkWell(
//           onTap: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) => CardDetailsScreen()));
//           },
//           child: Card(
//             elevation: 5,
//             margin: EdgeInsets.all(10),
//             child: Image.asset(
//               imagePaths[index],
//               fit: BoxFit.cover,
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
