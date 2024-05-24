import 'package:flutter/material.dart';
import 'package:flutter_application_1/ItemsWidget/ItemsWidget.dart';

class WeddingCard extends StatefulWidget {
  final Item engagementItem;

  const WeddingCard({required this.engagementItem});

  @override
  _WeddingCardState createState() => _WeddingCardState();
}

class _WeddingCardState extends State<WeddingCard> {
  late Item selectedEngagementItem;

  TextEditingController nameController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
   selectedEngagementItem = widget.engagementItem;
    nameController.text = selectedEngagementItem.title;
  }

  void updateTextFields() {
    setState(() {
      // Update other fields if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 181, 207, 232),
      appBar: AppBar(
        title: Text('Wedding Card'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  selectedEngagementItem.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${selectedEngagementItem.title}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      'place: ${selectedEngagementItem.title}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      'Time: ${selectedEngagementItem.title}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: nameController,
                      onChanged: (_) => setState(() {}),
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: nameController,
                      onChanged: (_) => setState(() {}),
                      decoration: InputDecoration(labelText: 'place'),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: nameController,
                      onChanged: (_) => setState(() {}),
                      decoration: InputDecoration(labelText: 'Time'),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: updateTextFields,
                      child: Text('Update Text Fields'),
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
