import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/phone.dart';

class Rate extends StatefulWidget {
  final String image;
  final String senderID;
  final String name;
  final String phone;
  final String status;
  final String id;
  const Rate({
    super.key,
    required this.image,
    required this.senderID,
    required this.name,
    required this.phone,
    required this.id,
    required this.status,
  });

  @override
  State<Rate> createState() => _RateState();
}

class _RateState extends State<Rate> {
  Future<void> accept() async {
    try {
      String kabraName = '';
      String phone = await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((json) {
        kabraName = json['firstname'] + ' ' + json['lastname'];
        return json['phone'];
      });

      await FirebaseFirestore.instance
          .collection('user')
          .doc(widget.senderID)
          .collection('notifications')
          .doc(widget.id)
          .update({
        'status': 'yes',
        'senderPhone': phone,
        'kabraName': kabraName,
      });

      await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('notifications')
          .doc(widget.id)
          .delete();

      Navigator.pop(context);
      ;
    } catch (e) {
      print(e);
    }
  }

  Future<void> reject() async {
    try {
      String kabraName = '';
      String phone = await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((json) {
        kabraName = json['firstname'] + ' ' + json['lastname'];
        return json['phone'];
      });

      await FirebaseFirestore.instance
          .collection('user')
          .doc(widget.senderID)
          .collection('notifications')
          .doc(widget.id)
          .update({
        'status': 'no',
        'senderPhone': phone,
        'kabraName': kabraName,
      });

      await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('notifications')
          .doc(widget.id)
          .delete();

      Navigator.pop(context);
      ;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightGreen[50],
        toolbarHeight: 40,
        title: Text('Responce'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black, width: 3),
                  image: DecorationImage(image: NetworkImage(widget.image), fit: BoxFit.fill),
                ),
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              "Sender Name\n" + widget.name,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              "Sender Phone",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              widget.phone,
              style: TextStyle(
                fontSize: 27,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 170,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green[200]),
                    onPressed: () {
                      accept();
                    },
                    child: Text('Accept'),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                SizedBox(
                  width: 170,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red[200]),
                    onPressed: () {
                      reject();
                    },
                    child: Text('Reject'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
