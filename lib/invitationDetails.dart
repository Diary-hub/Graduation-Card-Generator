import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/history.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class InvitationDetails extends StatefulWidget {
  final String selectedImagePath;

  InvitationDetails({required this.selectedImagePath});

  @override
  State<InvitationDetails> createState() => _InvitationDetailsState();
}

class _InvitationDetailsState extends State<InvitationDetails> {
  String selectedCardType = 'Wedding';
  TextEditingController detailsController = TextEditingController();
  TextEditingController detailssController = TextEditingController();
  TextEditingController detailssssController = TextEditingController();
  TextEditingController coupleNameController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invitation Details'),
      ),
      backgroundColor: Color.fromARGB(255, 181, 207, 232),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top: 20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Select Title',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton<String>(
                value: selectedCardType,
                onChanged: (String? newValue) {
                  setState(() {
                    if (newValue != null) {
                      selectedCardType = newValue;
                    }
                  });
                },
                items: <String>['Wedding', 'Birthday', 'Engagement', 'Graduation']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 10),
              Text(
                'Please Enter Details:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: detailsController,
                decoration: InputDecoration(
                  labelText: 'Details',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: detailssController,
                decoration: InputDecoration(
                  labelText: 'Details',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: detailssssController,
                decoration: InputDecoration(
                  labelText: 'Details',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Date',
                          border: OutlineInputBorder(),
                        ),
                        child: Text('${selectedDate.toLocal()}'.split(' ')[0]),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectTime(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Time',
                          border: OutlineInputBorder(),
                        ),
                        child: Text('${selectedTime.format(context)}'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Couple Name (Optional)'),
              TextFormField(
                controller: coupleNameController,
                decoration: InputDecoration(
                  labelText: 'Couple Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String detailsText = detailsController.text;
                  String detailssText = detailssController.text;
                  String detailssssText = detailssssController.text;
                  String coupleNameText = coupleNameController.text;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardDetailsScreen(
                        imagePath: widget.selectedImagePath,
                        details: detailsText,
                        Detailss: detailssText,
                        Detailssss: detailssssText,
                        date: selectedDate,
                        time: selectedTime,
                        coupleName: coupleNameText,
                      ),
                    ),
                  );
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardDetailsScreen extends StatefulWidget {
  final String imagePath;
  final String details;
  final String Detailss;
  final String Detailssss;
  final DateTime date;
  final TimeOfDay time;
  final String coupleName;

  CardDetailsScreen({
    required this.imagePath,
    required this.details,
    required this.Detailss,
    required this.Detailssss,
    required this.date,
    required this.time,
    required this.coupleName,
  });

  @override
  _CardDetailsScreenState createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  ColorFilter? _selectedColorFilter;
  String _selectedFont = 'Roboto';
  Color _selectedTextColor = Colors.black; // Default text color

  final Map<String, TextStyle> _fontStyles = {
    'Roboto': GoogleFonts.roboto(),
    'Lobster': GoogleFonts.lobster(),
    'OpenSans': GoogleFonts.openSans(),
    'Pacifico': GoogleFonts.pacifico(),
  };

  // ignore: unused_field
  Uint8List? _imageFile;
  ScreenshotController screenshotController = ScreenshotController();

  Future<void> uploadImageToFirebase(File imageFile) async {
    try {
      // Create a reference to the Firebase Storage location
      final phone = await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((json) => json['phone']);

      final String name = 'screenshot_${DateTime.now().millisecondsSinceEpoch}.png';

      final storageReference = FirebaseStorage.instance.ref().child(phone).child(name);

      // Upload the file
      final uploadTask = storageReference.putFile(imageFile);
      await uploadTask.whenComplete(() async {
        final downloadUrl = await storageReference.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('user')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('history')
            .add(
          {
            'image': downloadUrl,
            'name': name,
          },
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Card Has Been Created!'),
          backgroundColor: Colors.orangeAccent[300],
        ));
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ECardHistoryPage(),
        ));
      });
    } catch (error) {
      print('Error uploading image to Firebase: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('Card Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Screenshot(
              controller: screenshotController,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Image with applied color filter
                  ColorFiltered(
                    colorFilter: _selectedColorFilter ??
                        ColorFilter.mode(Colors.transparent, BlendMode.saturation),
                    child: Image.asset(
                      widget.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 60,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Dropdown for font selection

                          SizedBox(height: 10),
                          // Existing text with selected font and color
                          _buildTextWidget(widget.details),
                          SizedBox(height: 10),
                          _buildTextWidget('Date: ${widget.date.toString()}'),
                          SizedBox(height: 10),
                          _buildTextWidget(widget.Detailss),
                          SizedBox(height: 10),
                          _buildTextWidget(widget.Detailssss),
                          SizedBox(height: 10),
                          _buildTextWidget('Time: ${widget.time.format(context)}'),
                          SizedBox(height: 10),
                          _buildTextWidget(widget.coupleName),

                          // Row of filter buttons
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: DropdownButton<String>(
                  value: _selectedFont,
                  onChanged: (String? newFont) {
                    setState(() {
                      _selectedFont = newFont!;
                    });
                  },
                  items: _fontStyles.keys.map<DropdownMenuItem<String>>((String font) {
                    return DropdownMenuItem<String>(
                      value: font,
                      child: Text(font),
                    );
                  }).toList(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFilterButton('Grayscale', Colors.grey),
                _buildFilterButton('Sepia', Colors.brown),
                _buildFilterButton('Invert', Colors.black),
                _buildFilterButton('Yellow', Color.fromARGB(255, 229, 243, 33)),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          screenshotController
              .capture(delay: Duration(milliseconds: 10))
              .then((capturedImage) async {
            // Save the captured image to a temporary file
            final directory = await getTemporaryDirectory();
            final imagePath = path.join(directory.path, 'screenshot.png');
            final imageFile = File(imagePath);
            await imageFile.writeAsBytes(capturedImage!);
            // Upload the file to Firebase Storage
            await uploadImageToFirebase(imageFile);
            setState(() {
              _imageFile = capturedImage;
            });
          }).catchError((onError) {
            print(onError);
          });
        },
        child: Icon(Icons.save),
      ),
    );
  }

  Widget _buildTextWidget(String text) {
    return GestureDetector(
      onTap: () {
        _openColorPicker();
      },
      child: Text(
        text,
        style: _fontStyles[_selectedFont]!.copyWith(
          fontSize: 16,
          color: _selectedTextColor,
        ),
      ),
    );
  }

  Widget _buildFilterButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (text == 'Grayscale') {
            _selectedColorFilter = ColorFilter.mode(Colors.grey, BlendMode.saturation);
          } else if (text == 'Sepia') {
            _selectedColorFilter = ColorFilter.matrix(<double>[
              0.393,
              0.769,
              0.189,
              0,
              0,
              0.349,
              0.686,
              0.168,
              0,
              0,
              0.272,
              0.534,
              0.131,
              0,
              0,
              0,
              0,
              0,
              1,
              0,
            ]);
          } else if (text == 'Invert') {
            _selectedColorFilter = ColorFilter.matrix(<double>[
              -1,
              0,
              0,
              0,
              255,
              0,
              -1,
              0,
              0,
              255,
              0,
              0,
              -1,
              0,
              255,
              0,
              0,
              0,
              1,
              0,
            ]);
          } else if (text == 'Yellow') {
            _selectedColorFilter = ColorFilter.matrix(<double>[
              1, 0, 0, 0, 0, // Red channel (no change)
              0, 1, 0, 0, 0, // Green channel (no change)
              0, 0, -1, 0, 0, // Blue channel (invert)
              0, 0, 0, 1, 0, // Alpha channel (no change)
            ]);
          }
        });
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  void _openColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _selectedTextColor,
              onColorChanged: (Color color) {
                setState(() {
                  _selectedTextColor = color;
                });
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );
  }
}


// class CardDetailsScreen extends StatefulWidget {
//   final String imagePath;
//   final String details;
//   final String Detailss;
//   final String Detailssss;
//   final DateTime date;
//   final TimeOfDay time;
//   final String coupleName;

//   CardDetailsScreen({
//     required this.imagePath,
//     required this.details,
//     required this.Detailss,
//     required this.Detailssss,
//     required this.date,
//     required this.time,
//     required this.coupleName,
//   });

//   @override
//   _CardDetailsScreenState createState() => _CardDetailsScreenState();
// }

// class _CardDetailsScreenState extends State<CardDetailsScreen> {
//   ColorFilter? _selectedColorFilter;
//   String _selectedFont = 'Roboto';

//   final Map<String, TextStyle> _fontStyles = {
//     'Roboto': GoogleFonts.roboto(),
//     'Lobster': GoogleFonts.lobster(),
//     'OpenSans': GoogleFonts.openSans(),
//     'Pacifico': GoogleFonts.pacifico(),
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Card Details'),
//       ),
//       body: SingleChildScrollView(
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             // Image with applied color filter
//             ColorFiltered(
//               colorFilter: _selectedColorFilter ??
//                   ColorFilter.mode(Colors.transparent, BlendMode.srcIn),
//               child: Image.asset(
//                 widget.imagePath,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Positioned(
//               bottom: 22,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Dropdown for font selection
//                   DropdownButton<String>(
//                     value: _selectedFont,
//                     onChanged: (String? newFont) {
//                       setState(() {
//                         _selectedFont = newFont!;
//                       });
//                     },
//                     items: _fontStyles.keys
//                         .map<DropdownMenuItem<String>>((String font) {
//                       return DropdownMenuItem<String>(
//                         value: font,
//                         child: Text(font),
//                       );
//                     }).toList(),
//                   ),
//                   SizedBox(height: 10),
//                   // Existing text with selected font
//                   Text(
//                     ' ${widget.details}',
//                     style: _fontStyles[_selectedFont]!.copyWith(fontSize: 16),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Date: ${widget.date.toString()}',
//                     style: _fontStyles[_selectedFont]!.copyWith(fontSize: 16),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     ' ${widget.Detailss}',
//                     style: _fontStyles[_selectedFont]!.copyWith(fontSize: 16),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     ' ${widget.Detailssss}',
//                     style: _fontStyles[_selectedFont]!.copyWith(fontSize: 16),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Time: ${widget.time.format(context)}',
//                     style: _fontStyles[_selectedFont]!.copyWith(fontSize: 16),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     '${widget.coupleName}',
//                     style: _fontStyles[_selectedFont]!.copyWith(fontSize: 16),
//                   ),
//                   SizedBox(height: 340),
//                   // Row of filter buttons
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       _buildFilterButton('Grayscale', Colors.grey),
//                       _buildFilterButton('Sepia', Colors.brown),
//                       _buildFilterButton('Invert', Colors.black),
//                       _buildFilterButton(
//                           'Yellow', Color.fromARGB(255, 229, 243, 33)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => phone_sc(),
//             ),
//           );
//         },
//         child: Icon(Icons.save),
//       ),
//     );
//   }

//   Widget _buildFilterButton(String text, Color color) {
//     return ElevatedButton(
//       onPressed: () {
//         setState(() {
//           if (text == 'Grayscale') {
//             _selectedColorFilter =
//                 ColorFilter.mode(Colors.grey, BlendMode.saturation);
//           } else if (text == 'Sepia') {
//             _selectedColorFilter = ColorFilter.matrix(<double>[
//               0.393,
//               0.769,
//               0.189,
//               0,
//               0,
//               0.349,
//               0.686,
//               0.168,
//               0,
//               0,
//               0.272,
//               0.534,
//               0.131,
//               0,
//               0,
//               0,
//               0,
//               0,
//               1,
//               0,
//             ]);
//           } else if (text == 'Invert') {
//             _selectedColorFilter = ColorFilter.matrix(<double>[
//               -1,
//               0,
//               0,
//               0,
//               255,
//               0,
//               -1,
//               0,
//               0,
//               255,
//               0,
//               0,
//               -1,
//               0,
//               255,
//               0,
//               0,
//               0,
//               1,
//               0,
//             ]);
//           } else if (text == 'Yellow') {
//             _selectedColorFilter = ColorFilter.matrix(<double>[
//               1, 0, 0, 0, 0, // Red channel (no change)
//               0, 1, 0, 0, 0, // Green channel (no change)
//               0, 0, -1, 0, 0, // Blue channel (invert)
//               0, 0, 0, 1, 0, // Alpha channel (no change)
//             ]);
//           }
//         });
//       },
//       child: Text(text),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: color,
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       ),
//     );
//   }
// }
