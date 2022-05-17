import 'package:flutter/material.dart';
import 'package:linkedin_ui/view/screens/home_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: ('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.supervised_user_circle_outlined,
                ),
                label: ('My network'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_circle,
                  ),
                  label: ('Post')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notification_important,
                  ),
                  label: ('Notifications')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_bag,
                  ),
                  label: ('Jobs'))
            ],
          ),
          body: _children[_currentIndex],
        );
      },
    );
  }
}
