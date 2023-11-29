import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/colo_extension.dart';

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
  bool _isEditMode = false; // Flag to determine edit mode

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
      _isEditMode = false; // Exit edit mode after saving
    });
    await _prefs.setString(key, _journalEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "About your day",
          style: TextStyle(
            color: TColor.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Change color to black
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          Text(
            'How was your day today?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
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
                  enabled: _isEditMode, // Set text field to be enabled only in edit mode
                ),
                readOnly: !_isEditMode, // Make the text field read-only when not in edit mode
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_isEditMode) {
            await _saveJournalEntry();
          } else {
            setState(() {
              _isEditMode = true; // Enter edit mode
            });
          }
        },
        label: Text(_isEditMode ? 'Save' : 'Edit'),
        icon: Icon(_isEditMode ? Icons.save : Icons.edit),
        backgroundColor: Colors.teal,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
