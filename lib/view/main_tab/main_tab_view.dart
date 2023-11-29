import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/tab_button.dart';
import 'package:fitness/view/main_tab/select_view.dart';
import 'package:flutter/material.dart';

import '../bmi_calculator/bmiCalculatorview.dart';
import '../home/home_view.dart';
import '../journal/journal_screen.dart';
import '../profile/profile_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  final PageStorageBucket pageBucket = PageStorageBucket(); 
  Widget currentTab = const HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: PageStorage(bucket: pageBucket, child: currentTab),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        decoration: BoxDecoration(color: TColor.white, boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, -2))
        ]),
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TabButton(
              iconData: Icons.home,
                isActive: selectTab == 0,
                onTap: () {
                  selectTab = 0;
                  currentTab = const HomeView();
                  if (mounted) {
                    setState(() {});
                  }
                },
              selectedColor: Colors.teal, // Set selected color
              unselectedColor: Colors.grey,),
            TabButton(
              iconData: Icons.directions_run,
                isActive: selectTab == 1,
                onTap: () {
                  selectTab = 1;
                  currentTab = const SelectView();
                  if (mounted) {
                    setState(() {});
                  }
                },
              selectedColor: Colors.teal, // Set selected color
              unselectedColor: Colors.grey,
                ),
            TabButton(
              iconData: Icons.calculate,
                isActive: selectTab == 2,
                onTap: () {
                  selectTab = 2;
                   currentTab = const BMICalculatorView();
                  if (mounted) {
                    setState(() {});
                  }
                },
              selectedColor: Colors.teal, // Set selected color
              unselectedColor: Colors.grey,),
            TabButton(
              iconData: Icons.book,
              isActive: selectTab == 3,
              onTap: () {
                selectTab = 3;
                currentTab = JournalScreen();
                if (mounted) {
                  setState(() {});
                }
              },
              selectedColor: Colors.teal, // Set selected color
              unselectedColor: Colors.grey,),
            TabButton(
              iconData: Icons.person,
                isActive: selectTab == 4,
                onTap: () {
                  selectTab = 4;
                   currentTab = const ProfileView();
                  if (mounted) {
                    setState(() {});
                  }
                },
              selectedColor: Colors.teal, // Set selected color
              unselectedColor: Colors.grey,)
          ],
        ),
      )),
    );
  }
}
