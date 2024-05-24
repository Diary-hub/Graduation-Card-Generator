import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

_launchPhone(String phoneNumber) async {
  String url = 'tel:$phoneNumber';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App support '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'if you have any problem call for help ',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
         
            SizedBox(height: 40),
            Text(
              'Call this numbers:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextButton(
  onPressed: () {
    _launchPhone("07709547232");
  }, 
  child: Text(
    "07709547232",
    style: TextStyle(fontSize: 22),
  ),
),

            SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}