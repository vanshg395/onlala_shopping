import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

import './home_screen.dart';
import './search_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -4),
              blurRadius: 5,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: SafeArea(
          child: TitledBottomNavigationBar(
            enableShadow: false,
            currentIndex: _selectedPageIndex,
            onTap: (value) {
              setState(() {
                _selectedPageIndex = value;
              });
            },
            activeColor: Theme.of(context).primaryColor,
            items: [
              TitledNavigationBarItem(
                icon: Icons.home,
                title: Text('Home'),
              ),
              TitledNavigationBarItem(
                icon: Icons.search,
                title: Text('Search'),
              ),
              TitledNavigationBarItem(
                icon: Icons.shopping_basket,
                title: Text('Orders'),
              ),
              TitledNavigationBarItem(
                icon: Icons.chat,
                title: Text('Chat'),
              ),
              TitledNavigationBarItem(
                icon: Icons.account_circle,
                title: Text('Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
