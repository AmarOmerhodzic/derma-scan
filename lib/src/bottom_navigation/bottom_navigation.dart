import 'package:derma_scan/src/modules/history/history_screen.dart';
import 'package:derma_scan/src/modules/scan/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/color.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  int selectedIndex = 0;

  HomeScreenState();

  final List<Widget> tabs = [
    // Define your tabs here
    // Example: Tab1(), Tab2(), Tab3(), Tab4()
    ScanScreen(),
    HistoryScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex], // Display the selected tab
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorConstants.secondary,
        backgroundColor: ColorConstants.primary,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Skeniraj',
            backgroundColor: ColorConstants.background,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded),
            label: 'Historija',
            backgroundColor: ColorConstants.background,
          ),
        ],
      ),
    );
  }
}
