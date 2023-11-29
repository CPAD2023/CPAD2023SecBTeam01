import 'package:flutter/material.dart';
import '../../common/colo_extension.dart';
import '../login/what_your_goal_view.dart';
import 'calendar_screen.dart';
import 'goal_checklist_page.dart';

class JournalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 0,
        leading: const SizedBox(),
        title: Text(
          "Journal Writing",
          style: TextStyle(
              color: TColor.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
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
                  builder: (context) => WhatYourGoalView(),
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
    );
  }
}
