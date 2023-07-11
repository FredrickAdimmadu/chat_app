import 'package:flutter/material.dart';
import 'package:yap/screen/add_post_screen.dart';
import 'package:yap/screen/feed_screen.dart';
import 'package:yap/screen/profile_screenn.dart';
import 'package:yap/screen/search_screen.dart';

import 'package:yap/screens/home_screen.dart';

import 'package:yap/screens/search.dart';



import 'package:flutter/cupertino.dart';







class NavigatePage extends StatefulWidget {
  @override
  _NavigatePageState createState() => _NavigatePageState ();



}

class _NavigatePageState extends State<NavigatePage > {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    AddPostScreen(),
    SearchScreenn(),
    FeedScreen(),

     ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(

            icon: Icon(Icons.chat),
            label: 'Chat',
            backgroundColor: CupertinoColors.activeBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: CupertinoColors.activeBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            label: 'Post',
            backgroundColor: CupertinoColors.activeBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'explore',
            backgroundColor: CupertinoColors.activeBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Feeds',
            backgroundColor: CupertinoColors.activeBlue,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Favorites Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Settings Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
