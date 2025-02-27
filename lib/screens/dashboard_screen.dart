import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:match_making/screens/all_matches_screen.dart';
import 'package:match_making/screens/discover_screen.dart';
import 'package:match_making/screens/messages_screen.dart';
import 'package:match_making/utils/themes.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> screens = [
    const DiscoverScreen(),
    MatchesScreen(),
    const MessagesScreen(),
    Container()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: getMaterialColor(Colors.red),
          unselectedItemColor: getMaterialColor(Colors.grey),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: ClipOval(child: SvgPicture.asset('assets/images/1.svg', height: 50, width: 50,colorFilter:ColorFilter.mode(_currentIndex == 0 ? Theme.of(context).primaryColorLight : Colors.transparent , BlendMode.color))),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: ClipOval(child: SvgPicture.asset('assets/images/2.svg', height: 50, width: 50, colorFilter:ColorFilter.mode(_currentIndex == 1 ? Theme.of(context).primaryColorLight : Colors.transparent , BlendMode.color) ,)),
              ),
              label: "matches",
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: ClipOval(child: SvgPicture.asset('assets/images/3.svg', height: 50, width: 50, colorFilter:ColorFilter.mode(_currentIndex == 2 ? Theme.of(context).primaryColorLight: Colors.transparent , BlendMode.color))),
              ),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: ClipOval(child: SvgPicture.asset('assets/images/4.svg', height: 50, width: 50,colorFilter:ColorFilter.mode(_currentIndex == 3 ? Theme.of(context).primaryColorLight : Colors.transparent , BlendMode.color))),
              ),
              label: "Profile",
            ),
          ],
        ),
    );
  }
}


