import 'package:flutter/material.dart';
import 'package:pixametory/screens/home_screen.dart';
import 'package:pixametory/screens/web_view_screen.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [const HomeScreen(), const WebViewScreen()];

    return Scaffold(
      body: screens[index],
      bottomNavigationBar: index == 0 // Show only on Home tab
          ? BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                setState(() {
                  index = value;
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.gamepad_outlined), label: 'Games'),
              ],
            )
          : null, // Hide BottomNavigationBar when index is 1 (Games tab)
    );
  }
}
