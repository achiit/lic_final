import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:internship2/Screens/Collection/collection.dart';
import 'package:internship2/Screens/Menu.dart';
import 'package:internship2/Screens/Place/plaace.dart';
import 'package:internship2/Screens/deposit/deposit_screen.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  final tabs = [
    const Center(
      child: place(),
    ),
    const Center(
      child: menu(),
    ),
    Center(
      child: place(),
    ),
    Center(
      child: collection(1),
    ),
    Center(
      child: deposit_screen(),
    ),
  ];
  var navigationBarIndex = 1;
  Color selectedColor = Color(0xff32B9AE); // Define the selected tab color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: tabs[navigationBarIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: BottomNavigationBar(
          iconSize: 30,
          backgroundColor: Colors.white,
          onTap: (index) {
            changeIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 15.0),
          selectedLabelStyle: TextStyle(color: Colors.black, fontSize: 15.0),
          currentIndex: navigationBarIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                  color: navigationBarIndex == 0
                      ? selectedColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  navigationBarIndex == 0
                      ? Icons.account_circle_rounded
                      : Icons.account_circle_outlined,
                  color: navigationBarIndex == 0 ? Colors.white : Colors.black,
                ),
              ),
              label: "Place",
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                  color: navigationBarIndex == 1
                      ? selectedColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  navigationBarIndex == 1
                      ? Icons.search_rounded
                      : Icons.search_outlined,
                  color: navigationBarIndex == 1 ? Colors.white : Colors.black,
                ),
              ),
              label: "Menu",
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                  color: navigationBarIndex == 2
                      ? selectedColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  navigationBarIndex == 2
                      ? Icons.home_filled
                      : Icons.home_outlined,
                  color: navigationBarIndex == 2 ? Colors.white : Colors.black,
                ),
              ),
              label: "Account Summary",
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                  color: navigationBarIndex == 3
                      ? selectedColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  navigationBarIndex == 3
                      ? Icons.event_note_sharp
                      : Icons.event_note_outlined,
                  color: navigationBarIndex == 3 ? Colors.white : Colors.black,
                ),
              ),
              label: "Collection",
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                  color: navigationBarIndex == 4
                      ? selectedColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  navigationBarIndex == 4
                      ? Icons.account_balance
                      : Icons.account_balance_outlined,
                  color: navigationBarIndex == 4 ? Colors.white : Colors.black,
                ),
              ),
              label: "Balance",
            ),
          ],
        ),
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      navigationBarIndex = index;
    });
  }
}
