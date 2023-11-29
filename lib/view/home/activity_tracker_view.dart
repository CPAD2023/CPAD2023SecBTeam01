import 'dart:math';

import 'package:flutter/material.dart';

import '../../common/colo_extension.dart';

class ActivityTrackerView extends StatefulWidget {
  const ActivityTrackerView({super.key});

  @override
  State<ActivityTrackerView> createState() => _ActivityTrackerViewState();
}

class _ActivityTrackerViewState extends State<ActivityTrackerView> {
  int touchedIndex = -1;

  List latestArr = [];

  @override
  void initState() {
    super.initState();
    generateRandomWorkouts();
  }

  void generateRandomWorkouts() {
    final Random random = Random();
    const List<String> workoutTitles = [
      "Running",
      "Cycling",
      "Swimming",
      "Jumping Jacks",
      "Push-ups",
      "Sit-ups",
      "Yoga",
    ];

    latestArr = List.generate(2, (index) {
      final randomIndex = random.nextInt(workoutTitles.length);
      IconData icon;
      switch (randomIndex) {
        case 0:
          icon = Icons.directions_run;
          break;
        case 1:
          icon = Icons.directions_bike;
          break;
        case 2:
          icon = Icons.pool;
          break;
        case 3:
          icon = Icons.fitness_center;
          break;
        case 4:
          icon = Icons.accessibility;
          break;
        case 5:
          icon = Icons.self_improvement;
          break;
        case 6:
          icon = Icons.spa;
          break;
        default:
          icon = Icons.help; // Default icon
          break;
      }
      return {
        "icon": icon,
        "title": workoutTitles[randomIndex],
      };
    });
  }


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
          "Activity Tracker",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),

      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Steps Taken Today",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    TColor.primaryColor2.withOpacity(0.3),
                    TColor.primaryColor1.withOpacity(0.3)
                  ]),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child:
                          Text(
                            "5076 Steps Walked",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),

                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child:
                          Text(
                            "Goal: 8000 Steps",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),

                        ),

                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Highest Record",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    TColor.primaryColor2.withOpacity(0.3),
                    TColor.primaryColor1.withOpacity(0.3)
                  ]),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child:
                          Text(
                            "18/11/2023",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),

                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child:
                          Text(
                            "24844 Steps",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),

                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child:
                          Text(
                            "17.39 km",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),

                        ),
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(
                height: media.width * 0.15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Workout Plans for you",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: latestArr.length,
                itemBuilder: (context, index) {
                  var wObj = latestArr[index] as Map? ?? {};
                  return ListTile(
                    leading: Icon(wObj['icon'] as IconData),
                    title: Text(wObj['title'] as String),
                  );
                },
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
