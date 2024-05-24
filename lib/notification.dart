import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/rate.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late String phone = '';
  bool loading = true;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((json) {
      setState(() {
        phone = json['phone'];
        loading = false;
      });
    });
  }

  final List<String> notifications = [
    'New message from John',
    'You have a new follower',
    'Reminder: Meeting at 3:00 PM',
    'Check out the latest updates',
    'Notification 5',
    'Notification 6',
    'Notification 7',
    'Notification 8',
    'Notification 9',
    'Notification 10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 181, 207, 232),
        appBar: AppBar(
          leading: Text(''),
          title: Text('Notifications'),
        ),
        body: Container(
          decoration: BoxDecoration(),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('user')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('notifications')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.waiting) {
                if (snapshot.hasData) {
                  final notifes = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: notifes.length,
                    itemBuilder: (context, index) {
                      final oneNotifi = notifes[index].data();

                      if (oneNotifi['senderPhone'] != phone) {
                        String text = '';

                        if (oneNotifi['status'] == 'waiting') {
                          text = 'New Invatation Form ${oneNotifi['name']}';
                        } else if (oneNotifi['status'] == 'yes') {
                          text = '${oneNotifi['kabraName']} Accepted The Invitation';
                        } else {
                          text = '${oneNotifi['kabraName']} Rejected The Invitation';
                        }

                        return ListTile(
                          onLongPress: () async {
                            if (oneNotifi['status'] == 'waiting') {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Rate(
                                  id: notifes[index].id,
                                  image: oneNotifi['image'],
                                  senderID: oneNotifi['senderID'],
                                  name: oneNotifi['name'],
                                  phone: oneNotifi['senderPhone'],
                                  status: oneNotifi['status'],
                                ),
                              ));
                            } else {
                              await FirebaseFirestore.instance
                                  .collection('user')
                                  .doc(oneNotifi['senderID'])
                                  .collection('notifications')
                                  .doc(notifes[index].id)
                                  .delete();
                            }
                          },
                          leading: Icon(Icons.notifications),
                          title: Text(text),
                          onTap: () {
                            // Handle tapping on a notification (e.g., navigate to detail screen)
                            // Implement your custom logic here
                          },
                        );
                      } else {
                        return Text('');
                      }
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        bottomNavigationBar: mybottom(
          pageIndex: 3,
        ));
  }
}
