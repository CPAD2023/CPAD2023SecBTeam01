import 'package:flutter/material.dart';
import 'package:mellnify2/screens/homeScreen/aboutScreen.dart';
import 'package:mellnify2/screens/homeScreen/helpScreen.dart';
import 'package:mellnify2/screens/homeScreen/profile_screen.dart';
import 'package:mellnify2/screens/homeScreen/settings.dart';
import 'package:mellnify2/screens/welcome_screen.dart';
import 'package:mellnify2/screens/home_screen.dart';
import 'package:mellnify2/screens/meditation_screen.dart';
import 'package:mellnify2/screens/journal_screen.dart';
import 'package:mellnify2/screens/contact_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindEase',
      theme: ThemeData(
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/home': (context) => HomeScreen(),
        '/meditation': (context) => MeditationScreen(),
        '/music': (context) => MusicScreen(),
        '/contact': (context) => ContactScreen(),
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => SettingsScreen(),
        '/about': (context) => AboutScreen(),
        '/help': (context) => HelpScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
