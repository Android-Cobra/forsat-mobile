import 'package:flutter/material.dart';
import 'package:forsat_frontend/presentation/auth/account_page.dart';
import 'package:forsat_frontend/presentation/favorites/favorites_page.dart';
import 'package:forsat_frontend/presentation/forum/questions_page.dart';
import 'package:forsat_frontend/presentation/opportunities/opportunities.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Business',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: School',
  //     style: optionStyle,
  //   ),
  // ];

  PageController _pageController = PageController();

  final List<Widget> _screens = [
    OpportunitiesPage(),
    QuestionsPage(),
    FavoritiesPage(),
    AccountPage()
  ];

  int _selectedIndex = 0;

  void _onPageChanged(int pageIndex) {
    setState(() {
      _selectedIndex = pageIndex;
    });
  }

  void _onItemTapped(int itemIndex) {
    _pageController.jumpToPage(itemIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _screens,
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,

        items: [
          BottomNavigationBarItem(
            //label: 'Opportunities',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            //label: 'Forum',
            icon: Icon(Icons.chat),
          ),
          BottomNavigationBarItem(
            //label: 'Favorites',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            //label: 'Account',
            icon: Icon(Icons.person),
          ),],
      ),
    );
  }
}
