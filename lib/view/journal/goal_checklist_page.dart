// import 'package:flutter/material.dart';
//
// class GoalChecklistPage extends StatefulWidget {
//   @override
//   _GoalChecklistPageState createState() => _GoalChecklistPageState();
// }
//
// class _GoalChecklistPageState extends State<GoalChecklistPage> {
//   final TextEditingController _textEditingController = TextEditingController();
//   List<Map<String, dynamic>> _checklist = [];
//
//   void _addItem() {
//     setState(() {
//       final newItem = _textEditingController.text.trim();
//       if (newItem.isNotEmpty) {
//         _checklist.add({'item': newItem, 'done': false});
//         _textEditingController.clear();
//       }
//     });
//   }
//
//   void _removeItem(int index) {
//     setState(() {
//       _checklist.removeAt(index);
//     });
//   }
//
//   void _toggleItem(int index) {
//     setState(() {
//       _checklist[index]['done'] = !_checklist[index]['done'];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.teal, Colors.white], // Set your gradient colors here
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         title: Text('Goal Checklist'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(16),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _textEditingController,
//                     decoration: InputDecoration(
//                       hintText: 'Add item to checklist',
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 IconButton(
//                   icon: Icon(Icons.add),
//                   onPressed: _addItem,
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _checklist.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(
//                     _checklist[index]['item'],
//                     style: TextStyle(
//                       color: _checklist[index]['done'] ? Colors.teal : null,
//                     ),
//                   ),
//                   trailing: IconButton(
//                     icon: Icon(
//                       _checklist[index]['done']
//                           ? Icons.check_circle
//                           : Icons.check_circle_outline,
//                       color: _checklist[index]['done'] ? Colors.teal : null,
//                     ),
//                     onPressed: () => _toggleItem(index),
//                   ),
//                   onLongPress: () => _removeItem(index),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

import '../../common/colo_extension.dart';
import '../login/what_your_goal_view.dart';

class GoalChecklistPage extends StatefulWidget {
  @override
  _GoalChecklistPageState createState() => _GoalChecklistPageState();
}

class _GoalChecklistPageState extends State<GoalChecklistPage> {
  final TextEditingController _textEditingController = TextEditingController();
  List<Map<String, dynamic>> _checklist = [];

  void _addItem() {
    setState(() {
      final newItem = _textEditingController.text.trim();
      if (newItem.isNotEmpty) {
        _checklist.add({'item': newItem, 'done': false});
        _textEditingController.clear();
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      _checklist.removeAt(index);
    });
  }

  void _toggleItem(int index) {
    setState(() {
      _checklist[index]['done'] = !_checklist[index]['done'];
    });
  }

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
          "Goal",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WhatYourGoalView()));
                  },
                  child: const Text('Go to Main Tab View'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
