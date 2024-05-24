import 'package:flutter/material.dart';
import 'package:flutter_application_1/invitationDetails.dart';

class WeddingCard extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/wedding1.png',
    'assets/images/w2.png',
    'assets/images/w3.png',
    'assets/images/w6.png',
    'assets/images/w5.png',
    'assets/images/w4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 181, 207, 232),
      appBar: AppBar(
        title: Text('Wedding Card'),
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


// class CardDetailsScreen extends StatefulWidget {
//   final String imagePath;

//   // Constructor with named parameter imagePath
//   CardDetailsScreen({required this.imagePath});

//   @override
//   _CardDetailsScreenState createState() => _CardDetailsScreenState();
// }

// class _CardDetailsScreenState extends State<CardDetailsScreen> {
//   final TextEditingController _textFieldController1 = TextEditingController();
//   final TextEditingController _textFieldController2 = TextEditingController();
//   final TextEditingController _textFieldController3 = TextEditingController();
//   final TextEditingController _textFieldController4 = TextEditingController();
//   final TextEditingController _textFieldController5 = TextEditingController();

//   void _saveDetails() {
//     // Retrieve entered details from text fields
//     String detail1 = _textFieldController1.text;
//     String detail2 = _textFieldController2.text;
//     String detail3 = _textFieldController3.text;
//     String detail4 = _textFieldController4.text;
//     String detail5 = _textFieldController5.text;

//     // Print the retrieved details (You can implement saving logic here)
//     print('Detail 1: $detail1');
//     print('Detail 2: $detail2');
//     print('Detail 3: $detail3');
//     print('Detail 4: $detail4');
//     print('Detail 5: $detail5');

//     // Clear text fields after saving
//     _textFieldController1.clear();
//     _textFieldController2.clear();
//     _textFieldController3.clear();
//     _textFieldController4.clear();
//     _textFieldController5.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//        // title: Text('Card Details'),
//       ),
//        body: Container(
//         // height: MediaQuery.of(context).size.height * 0.99,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//                 'assets/images/Pastel Feminine Flower Wedding Organizer Logo  (1).jpg'), // Replace 'background.jpg' with your image path
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: GridView.count(
//           crossAxisCount: 2,
//           children: List.generate(6, (index) {
//             return InkWell(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => InvitationDetails(
//                       selectedImagePath:
//                           imagePaths[index], // Pass selected image path
//                     ),
//                   ),
//                 );
//               },
//               child: Card(
//                 elevation: 5,
//                 margin: EdgeInsets.all(10),
//                 child: Image.asset(
//                   imagePaths[index],
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }

// //       body: Stack(
// //         fit: StackFit.expand,
// //         children: [
// //           // Displayed image
// //           Image.asset(
// //             widget.imagePath,
// //             fit: BoxFit.cover,
// //           ),
// //           // Column for text fields below the image
// //           Positioned.fill(
// //             child: SingleChildScrollView(
// //               padding: EdgeInsets.all(16.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.stretch,
// //                 children: [
// //                   SizedBox(height: 66),
// //                   // Text fields for image details
// //                   TextFormField(
// //                     controller: _textFieldController1,
// //                     decoration: InputDecoration(
// //                       // labelText: 'Detail 1',
// //                       // border: OutlineInputBorder(),
// //                     ),
// //                   ),
// //                   SizedBox(height: 10.0),
// //                   TextFormField(
// //                     controller: _textFieldController2,
// //                     decoration: InputDecoration(
// //                       // labelText: 'Detail 2',
// //                       // border: OutlineInputBorder(),
// //                     ),
// //                   ),
// //                   SizedBox(height: 10.0),
// //                   TextFormField(
// //                     controller: _textFieldController3,
// //                     decoration: InputDecoration(
// //                       // labelText: 'Detail 3',
// //                       // border: OutlineInputBorder(),
// //                     ),
// //                   ),
// //                   SizedBox(height: 10.0),
// //                   TextFormField(
// //                     controller: _textFieldController4,
// //                     decoration: InputDecoration(
// //                       // labelText: 'Detail 4',
// //                       // border: OutlineInputBorder(),
// //                     ),
// //                   ),
// //                   SizedBox(height: 10.0),
// //                   TextFormField(
// //                     controller: _textFieldController5,
// //                     decoration: InputDecoration(
// //                       // labelText: 'Detail 5',
// //                       // border: OutlineInputBorder(),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _saveDetails,
// //         tooltip: 'Save',
// //         child: Icon(Icons.save),
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     // Clean up the controllers when the widget is disposed
// //     _textFieldController1.dispose();
// //     _textFieldController2.dispose();
// //     _textFieldController3.dispose();
// //     _textFieldController4.dispose();
// //     _textFieldController5.dispose();
// //     super.dispose();
// //   }
// // }



