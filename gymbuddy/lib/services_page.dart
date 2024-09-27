import 'package:flutter/material.dart';
import 'package:gymbuddy/widgets/bottom_nav.dart';
import 'widgets/category_filter.dart';
import 'widgets/service_card.dart';
import 'service_detail_page.dart';

class ServicesPage extends StatelessWidget {
  final List<Map<String, String>> services = [
    {
      'title': 'Body Building Coaching',
      'price': 'Rs.4000',
      'imageUrl': 'assets/images/bodybuiling.png',
      'coach': 'John Doe',
      'experience': '10'
    },
    {
      'title': 'MMA Training',
      'price': 'Rs.5000',
      'imageUrl': 'assets/images/images.jpeg',
      'coach': 'Savindu Fernando',
      'experience': '15'
    },
    {
      'title': 'Swimming Classes',
      'price': 'Rs.3000',
      'imageUrl': 'assets/images/swimming.jpg',
      'coach': 'Michael Phelps',
      'experience': '20'
    },
    {
      'title': 'Wrestling Training',
      'price': 'Rs.4500',
      'imageUrl': 'assets/images/wrestling.jpg',
      'coach': 'Kurt Angle',
      'experience': '12'
    },
    {
      'title': 'Calisthenics Training',
      'price': 'Rs.5500',
      'imageUrl': 'assets/images/calisthenics.jpg',
      'coach': 'Frank Medrano',
      'experience': '8'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gym Buddy Services'),
      ),
      bottomNavigationBar: BottomNav(currentIndex: 2),
      body: Column(
        children: [
          CategoryFilter(categories: ['All', 'Swimming', 'Wrestling', 'MMA', 'Bodybuilding', 'Calisthenics']),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceDetailPage(
                          title: service['title']!,
                          price: service['price']!,
                          imageUrl: service['imageUrl']!,
                          coach: service['coach']!,
                          experience: service['experience']!,
                        ),
                      ),
                    );
                  },
                  child: ServiceCard(
                    title: service['title']!,
                    price: service['price']! + ' / Monthly',
                    imageUrl: service['imageUrl']!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
