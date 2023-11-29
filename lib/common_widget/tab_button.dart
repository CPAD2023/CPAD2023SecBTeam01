import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;
  final bool isActive;
  final Color selectedColor;
  final Color unselectedColor;

  const TabButton({
    Key? key,
    required this.iconData,
    required this.isActive,
    required this.onTap,
    required this.selectedColor,
    required this.unselectedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            size: 25,
            color: isActive ? selectedColor : unselectedColor,
          ),
          SizedBox(
            height: isActive ? 8 : 12,
          ),
          if (isActive)
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [selectedColor, selectedColor],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            )
        ],
      ),
    );
  }
}
