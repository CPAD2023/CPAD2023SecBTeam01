import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JournalWritingPage extends StatefulWidget {
  final DateTime selectedDay;

  JournalWritingPage({required this.selectedDay});

  @override
  _JournalWritingPageState createState() => _JournalWritingPageState();
}

class _JournalWritingPageState extends State<JournalWritingPage> {
  final TextEditingController _textEditingController = TextEditingController();
  late SharedPreferences _prefs;
  String _journalEntry = '';

  @override
  void initState() {
    super.initState();
    _initializePrefs();
  }

  Future<void> _initializePrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _loadJournalEntry();
  }

  Future<void> _loadJournalEntry() async {
    final key = '${widget.selectedDay.year}-${widget.selectedDay.month}-${widget.selectedDay.day}';
    setState(() {
      _journalEntry = _prefs.getString(key) ?? '';
      _textEditingController.text = _journalEntry;
    });
  }

  Future<void> _saveJournalEntry() async {
    final key = '${widget.selectedDay.year}-${widget.selectedDay.month}-${widget.selectedDay.day}';
    setState(() {
      _journalEntry = _textEditingController.text;
    });
    await _prefs.setString(key, _journalEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal Entry'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          Text(
            'How was your day today?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: _textEditingController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Write your journal here...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await _saveJournalEntry();
              Navigator.pop(context); // Go back to the calendar screen after saving
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
