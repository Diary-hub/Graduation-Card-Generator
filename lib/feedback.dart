import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  double _rating = 0;
  TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.99,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/Pastel Feminine Flower Wedding Organizer Logo  (1).jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How would you rate your experience?',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 40,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
              SizedBox(height: 40),
              Text(
                'Tell us more:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Expanded(
                child: TextFormField(
                  controller: _feedbackController,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Type your feedback here...',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _submitFeedback(); // Submit feedback to Firestore
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitFeedback() async {
    String feedbackText = _feedbackController.text.trim();
    if (feedbackText.isNotEmpty) {
      // Access Firebase Firestore
      CollectionReference feedbackCollection =
          FirebaseFirestore.instance.collection('feedback');

      // Add feedback data to Firestore
      await feedbackCollection.add({
        'rating': _rating,
        'feedback': feedbackText,
        'timestamp': Timestamp.now(), // Add timestamp for sorting or analytics
      });

      // Show success message or navigate back
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Feedback submitted successfully!'),
        ),
      );

      // Navigate back to the previous screen
      Navigator.pop(context);
    } else {
      // Show error message if feedback text is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please provide your feedback.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    _feedbackController.dispose(); // Dispose the text controller
    super.dispose();
  }
}
