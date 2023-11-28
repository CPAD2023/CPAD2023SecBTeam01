import 'package:flutter/material.dart';

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
        title: Text('Goal Checklist'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Add item to checklist',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addItem,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _checklist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _checklist[index]['item'],
                    style: TextStyle(
                      color: _checklist[index]['done'] ? Colors.green : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      _checklist[index]['done']
                          ? Icons.check_circle
                          : Icons.check_circle_outline,
                      color: _checklist[index]['done'] ? Colors.green : null,
                    ),
                    onPressed: () => _toggleItem(index),
                  ),
                  onLongPress: () => _removeItem(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
