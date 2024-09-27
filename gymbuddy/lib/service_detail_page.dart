import 'package:flutter/material.dart';
import 'package:gymbuddy/widgets/bottom_nav.dart';

class ServiceDetailPage extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final String coach;
  final String experience;

  const ServiceDetailPage({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.coach,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // Handle favorite action
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle cart action
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(currentIndex: 2),
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
                  title,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('Product Details', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Men/ Women'),
                SizedBox(height: 10),
                Text('Coach: $coach', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('$experience years of experience of $title'),
                SizedBox(height: 10),
                Text('Rs. $price (Monthly)', style: TextStyle(fontSize: 20)),
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
