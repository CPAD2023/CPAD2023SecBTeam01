import 'dart:math';

import 'package:flutter/material.dart';

import '../../common/colo_extension.dart';
import '../../common_widget/notification_row.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List<String> tipsOfTheDay = [
    "Practice gratitude by listing things you're thankful for each day.",
    "Seek professional help or counseling if you're feeling overwhelmed.",
    "Engage in physical exercise to boost your mood and energy levels.",
    "Learn to say 'no' when you're feeling overcommitted or stressed.",
    "Create a routine that includes time for relaxation and self-reflection.",
    "Limit exposure to negative news or social media to protect your mental health.",
    "Volunteer or help others as acts of kindness can improve your well-being.",
    "Stay hydrated and maintain a balanced diet for overall health.",
    "Take breaks and practice deep breathing to reduce stress.",
    "Connect with loved ones regularly to nurture social connections.",
    "Set realistic goals to foster a sense of accomplishment.",
    "Get enough quality sleep to support mental and physical well-being.",
    "Engage in hobbies or activities that bring you joy and relaxation.",
    "Practice mindfulness meditation for mental clarity and focus.",
    "Challenge negative thoughts with positive affirmations.",
    "Learn and practice effective time management strategies.",
    "Establish boundaries to maintain a healthy work-life balance.",
    "Find ways to laugh and embrace humor in daily life.",
    "Educate yourself about mental health and seek understanding.",
    "Celebrate small achievements to boost self-esteem and motivation.",
    // Add more tips as needed
  ];

  List<String> selectedTips = [];

  @override
  void initState() {
    super.initState();
    refreshTips(); // Initially populate tips on load
  }

  // Function to get random tips
  void refreshTips() {
    final random = Random();
    tipsOfTheDay.shuffle(); // Shuffle the tips list
    setState(() {
      // Select the first 5 tips after shuffling
      selectedTips = tipsOfTheDay.sublist(0, min(5, tipsOfTheDay.length));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: TColor.lightGray,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/img/black_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Health tips..",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: TColor.white,
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        itemBuilder: ((context, index) {
          var nObj = {"title": selectedTips[index]}; // Empty time for demonstration
          return NotificationRow(nObj: nObj);
        }),
        separatorBuilder: (context, index) {
          return Divider(color: TColor.gray.withOpacity(0.5), height: 1);
        },
        itemCount: selectedTips.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          refreshTips(); // Update the selected tips on click
        },
        child: Icon(Icons.refresh), // Icon for refreshing tips
      ),
    );
  }
}
