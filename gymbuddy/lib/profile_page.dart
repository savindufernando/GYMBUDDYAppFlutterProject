import 'package:flutter/material.dart';
import 'login_page.dart';
import 'main.dart';
import 'widgets/bottom_nav.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String userName = "Savindu Fernando";
  final String userEmail = "savindunipun30@gmail.com";
  final String userPhone = "+94 76 80 94 736";


  void toggleTheme() {
    if (GymBuddyApp.themeNotifier.value == ThemeMode.light) {
      GymBuddyApp.themeNotifier.value = ThemeMode.dark;
    } else {
      GymBuddyApp.themeNotifier.value = ThemeMode.light;
    }
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Logout"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = GymBuddyApp.themeNotifier.value == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: _logout,
                tooltip: 'Log Out',
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/unnamed.jpg'), // Replace with your image
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(userEmail),
                    Text(userPhone),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade200, // Background color
                ),
                onPressed: () {
                },
                child: Text("My Orders"),
              ),
            ),
            SizedBox(height: 20),
            // My Favorites Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                },
                child: Text("My Favorites"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dark Mode', style: TextStyle(color: Colors.white)),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    toggleTheme();
                  },
                ),
              ],
            ),
          ),
          BottomNav(currentIndex: 3),
        ],
      ),
    );
  }
}
