import 'package:flutter/material.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

//Mood with colored selection
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedEmojiIndex = -1;
  bool _notificationsEnabled = true; 

  final List<Map<String, dynamic>> moodList = [
    {
      'emoji': '😄',
      'description': 'Happy',
      'color': Colors.yellow,
    },
    {
      'emoji': '😢',
      'description': 'Sad',
      'color': Colors.blue,
    },
    {
      'emoji': '😠',
      'description': 'Angry',
      'color': Colors.red,
    },
    {
      'emoji': '😊',
      'description': 'Content',
      'color': Colors.green,
    },
    {
      'emoji': '😴',
      'description': 'Sleepy',
      'color': Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.white], 
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text('Home',style: TextStyle(color: Colors.white)),
        centerTitle: true,

      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                   
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Row(
                children: [
                  Text('Notifications Toggle'),
                  Spacer(),
                  Switch(
                    value: _notificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                    },
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  _notificationsEnabled = !_notificationsEnabled;
                  
                });
              },
            
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/help');
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hello! How are you feeling today?',
              style: TextStyle(fontSize: 24, color: Colors.green),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                moodList.length,
                    (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedEmojiIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: _selectedEmojiIndex == index ? moodList[index]['color'] : null,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        moodList[index]['emoji'],
                        style: TextStyle(
                          fontSize: 30,
                          color: _selectedEmojiIndex == index ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 40),
            if (_selectedEmojiIndex != -1)
              Text(
                'Your mood now: ${moodList[_selectedEmojiIndex]['description']}',
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0, 
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
}

