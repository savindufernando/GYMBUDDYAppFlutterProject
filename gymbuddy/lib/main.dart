import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'register_page.dart';
import 'home_page.dart';
import 'shop_page.dart';
import 'services_page.dart';
import 'login_page.dart';
import 'themes/app_theme.dart';
import 'start.dart'; // Only need this once

void main() => runApp(GymBuddyApp());

class GymBuddyApp extends StatelessWidget {
  // ValueNotifier to track current theme
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentThemeMode, child) {
        return MaterialApp(
          title: 'Gym Buddy',
          themeMode: currentThemeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: StartPage(), // StartPage as the default home page
          routes: {
            '/home': (context) => HomePage(),
            '/shop': (context) => ShopPage(),
            '/services': (context) => ServicesPage(),
            '/profile': (context) => ProfilePage(),
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
          },
        );
      },
    );
  }
}
