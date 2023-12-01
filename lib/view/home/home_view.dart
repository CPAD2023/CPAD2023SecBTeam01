import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:flutter/material.dart';
import '../../common/colo_extension.dart';
import 'activity_tracker_view.dart';
import 'notification_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

enum Mood { Smile, Sad, Angry, Anxiety, Neutral }

class _HomeViewState extends State<HomeView> {

  final user = FirebaseAuth.instance.currentUser!;

  Mood selectedMood = Mood.Smile;

  Map<Mood, String> moodMessages = {
    Mood
        .Smile: "Embrace the day with a smile! Your positivity can light up any moment and bring joy to those around you. Keep shining!",
    Mood
        .Sad: "It's okay not to be okay. Remember, even on the cloudiest days, the sun is just behind the clouds. Take your time, and things will brighten up.",
    Mood
        .Angry: "Feeling angry is a part of being human. Take a breath, step back, and find a positive outlet for that energy. You've got this! Channel that fire into something constructive.",
    Mood
        .Anxiety: "I know it can be tough when anxiety creeps in. Remember, you're stronger than you think. Take slow, deep breaths and focus on the present moment. You're not alone, and this feeling will pass.",
    Mood
        .Neutral: "Sometimes being neutral is a moment to reflect and find balance. It's okay to pause, take stock, and decide how you want to engage. Use this moment to gather your thoughts and move forward."
  };

  Widget buildMoodButton(Mood mood) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMood = mood;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selectedMood == mood ? Colors.teal : Colors.transparent,
        ),
        child: Center(
          child: Text(
            getEmoji(mood),
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }

  String getEmoji(Mood mood) {
    switch (mood) {
      case Mood.Smile:
        return '😊';
      case Mood.Sad:
        return '😞';
      case Mood.Angry:
        return '😡';
      case Mood.Anxiety:
        return '😰';
      case Mood.Neutral:
        return '😐';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      backgroundColor: TColor.white,

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: media.width * 0.05,
                        ),
                        Center(
                          child: Text(
                            "Hi, " + user.email!,
                            style: TextStyle(color: TColor.gray, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: media.width * 0.05,
                        ),

                        Text(
                          "How are you feeling today?",
                          style: TextStyle(
                              color: TColor.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationView(),
                            ),
                          );
                        },
                      icon: Icon(
                        Icons.tips_and_updates_rounded,
                        size: 25,
                        color: TColor.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    buildMoodButton(Mood.Sad),
                    buildMoodButton(Mood.Angry),
                    buildMoodButton(Mood.Smile),
                    buildMoodButton(Mood.Anxiety),
                    buildMoodButton(Mood.Neutral),
                  ],

                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Center(
                  child: selectedMood != Mood.Neutral ||
                      selectedMood == Mood.Neutral
                      ? Container(
                    width: media.width * 0.8,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: selectedMood == Mood.Neutral ? Colors.teal : TColor
                          .primaryColor2.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      moodMessages[selectedMood]!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: selectedMood == Mood.Neutral
                            ? Colors.white
                            : TColor.black,
                        fontSize: 14,
                      ),
                    ),
                  )
                      : SizedBox(), // Empty container if no mood selected
                ),
                SizedBox(height: 40),
                Text(
                  "Activity Tracker",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  decoration: BoxDecoration(
                    color: TColor.primaryColor2.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lets check your activity",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 70,
                        height: 40,
                        child: RoundButton(
                          title: "Check",
                          type: RoundButtonType.bgGradient,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const ActivityTrackerView(),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
