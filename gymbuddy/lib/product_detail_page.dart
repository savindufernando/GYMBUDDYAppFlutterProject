import 'package:flutter/material.dart';
import 'package:gymbuddy/widgets/bottom_nav.dart';

class ProductDetailPage extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  final String description;

  const ProductDetailPage({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(currentIndex: 1), // BottomNav at the bottom
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(imageUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('Product Details', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(description),
                SizedBox(height: 10),
                Text('Total Price', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(price, style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
              },
              icon: Icon(Icons.shopping_cart),
              label: Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
