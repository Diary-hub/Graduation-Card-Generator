// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/main.dart';

// class cardsHistory extends StatefulWidget {
//   const cardsHistory({super.key});

//   @override
//   State<cardsHistory> createState() => _cardsHistoryState();
// }

// class _cardsHistoryState extends State<cardsHistory> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('history'),
//       ),
//       bottomNavigationBar: mybottom(pageIndex: 2),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/phonee.dart';

class ECardHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        title: Text('E-Card Celebration History'),
      ),
      bottomNavigationBar: mybottom(pageIndex: 2),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/images/Pastel Feminine Flower Wedding Organizer Logo  (1).jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('user')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('history')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.waiting) {
              if (snapshot.hasData) {
                final data = snapshot.data!.docs;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 30,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final oneData = data[index].data();
                      final oneDataID = data[index].id;

                      String imageURl = oneData['image'];

                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black, width: 2),
                          image: DecorationImage(
                            image: NetworkImage(imageURl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return InkWell(
                                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HeroPage(imageURl: imageURl),
                                  )),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(imageURl)),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Stack(
                            children: [
                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          border: Border.all(color: Colors.amber, width: 2),
                                          borderRadius: BorderRadius.circular(30)),
                                      child: SizedBox(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () async {
                                                final userJson = await FirebaseFirestore.instance
                                                    .collection('user')
                                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                                    .get()
                                                    .then((json) => json);
                                                final userJsonData = userJson.data();

                                                // print(userJsonData?['name']);
                                                // print(userJsonData?['phone']);
                                                // print(imageURl);
                                                // print(userJson.id);

                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => phone_sc(
                                                      image: imageURl,
                                                      name: userJsonData?['firstname'] +
                                                          ' ' +
                                                          userJsonData?['lastname'],
                                                      phone: userJsonData?['phone'],
                                                      senderID: userJson.id,
                                                    ),
                                                  ),
                                                );
                                              },
                                              icon: Icon(
                                                Icons.share,
                                                color: Colors.white,
                                                size: 35,
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.05,
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                final phone = await FirebaseFirestore.instance
                                                    .collection('user')
                                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                                    .get()
                                                    .then((json) => json['phone']);

                                                await FirebaseStorage.instance
                                                    .ref()
                                                    .child(phone)
                                                    .child(oneData['name'])
                                                    .delete();

                                                await FirebaseFirestore.instance
                                                    .collection('user')
                                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                                    .collection('history')
                                                    .doc(oneDataID)
                                                    .delete();
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                                size: 35,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  // Helper method to format date
  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class HeroPage extends StatelessWidget {
  final String imageURl;
  const HeroPage({super.key, required this.imageURl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: "Click",
        child: Image.network(imageURl),
      ),
    );
  }
}
