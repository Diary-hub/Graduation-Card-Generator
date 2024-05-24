// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_application_1/cardDesign.dart';
// import 'package:flutter_application_1/engagment.dart';
// import 'package:flutter_application_1/graduation.dart';
// import 'package:flutter_application_1/help.dart';
// import 'package:flutter_application_1/home.dart';
// import 'package:flutter_application_1/login.dart';
// import 'package:flutter_application_1/main.dart';
// import 'package:flutter_application_1/notification.dart';
// import 'package:flutter_application_1/phone.dart';
// import 'package:flutter_application_1/phonee.dart';
// import 'package:flutter_application_1/profile.dart';
// import 'package:flutter_application_1/setting.dart';
// import 'package:flutter_application_1/weddingcard.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndex = 0;
//   List<String> imageUrls = [
//     'assets/images/design.jpg',
//     'assets/images/designn.jpg',
//     'assets/images/designnn.jpg',
//     // Add more image URLs as needed
//   ];

//   int myCurrentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //  backgroundColor: Color.fromARGB(255, 181, 207, 232),
//       appBar: AppBar(
//         title: Text(
//           'E-Card Application',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         // shape: RoundedRectangleBorder(
//         //   borderRadius: BorderRadius.only(
//         //     bottomLeft: Radius.circular(56),
//         //     bottomRight: Radius.circular(29),
//         //   ),
//         // ),
//         // elevation: 25,
//         // backgroundColor: Color.fromARGB(255, 255, 255, 255),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.search_sharp, size: 21, color: Colors.black),
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         backgroundColor: Color.fromARGB(255, 255, 254, 254),
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 207, 230, 241),
//                 borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(88),
//                   bottomLeft: Radius.circular(88),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundImage: NetworkImage(
//                         'https://m.media-amazon.com/images/I/815l2CzRWqL.jpg'),
//                   ),
//                   SizedBox(height: 10),
//                   Center(
//                     child: Text(
//                       'Card Application',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: Text(
//                       'E-card',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Profile'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ProfilePage()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SettingsPage()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.help),
//               title: Text('Help'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HelpPage()),
//                 );
//               },
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.exit_to_app),
//               title: Text('Log out'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginScreen()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: mybottom(pageIndex: 0),

//       body: Container(
//         height: MediaQuery.of(context).size.height * 0.99,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//                 'assets/images/Pastel Feminine Flower Wedding Organizer Logo  (1).jpg'), // Background image asset path
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 10),
//             CarouselSlider(
//               options: CarouselOptions(
//                 height: 150.0,
//                 enlargeCenterPage: true,
//                 autoPlay: true,
//                 aspectRatio: 4.0,
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     myCurrentIndex = index;
//                   });
//                 },
//                 // Add more carousel options as needed
//               ),
//               items: imageUrls.map((imageUrl) {
//                 return Builder(
//                   builder: (BuildContext context) {
//                     return Container(
//                       width: MediaQuery.of(context).size.width,
//                       margin: EdgeInsets.symmetric(horizontal: 5.0),
//                       decoration: BoxDecoration(
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: Image.asset(
//                         imageUrl,
//                         fit: BoxFit.cover,
//                       ),
//                     );
//                   },
//                 );
//               }).toList(),
//             ),
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 children: [
//                   ClickableContainer(
//                     imageUrl:

//                         'https://img4.dhresource.com/webp/m/0x0/f3/albu/km/y/15/30bc0676-9934-4013-bafe-b03f7331fbfc.jpg',

//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => InnerScreen()),
//                       );

//                     },
//                     description: 'Birthday Card Design',
//                   ),
//                   ClickableContainer(
//                     imageUrl:
//                         'https://www.elitheo.co.uk/cdn/shop/products/il_fullxfull.3335281689_iexd.jpg?v=1660157584&width=1946',
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => WeddingCard()),
//                       );
//                     },
//                     description: 'Wedding Card Design',
//                   ),
//                   ClickableContainer(
//                     imageUrl:
//                         'https://i0.wp.com/www.looksinviting.co.uk/wp-content/uploads/BTH043-engagement-greeting-card-above-scaled.jpeg?resize=247%2C296&ssl=1',
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => engagmentcard()),
//                       );
//                     },
//                     description: 'Engagement Card Design',
//                   ),
//                   ClickableContainer(
//                     imageUrl:
//                         'https://c8.alamy.com/comp/2GM15T2/happy-graduation-card-2GM15T2.jpg',
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => graduationcard()),
//                       );
//                     },
//                     description: 'Graduation Card Design',
//                   ),
//                   // Add more ClickableContainer widgets here
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ClickableContainer extends StatelessWidget {
//   final String imageUrl;
//   final String description;
//   final VoidCallback onTap;

//   const ClickableContainer({
//     required this.imageUrl,
//     required this.description,
//     required this.onTap,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         elevation: 4,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
//               child: Image.network(
//                 imageUrl,
//                 fit: BoxFit.cover,
//                 height: 150,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 4),
//                   Center(
//                     child: Text(
//                       description,
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cardDesign.dart';
import 'package:flutter_application_1/engagment.dart';
import 'package:flutter_application_1/graduation.dart';
import 'package:flutter_application_1/help.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/setting.dart';
import 'package:flutter_application_1/weddingcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _currentIndex = 0;
  List<String> imageUrls = [
    'assets/images/design.jpg',
    'assets/images/designn.jpg',
    'assets/images/designnn.jpg',
    // Add more image URLs as needed
  ];

  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'E-Card Application',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_sharp, size: 21, color: Colors.black),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        NetworkImage('https://m.media-amazon.com/images/I/815l2CzRWqL.jpg'),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Card Application',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'E-card',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: mybottom(pageIndex: 0),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/Pastel Feminine Flower Wedding Organizer Logo  (1).jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),
              CarouselSlider(
                options: CarouselOptions(
                  height: 150.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 4.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      myCurrentIndex = index;
                    });
                  },
                ),
                items: imageUrls.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: GridView.count(
                    childAspectRatio: 0.8,
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 10,
                    children: [
                      ClickableContainer(
                        imageUrl:
                            'https://img4.dhresource.com/webp/m/0x0/f3/albu/km/y/15/30bc0676-9934-4013-bafe-b03f7331fbfc.jpg',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InnerScreen()),
                          );
                        },
                        description: 'Birthday Card Design',
                      ),
                      ClickableContainer(
                        imageUrl:
                            'https://www.elitheo.co.uk/cdn/shop/products/il_fullxfull.3335281689_iexd.jpg?v=1660157584&width=1946',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WeddingCard()),
                          );
                        },
                        description: 'Wedding Card Design',
                      ),
                      ClickableContainer(
                        imageUrl:
                            'https://i0.wp.com/www.looksinviting.co.uk/wp-content/uploads/BTH043-engagement-greeting-card-above-scaled.jpeg?resize=247%2C296&ssl=1',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => engagmentcard()),
                          );
                        },
                        description: 'Engagement Card Design',
                      ),
                      ClickableContainer(
                        imageUrl:
                            'https://c8.alamy.com/comp/2GM15T2/happy-graduation-card-2GM15T2.jpg',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => graduationcard()),
                          );
                        },
                        description: 'Graduation Card Design',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClickableContainer extends StatelessWidget {
  final String imageUrl;
  final String description;
  final VoidCallback onTap;

  const ClickableContainer({
    required this.imageUrl,
    required this.description,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Center(
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';


// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _GenderScreenState();
// }

// class _GenderScreenState extends State<HomeScreen> {

//   @override
//   int _currentIndex = 0;
//   Widget build(BuildContext context) {
//     return Scaffold(
    
//       drawer: Drawer(
          
//            child: ListView(
            
//           padding: EdgeInsets.zero,
//           children: [
            
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 207, 230, 241),
//                 borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(88),
//                   bottomLeft: Radius.circular(88)
//                 )
                
//               ),
              
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundImage: NetworkImage('https://m.media-amazon.com/images/I/815l2CzRWqL.jpg'),
//                   ),
//                   SizedBox(height: 10),
//                   Center(
//                     child: Text(
//                       'card Application',
//                       style: TextStyle(
//                         color: const Color.fromARGB(255, 6, 6, 6),
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: Text(
//                       'E-card ',
//                       style: TextStyle(
//                         color: const Color.fromARGB(255, 13, 12, 12),
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
              
//             ),
            
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('profile'),
//               onTap: () {
//                 //  Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(builder: (context) => HomeScreen()),
//                 //  );
                
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('setting'),
//               onTap: () {
//                 // Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(builder: (context) => SettingsScreen()),
//                 //  );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.help),
//               title: Text('help'),
//               onTap: () {
//               //  Navigator.push(
//               //       context,
//               //       MaterialPageRoute(builder: (context) => Page1()),
//               //    ); // Navigate to the help screen
//               },
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.exit_to_app),
//               title: Text('log out'),
//               onTap: () {
//                 // Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(builder: (context) => loginscreenn()),
//                 //  );
//               },
//             ),
//           ],
//         ),
//         ),
//       backgroundColor: Color.fromARGB(255, 126, 170, 200),
//       appBar: AppBar(
         
//          title: Row(
          
//           children: [
            
//             // Icon(Icons.star, color: Colors.amber,),
//             // SizedBox(width: 8,),
//             Text('',style: TextStyle(
//               fontSize: 20,fontWeight: FontWeight.bold),)
//           ],
          
          
//          ),
//          shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(56),
//             bottomRight: Radius.circular(29)
//           )
//          ),

//          elevation: 25,
//          shadowColor: Color.fromARGB(255, 6, 5, 5),
//          backgroundColor: Color.fromARGB(255, 207, 230, 241),
//          actions: [
//           IconButton(onPressed: (){}, icon: Icon(Icons.search_sharp,size: 21,color: Colors.black,)),
          
//          ],
         
//         ),
      
//        body: Container(
          
//           child: GridView.count(
//             crossAxisCount:2,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.amber,
//                     borderRadius: BorderRadius.circular(52),
//                     image: DecorationImage(image: NetworkImage('https://poppyandlace.ca/cdn/shop/products/ringengagement_580x.jpg?v=1653282722'),fit:BoxFit.cover),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                     //  Text('نرخ'),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               left: 112),
//                             child: Icon(Icons.favorite,
                            
//                             size: 26,
//                             color: Color.fromARGB(255, 255, 255, 255),
                            
//                             ),
                          
                            
                            
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
                  
//                 ),
                
//               ),
//               // Padding(
//               //   padding: const EdgeInsets.all(8.0),
//               //   child: Container(
//               //    decoration: BoxDecoration(
//               //       color: Colors.amber,
//               //       borderRadius: BorderRadius.circular(22),
//               //       image: DecorationImage(image: NetworkImage('https://img.shopstyle-cdn.com/sim/8a/00/8a00d699fb449864833c297a436191a1_xlarge/boxy-crop-turtleneck-sweater.jpg')),
//               //     ),
//               //   ),
//               // ),
//               // Padding(
//               //   padding: const EdgeInsets.all(8.0),
//               //   child: Container(
//               //     decoration: BoxDecoration(
//               //       color: Colors.amber,
//               //       borderRadius: BorderRadius.circular(22),
//               //       image: DecorationImage(image: NetworkImage('https://coachaustralia.com/dw/image/v2/BDFS_PRD/on/demandware.static/-/Sites-coach-master-catalog/default/dwdb11d22a/images/CL370/C_CL370LAV_1.jpg?sw=600&sh=600')),
//               //     ),
//               //   ),
//               // ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 100, 138, 161),
//                     borderRadius: BorderRadius.circular(52),
//                     image: DecorationImage(image: NetworkImage('https://i0.wp.com/aprints.pk/wp-content/uploads/2021/09/14.jpg?fit=2000%2C2000&ssl=1'),fit: BoxFit.cover),
//                   ),
                  
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                      // Text('نرخ'),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               left: 112),
//                             child: Icon(Icons.favorite,
//                             size: 26,
//                             color: Color.fromARGB(255, 255, 255, 255),
                            
//                             ),
//                           ),
//                 //           GestureDetector(
//                 //             onTap:() {
//                 // Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(builder: (context) => product: products[index]),
//                 //  );
             
//                 //             }, 
                            
//                 //           ),
                          
                          
//                         ],
                        
                        
//                       ),
                      
//                     ],
                    
//                   ),
                  
//                 ),
                
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                  decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 181, 207, 248),
//                     borderRadius: BorderRadius.circular(52),
//                     image: DecorationImage(image: NetworkImage('https://images-platform.99static.com/e-8691KFJKJeiB8Iqk3LAgaBwf4=/410x152:1629x1371/500x500/top/smart/99designs-contests-attachments/83/83080/attachment_83080425'),fit: BoxFit.cover),
                    
//                   ),child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                     //  Text('نرخ'),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               left: 112),
//                             child: Icon(Icons.favorite,
//                             size: 26,
//                             color: Color.fromARGB(255, 255, 255, 255),
                            
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//                Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                  decoration: BoxDecoration(
//                     color: Colors.amber,
//                     borderRadius: BorderRadius.circular(52),
//                     image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBHERBf5wk6CSfU_sHA9sw8nh5JGuTCgXunRJCA6-e1u8RXPK3XV-EKdYr52TEjoEGMVM&usqp=CAU'),fit:BoxFit.cover),
                    
//                   ),child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                      // Text('نرخ'),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               left: 112),
//                             child: Icon(Icons.favorite,
//                             size: 26,
//                             color: Color.fromARGB(255, 255, 255, 255),
                            
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//                Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                  decoration: BoxDecoration(
//                     color: Colors.amber,
//                     borderRadius: BorderRadius.circular(52),
//                     image: DecorationImage(image: NetworkImage('https://www.bagoys.com/images/itemVariation/v4_8c0a1db7a3b64af95e6742643623ce4fad748488dc2efc7d2e2dc8ff2a68b49f-2-220218155482-23021630512.jpeg'),fit: BoxFit.cover),
                    
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                      // Text('نرخ'),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               left: 112),
//                             child: Icon(Icons.favorite,
//                             size: 26,
//                             color: Color.fromARGB(255, 248, 245, 245),
                            
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               //  Padding(
//               //   padding: const EdgeInsets.all(8.0),
//               //   child: Container(
//               //    decoration: BoxDecoration(
//               //       color: Colors.amber,
//               //       borderRadius: BorderRadius.circular(52),
//               //       image: DecorationImage(image: NetworkImage('https://images.squarespace-cdn.com/content/v1/5a03888d12abd91237210742/1631832629388-IXS0WXPY5YZ0HL45UG4U/200228_JANNJUNE_MOTIV_08_0043.jpg?format=1500w'),fit: BoxFit.cover),
                    
//               //     ),
//               //     child: Row(
//               //       mainAxisAlignment: MainAxisAlignment.end,
//               //       children: [
//               //        // Text('نرخ'),
//               //         Column(
//               //           mainAxisAlignment: MainAxisAlignment.end,
//               //           children: [
//               //             Padding(
//               //               padding: const EdgeInsets.only(
//               //                 left: 112),
//               //               child: Icon(Icons.favorite,
//               //               size: 26,
//               //               color: Color.fromARGB(255, 0, 0, 0),
                            
//               //               ),
//               //             ),
//               //           ],
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // ),
//               //  Padding(
//               //   padding: const EdgeInsets.all(8.0),
//               //   child: Container(
//               //    decoration: BoxDecoration(
//               //       color: Colors.amber,
//               //       borderRadius: BorderRadius.circular(52),
//               //       image: DecorationImage(image: NetworkImage('https://www.nellandrose.com/cdn/shop/products/CrossoverBackTurtleneckTop.1_480x.jpg?v=1633449234'),fit: BoxFit.cover),
                    
//               //     ),
//               //     child: Row(
//               //       mainAxisAlignment: MainAxisAlignment.end,
//               //       children: [
//               //        // Text('نرخ'),
//               //         Column(
//               //           mainAxisAlignment: MainAxisAlignment.end,
//               //           children: [
//               //             Padding(
//               //               padding: const EdgeInsets.only(
//               //                 left: 112),
//               //               child: Icon(Icons.favorite,
//               //               size: 26,
//               //               color: Color.fromARGB(255, 0, 0, 0),
                            
//               //               ),
//               //             ),
//               //           ],
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // ),
//               //  Padding(
//               //   padding: const EdgeInsets.all(8.0),
//               //   child: Container(
//               //    decoration: BoxDecoration(
//               //       color: Colors.amber,
//               //       borderRadius: BorderRadius.circular(52),
//               //       image: DecorationImage(image: NetworkImage('https://n.nordstrommedia.com/it/9c45ca2d-8726-4cd4-8207-d3446f9a8598.jpeg?h=500&w=500')),
                    
//               //     ),
//               //     child: Row(
//               //       mainAxisAlignment: MainAxisAlignment.end,
//               //       children: [
//               //        // Text('نرخ'),
//               //         Column(
//               //           mainAxisAlignment: MainAxisAlignment.end,
//               //           children: [
//               //             Padding(
//               //               padding: const EdgeInsets.only(
//               //                 left: 112),
//               //               child: Icon(Icons.favorite,
//               //               size: 26,
                                
//               //               color: Color.fromARGB(255, 0, 0, 0),
                            
//               //               ),
//               //             ),
//               //           ],
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // ),
//             ],
            
//             ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'favorite',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
          
//         ],
        
//       ),
    
//     );
//   }
// }