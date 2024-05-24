//import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

class phone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhoneNumberScreen(),
    );
  }
}

class PhoneNumberScreen extends StatefulWidget {
  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  String emulatorPhoneNumber = '';

  @override
  void initState() {
    super.initState();
    getEmulatorPhoneNumber();
  }

  Future<void> getEmulatorPhoneNumber() async {
    // DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    //AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;

    // setState(() {
    //   // Access the phone number from AndroidDeviceInfo
    //   emulatorPhoneNumber = androidInfo.phoneNumber ?? 'N/A';
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emulator Phone Number'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Phone Number:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              emulatorPhoneNumber,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}



//bo bashy log in 

// import 'package:flutter/material.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: phone(),
//     );
//   }
// }

// class phone extends StatelessWidget {
//   final TextEditingController phoneNumberController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Phone Number Input'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             InternationalPhoneNumberInput(
//               onInputChanged: (PhoneNumber number) {
//                 // You can use this callback if you need to perform any action
//                 // when the user changes the input.
//               },
//               inputDecoration: InputDecoration(
//                 labelText: 'Phone Number',
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 // You can access the entered phone number using the controller
//                 String enteredPhoneNumber = phoneNumberController.text;
//                 print('Entered Phone Number: $enteredPhoneNumber');
//                 // Add your logic here to handle the entered phone number
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
