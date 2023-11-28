import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navigation_bar.dart';

class MeditationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _moods = [
    {'mood': 'Relaxation', 'color': Colors.blue},
    {'mood': 'Focus', 'color': Colors.green},
    {'mood': 'Stress Relief', 'color': Colors.orange},
    {'mood': 'Energy Boost', 'color': Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.white], // Set your gradient colors here
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text('Meditation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: _moods.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _navigateToMeditationOptions(context, _moods[index]['mood']);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: _moods[index]['color'],
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Center(
                  child: Text(
                    _moods[index]['mood'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),

      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1, // Set the current index for the Meditation screen
        onTap: (index) {
          Navigator.popUntil(context, ModalRoute.withName('/home'));
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/meditation');
              break;
            case 2:
              Navigator.pushNamed(context, '/music');
              break;
            case 3:
              Navigator.pushNamed(context, '/contact');
              break;
            default:
              break;
          }
        },
      ),
    );
  }

  void _navigateToMeditationOptions(BuildContext context, String mood) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MeditationOptionsScreen(mood: mood),
      ),
    );
  }
}

class MeditationOptionsScreen extends StatefulWidget {
  final String mood;

  MeditationOptionsScreen({required this.mood});

  @override
  _MeditationOptionsScreenState createState() => _MeditationOptionsScreenState();
}

class _MeditationOptionsScreenState extends State<MeditationOptionsScreen> {
  List<Map<String, dynamic>> _meditations = [
    {'title': 'Meditation 1', 'completed': false},
    {'title': 'Meditation 2', 'completed': false},
    {'title': 'Meditation 3', 'completed': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mood),
      ),
      body: ListView.builder(
        itemCount: _meditations.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _toggleMeditationCompletion(index);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: _meditations[index]['completed'] ? Colors.green : Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: _meditations[index]['completed'] ? Colors.transparent : Colors.black,
                  width: 2.0,
                ),
              ),
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  _meditations[index]['title'],
                  style: TextStyle(
                    color: _meditations[index]['completed'] ? Colors.white : Colors.black,
                  ),
                ),
                trailing: _meditations[index]['completed']
                    ? Icon(Icons.check_circle, color: Colors.white)
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }

  void _toggleMeditationCompletion(int index) {
    setState(() {
      _meditations[index]['completed'] = !_meditations[index]['completed'];
    });
  }
}
