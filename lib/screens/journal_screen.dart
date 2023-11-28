import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navigation_bar.dart';

import 'calendar_screen.dart';
import 'goal_checklist_page.dart';

class MusicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.white], // Set your gradient colors here
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text('Journal Writing'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CalendarScreen(),
                ),
              );
            },
            child: Card(
              elevation: 4,
              child: ListTile(
                title: Text('Open Journal'),
                subtitle: Text('Write about your day'),
                leading: Icon(Icons.calendar_today),
              ),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GoalChecklistPage(),
                ),
              );
            },
            child: Card(
              elevation: 4,
              child: ListTile(
                title: Text('Goal'),
                subtitle: Text('Set your goal'),
                leading: Icon(Icons.flag),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2, 
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
