// import 'package:flutter/material.dart';

// void main() {
//   runApp(CanvaApp());
// }

// class CanvaApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Canva Clone',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CanvaHomePage(),
//     );
//   }
// }

// class CanvaHomePage extends StatefulWidget {
//   @override
//   _CanvaHomePageState createState() => _CanvaHomePageState();
// }

// class _CanvaHomePageState extends State<CanvaHomePage> {
//   String? _backgroundImagePath; // Background image path
//   Color _backgroundColor = Colors.white; // Background color
//   int _selectedTemplateIndex = -1; // No template selected initially

//   void _selectTemplate(int index) {
//     setState(() {
//       _selectedTemplateIndex = index;
//     });
//   }

//   void _changeBackgroundColor(Color color) {
//     setState(() {
//       _backgroundColor = color;
//     });
//   }

//   void _changeBackgroundImage(String? imagePath) {
//     setState(() {
//       _backgroundImagePath = imagePath;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Canva Clone'),
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           if (_backgroundImagePath != null)
//             Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(_backgroundImagePath!),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           Center(
//             child: _selectedTemplateIndex == -1
//                 ? Text('')
//                 : Text('Template ${_selectedTemplateIndex + 1}'),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             Radio(
//               value: 'assets/images/engagement.jpg', // Make sure this path is correct
//               groupValue: _backgroundImagePath,
//               onChanged: (value) {
//                 _changeBackgroundImage(value);
//                 _changeBackgroundColor(const Color.fromARGB(255, 93, 85, 85)); // Example background color change
//               },
//             ),
//             Radio(
//               value: 'e_.png', // Make sure this path is correct
//               groupValue: _backgroundImagePath,
//               onChanged: (value) {
//                 _changeBackgroundImage(value);
//                 _changeBackgroundColor(Colors.white); // Example background color change
//               },
//             ),
//             Radio(
//               value: 'assets/images/engagement.jpg', // Make sure this path is correct
//               groupValue: _backgroundImagePath,
//               onChanged: (value) {
//                 _changeBackgroundImage(value);
//                 _changeBackgroundColor(Colors.white); // Example background color change
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Example for changing background image path
//           // You can replace this with your image selection logic
//           _changeBackgroundImage('assets/images/engagement.jpg');
//           _changeBackgroundColor(Colors.white); // Example background color change
//         },
//         tooltip: 'Change Background Image',
//         child: Icon(Icons.image),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CardCelebration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ECardPage(),
    );
  }
}

class ECardPage extends StatefulWidget {
  @override
  _ECardPageState createState() => _ECardPageState();
}

class _ECardPageState extends State<ECardPage> {
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  String text1 = '';
  String text2 = '';
  String text3 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Card Celebration'),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue, // Blue color
                    Colors.green, // Green color
                    Colors.pink, // Pink color
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.white, // Change to any color you want to apply to the image
                  BlendMode.modulate, // You can change the blend mode as per your requirement
                ),
                child: Image.asset(
                  'assets/images/card.jpg', // Replace with your image asset
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: TextField(
                controller: textController1,
                style: TextStyle(
                  fontSize: 18,
                ),
                obscureText: true, // Hides the entered text
                decoration: InputDecoration(
                  hintText: 'Add your text here',
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Adjust text field size here
                ),
                onChanged: (value) {
                  setState(() {
                    text1 = value;
                  });
                },
              ),
            ),
            Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: TextField(
                controller: textController2,
                style: TextStyle(
                  fontSize: 18,
                ),
                obscureText: true, // Hides the entered text
                decoration: InputDecoration(
                  hintText: 'Add your text here',
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Adjust text field size here
                ),
                onChanged: (value) {
                  setState(() {
                    text2 = value;
                  });
                },
              ),
            ),
            Positioned(
              top: 180,
              left: 20,
              right: 20,
              child: TextField(
                controller: textController3,
                style: TextStyle(
                  fontSize: 18,
                ),
                obscureText: true, // Hides the entered text
                decoration: InputDecoration(
                  hintText: 'Add your text here',
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Adjust text field size here
                ),
                onChanged: (value) {
                  setState(() {
                    text3 = value;
                  });
                },
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Text(
                '$text1\n$text2\n$text3',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    super.dispose();
  }
}
