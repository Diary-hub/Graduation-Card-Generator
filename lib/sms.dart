import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(ContactListApp());
}

class ContactListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactListPage(),
    );
  }
}

class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  List<Contact> _contacts = [];
  List<Contact> _unregisteredContacts = [];
  List<Contact> _selectedContacts = [];
  String _message = '';

  @override
  void initState() {
    super.initState();
    _getContacts();
    _checkUnregisteredContacts();
  }

  Future<void> _getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      final contacts = await ContactsService.getContacts();
      setState(() {
        _contacts = contacts.toList();
      });
    } else {
      // Handle permission denied
    }
  }

  Future<bool> _isUserRegistered(String phoneNumber) async {
    final snapshotFirst = await FirebaseFirestore.instance
        .collection('user')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();
    final snapshotSecond = await FirebaseFirestore.instance
        .collection('users')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();
    return snapshotFirst.docs.isNotEmpty || snapshotSecond.docs.isNotEmpty;
  }

  Future<void> _checkUnregisteredContacts() async {
    List<Contact> unregisteredContacts = [];
    for (var contact in _contacts) {
      if (!await _isUserRegistered(contact.phones!.first.value!)) {
        unregisteredContacts.add(contact);
      }
    }
    setState(() {
      _unregisteredContacts = unregisteredContacts;
    });
  }

  void _sendMessage() {
    String messageWithContacts = _selectedContacts
        .map((contact) =>
            '${contact.displayName}: ${contact.phones!.first.value}')
        .join('\n');
    Share.share(_message + '\n\n' + messageWithContacts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: _unregisteredContacts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _unregisteredContacts.length,
              itemBuilder: (context, index) {
                final contact = _unregisteredContacts[index];
                return ListTile(
                  title: Text(contact.displayName ?? ''),
                  subtitle: Text(contact.phones!.isNotEmpty
                      ? contact.phones!.first.value ?? ''
                      : ''),
                  leading: Checkbox(
                    value: _selectedContacts.contains(contact),
                    onChanged: (value) {
                      setState(() {
                        if (value!) {
                          _selectedContacts.add(contact);
                        } else {
                          _selectedContacts.remove(contact);
                        }
                      });
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Compose Message'),
              content: TextField(
                decoration: InputDecoration(labelText: 'Enter your message'),
                onChanged: (value) {
                  setState(() {
                    _message = value;
                  });
                },
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _sendMessage();
                    Navigator.pop(context);
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.message),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
