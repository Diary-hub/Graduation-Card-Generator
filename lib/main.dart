import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/history.dart';
import 'package:flutter_application_1/home-base.dart';
import 'package:flutter_application_1/notification.dart';
import 'package:flutter_application_1/phone.dart';
import 'package:flutter_application_1/phonee.dart';
import 'package:flutter_application_1/setting.dart';
import 'package:flutter_application_1/splashscreennn.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashscreennn(),
    );
  }
}

class mybottom extends StatefulWidget {
  mybottom({
    super.key,
    required this.pageIndex,
  });
  final int pageIndex;
  @override
  State<mybottom> createState() => _mybottomState();
}

class _mybottomState extends State<mybottom> {
  int selected = 0;

  List<Widget> screens = [
    HomeScreen(),
    phone_sc(),
    ECardHistoryPage(),
    NotificationScreen(),
    SettingsPage(),
  ];
  @override
  void initState() {
    super.initState();
    selected = widget.pageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Color.fromARGB(255, 181, 207, 232),
      items: [
        Icon(Icons.home),
        Icon(
          Icons.phone,
        ),
        Icon(Icons.card_giftcard),
        Icon(Icons.notifications),
        Icon(Icons.settings),
      ],
      index: selected,
      onTap: (index) {
        setState(() {
          selected = index;
        });
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => screens[index],
            ));
        // if (index == 1) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => phone_sc()),
        //   );
        // } else if (index == 3) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => NotificationScreen()),
        //   );
        // } else if (index == 4) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => SettingsPage()),
        //   );
        // }
      },
    );
  }
}
