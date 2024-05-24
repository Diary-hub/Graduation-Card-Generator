import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:permission_handler/permission_handler.dart';

class phone_sc extends StatefulWidget {
  final String? image;
  final String? senderID;
  final String? name;
  final String? phone;
  final String? kabraName;

  const phone_sc({Key? key, this.image, this.senderID, this.name, this.phone, this.kabraName})
      : super(key: key);

  @override
  State<phone_sc> createState() => _phone_scState();
}

class _phone_scState extends State<phone_sc> {
  List<Contact> _contacts = [];
  Map<int, bool> _selectedMap = {};
  bool _allSelected = false;

  @override
  void initState() {
    super.initState();
    _initializeFirestore();
    _getContactsAndMark();
  }

  // Function to initialize Firestore
  void _initializeFirestore() {
    FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true);
  }

  // Function to request contacts permission
  Future<void> _requestContactsPermission() async {
    final PermissionStatus permissionStatus = await Permission.contacts.request();
    if (permissionStatus.isGranted) {
      _getContactsAndMark();
    } else if (permissionStatus.isDenied || permissionStatus.isPermanentlyDenied) {
      _showSnackBar('Access denied to contacts. Please grant access in settings.');
    }
  }

  // Function to get contacts
  Future<void> _getContactsAndMark() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts.toList();
      _selectedMap = Map.fromIterable(contacts,
          key: (contact) => _contacts.indexOf(contact), value: (_) => false);
    });

    // Check registration status for each contact
    for (int i = 0; i < _contacts.length; i++) {
      Contact contact = _contacts[i];
      String phoneNumber = _getPhoneNumber(contact) ?? '';
      bool isRegistered = await _checkPhoneNumberInDatabase(phoneNumber);
      setState(() {
        _selectedMap[i] = isRegistered;
      });
    }
  }

  // Function to check if the user is registered with the phone number
  Future<bool> _checkPhoneNumberInDatabase(String phoneNumber) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('phone', isEqualTo: phoneNumber)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  // Function to send SMS to unregistered users
  void _sendSMS() async {}

  String generateRandomString(int length) {
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();

    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => characters.codeUnitAt(random.nextInt(characters.length)),
      ),
    );
  }

  // Function to send notification to registered users
  void _sendNotification({
    required String image,
    required String senderID,
    required String name,
    required String phone,
  }) async {
    // Implement SMS sending logic here
    List _selectedMapTrue = [];

    _selectedMap.forEach((key, value) {
      if (value) {
        _selectedMapTrue.add(value);
      }
    });

    final String id = generateRandomString(10);

    for (int i = 0; i < _selectedMapTrue.length; i++) {
      Contact contact = _contacts[i];
      String phoneNumber = _getPhoneNumber(contact)!;

      final kabraID = await FirebaseFirestore.instance
          .collection('user')
          .where('phone', isEqualTo: phoneNumber)
          .get()
          .then((value) => value.docs[0].id);

      final kabraName = await FirebaseFirestore.instance
          .collection('user')
          .where('phone', isEqualTo: phoneNumber)
          .get()
          .then((value) => value.docs[0]['firstname'] + value.docs[0]['lastname']);

      await FirebaseFirestore.instance
          .collection('user')
          .doc(kabraID)
          .collection('notifications')
          .doc(id)
          .set({
        'image': image,
        'senderID': senderID,
        'senderPhone': phone,
        'name': name,
        'kabraName': kabraName,
        'status': 'waiting'
      });
    }
    _showSnackBar('All Notifications sent.');
  }

  // Function to show a snackbar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  // Function to toggle select/deselect all contacts
  void _toggleSelectAll() {
    setState(() {
      if (_allSelected) {
        _selectedMap.updateAll((key, value) => false);
      } else {
        _selectedMap.updateAll((key, value) => true);
      }
      _allSelected = !_allSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 181, 207, 232),
        appBar: AppBar(
          leading: Text(''),
          title: Text('Contact List'),
          backgroundColor: Color.fromARGB(255, 240, 239, 241),
        ),
        bottomNavigationBar: mybottom(pageIndex: 1),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/Pastel Feminine Flower Wedding Organizer Logo  (1).jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: _contacts.isEmpty
              ? Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _requestContactsPermission();
                    },
                    child: Text('Get Phone Number'),
                  ),
                )
              : ListView.builder(
                  itemCount: _contacts.length,
                  itemBuilder: (BuildContext context, int index) {
                    Contact contact = _contacts[index];
                    return ListTile(
                      leading: IconButton(
                        icon: _selectedMap[index] ?? false
                            ? Icon(Icons.check_circle, color: Colors.green)
                            : Icon(Icons.check_circle_outline), // Change color when selected
                        onPressed: () {
                          setState(() {
                            _selectedMap[index] = !_selectedMap[index]!;
                          });
                        },
                      ),
                      title: Text(contact.displayName ?? ""),
                      subtitle: Text(_getPhoneNumber(contact) ?? ""),
                    );
                  },
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _getContactsAndMark(); // Trigger fetching contacts and marking
          },
          child: Icon(Icons.refresh),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        persistentFooterButtons: [
          widget.image != null
              ? Row(
                  children: [
                    SizedBox(
                      width: 170,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: _sendSMS,
                        child: Text('Send SMS to Unregistered'),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                      width: 170,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          _sendNotification(
                            image: widget.image!,
                            senderID: widget.senderID!,
                            name: widget.name!,
                            phone: widget.phone!,
                          );
                        },
                        child: Text('Send Notification to Registered'),
                      ),
                    ),
                  ],
                )
              : Text('')
        ]);
  }
}

String? _getPhoneNumber(Contact contact) {
  if (contact.phones!.isNotEmpty) {
    return contact.phones!.first.value;
  } else {
    return '';
  }
}
