import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navigation_bar.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'MindEase App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Contact Number: +1234567890',
            ),
            const SizedBox(height: 10),
            Text(
              'Email: contact@mindease.com',
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 3, 
        onTap: (index) {
          Navigator.popUntil(context, ModalRoute.withName('/home'));
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/meditation');
              break;
            case 2:
              Navigator.pushNamed(context, '/music');
              break;
            case 3:
              Navigator.pushNamed(context, '/contact');
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
