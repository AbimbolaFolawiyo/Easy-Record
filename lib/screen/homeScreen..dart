import 'package:flutter/material.dart';

import './home.dart';
import './gallery.dart';
import './completed_jobs.dart';
import './more.dart';
import '../widgets/add_dialogue.dart';
import '../widgets/new_job.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  final _tabPages = [
    Home(),
    Gallery(),
    // AddJob(),
    NewJob(),
    // AddDialogue(),
    // AddNewStudent(), 
    CompletedJobs(),
    MorePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabPages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        elevation: 0,
        iconSize: 24,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              title: Text('Home', style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.lightBlueAccent),
          BottomNavigationBarItem(
            icon: Icon(Icons.image, color: Colors.black),
            title: Text('Gallery', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.black),
            title: Text('Add Job', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check, color: Colors.black),
            title: Text('Completed', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert, color: Colors.black),
            title: Text('More', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.red,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
    );
  }
}
