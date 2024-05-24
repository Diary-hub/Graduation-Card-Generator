import 'package:flutter/material.dart';

class CardDetailsScreen extends StatelessWidget {
  final String imagePath;
  final String details;
  final DateTime date;
  final TimeOfDay time;
  final String coupleName;

  // Constructor with named parameters
  CardDetailsScreen({
    required this.imagePath,
    required this.details,
    required this.date,
    required this.time,
    required this.coupleName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Details'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          // Overlay content
          Positioned(
            top: 150,
            left: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Details: $details',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Date: ${date.toString()}',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Time: ${time.format(context)}',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Couple Name: $coupleName',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class CardDetailsScreen extends StatelessWidget {
  
//   final String imagePaths;
//   final String details;
//   final DateTime date;
//   final TimeOfDay time;
//   final String coupleName;

//   // Constructor with named parameters
//   CardDetailsScreen({
//     required this.imagePaths,
//     required this.details,
//     required this.date,
//     required this.time,
//     required this.coupleName,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Dropdown items for selecting card actions
//     List<String> actions = ['Save', 'Edit', 'Delete'];

//     // Default selected action
//     String selectedAction = actions.first;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Card Details'),
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Background image
//           Image.asset(
//             imagePaths,
//             fit: BoxFit.cover,
//           ),
//           // Overlay content
//           Positioned(
//             top: 40,
//             left: 20,
//             child: Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Text(
//                       'Details: $details',
//                       style: TextStyle(
//                         color: const Color.fromARGB(255, 0, 0, 0),
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Center(
//                     child: Text(
//                       'Date: ${date.toString()}',
//                       style: TextStyle(
//                         color: const Color.fromARGB(255, 0, 0, 0),
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: Text(
//                       'Time: ${time.format(context)}',
//                       style: TextStyle(
//                         color: const Color.fromARGB(255, 0, 0, 0),
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: Text(
//                       'Couple Name: $coupleName',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 0, 0, 0),
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   // Dropdown to select actions
//                   Center(
//                     child: DropdownButton<String>(
//                       value: selectedAction,
//                       onChanged: (String? newValue) {
//                         if (newValue != null) {
//                           // Update selected action
//                           selectedAction = newValue;
//                           // Perform action based on selected value
//                           switch (selectedAction) {
//                             case 'Save':
//                               // Implement save functionality
//                               break;
//                             case 'Edit':
//                               // Implement edit functionality
//                               break;
//                             case 'Delete':
//                               // Implement delete functionality
//                               break;
//                             default:
//                               break;
//                           }
//                         }
//                       },
//                       items: actions.map((action) {
//                         return DropdownMenuItem<String>(
//                           value: action,
//                           child: Text(action),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
