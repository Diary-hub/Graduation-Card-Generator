// Updated ItemsWidget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item {
  final String imageUrl;
  final String title;
  final double price;

  Item({required this.imageUrl, required this.title, required this.price});
}

class ItemsWidget extends StatelessWidget {
  final List<Item> items;

  const ItemsWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.76,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 59, 84, 89),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  spreadRadius: 1,
                  blurRadius: 8,
                )
              ]),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/itemDetails', arguments: item);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.network(item.imageUrl, fit: BoxFit.cover),
                  width: 120,
                  height: 120,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(item.title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${item.price.toString()}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Icon(CupertinoIcons.cart_badge_plus)
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
