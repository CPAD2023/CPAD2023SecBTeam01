
import 'package:fitness/common/colo_extension.dart';
import 'package:flutter/material.dart';

class NotificationRow extends StatelessWidget {
  final Map nObj;
  const NotificationRow({super.key, required this.nObj});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nObj["title"].toString(),
                style: TextStyle(
                    color: TColor.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
                          ],
          )),
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/img/sub_menu.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ))
        ],
      ),
    );
  }
}