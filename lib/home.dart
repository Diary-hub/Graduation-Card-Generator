import 'package:flutter/material.dart';
import 'package:flutter_application_1/ItemsWidget/ItemsWidget.dart';
import 'package:flutter_application_1/pro.dart'; // Importing the WeddingCard class

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final engagementItems = [
      Item(
        imageUrl: "https://media.istockphoto.com/id/498296378/photo/wedding-invitation.jpg?s=612x612&w=0&k=20&c=PYc7oTt3ReiKxVu4SQ1FscOumTpujsKLOh_Yhzl5rgg=",
        title: "Engagement",
        
        price: 100.0,
      ),
      
      Item(
        imageUrl: "https://marketplace.canva.com/EAEyWj2KPFU/1/0/1600w/canva-save-the-date---wedding-invitation-fE9ifyNmC7I.jpg",
        title: "Engagement ",
        price: 100.0,
      ),

      Item(
        imageUrl: "https://www.specialmomentsboutique.com/cdn/shop/files/293.png?v=1688304287",
        title: "Engagement ",
        price: 100.0,
      ),

      Item(
        imageUrl: "https://marketplace.canva.com/EAE8WY1W01Y/1/0/1600w/canva-beige-minimalist-elegant-engagement-party-card-qtaqQEuiKNE.jpg",
        title: "Engagement ",
        price: 100.0,
      ),
    ];

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 181, 207, 232),
        appBar: AppBar(
          title: Text('Category Items'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Engagement'),
              Tab(text: 'Wedding'),
              Tab(text: 'Graduation'),
              Tab(text: 'Birthday'),
              Tab(text: 'Event'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildGridForEngagementItems(context, engagementItems),
            Container(), // Placeholder for Wedding
            Container(), // Placeholder for Graduation
            Container(), // Placeholder for Birthday
            Container(), // Placeholder for Event
          ],
        ),
      ),
    );
  }

  Widget _buildGridForEngagementItems(BuildContext context, List<Item> engagementItems) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: engagementItems.length ~/ 2 + (engagementItems.length % 2 == 0 ? 0 : 1),
      itemBuilder: (context, index) {
        int currentIndex = index * 2;
        if (currentIndex >= engagementItems.length) return Container();
        int nextIndex = currentIndex + 1;
        if (nextIndex > engagementItems.length - 1) nextIndex = engagementItems.length;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildItem(context, engagementItems[currentIndex])),
              if (nextIndex < engagementItems.length) const SizedBox(width: 8),
              Expanded(child: _buildItem(context, engagementItems[nextIndex]))
            ],
          ),
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, Item item) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WeddingCard(engagementItem: item),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(aspectRatio: 1 / 1, child: Image.network(item.imageUrl)),
            Text(item.title),
          ],
        ),
      ),
    );
  }
}
