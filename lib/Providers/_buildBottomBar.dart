// import 'package:flutter/material.dart';
// import 'package:internship2/Providers/custom_animated_bottom_bar.dart';
// import 'package:internship2/Screens/Place/place_edit.dart';

// class buildBottomBar extends StatefulWidget {
//   static const id = '/bottom';
//   @override
//   State<buildBottomBar> createState() => buildBottomBarState();
// }

// class buildBottomBarState extends State<buildBottomBar> {
//   List routes = ['/place', '/menu', '/acc_summ', '/collection', '/place'];
//   final _inactiveColor = Color(0xff71757A);

//   int _currentIndex = 0;

//   bool sel = true;

//   bool notsel = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: routes[_currentIndex],
//       bottomNavigationBar: CustomAnimatedBottomBar(
//         rute: routes[0],
//         containerHeight: 70,
//         backgroundColor: Colors.white,
//         selectedIndex: _currentIndex,
//         showElevation: true,
//         itemCornerRadius: 24,
//         curve: Curves.easeIn,
//         onItemSelected: (index) => setState(() => _currentIndex = index),
//         items: <BottomNavyBarItem>[
//           BottomNavyBarItem(
//               icon: Icon(Icons.account_circle_rounded),
//               activeColor: Color(0xff32B9AE),
//               inactiveColor: _inactiveColor,
//               route: '/place'),
//           BottomNavyBarItem(
//               icon: Icon(Icons.search_rounded),
//               activeColor: Color(0xff32B9AE),
//               inactiveColor: _inactiveColor,
//               route: '/menu'),
//           BottomNavyBarItem(
//               icon: Icon(Icons.home_filled),
//               activeColor: Color(0xff32B9AE),
//               inactiveColor: _inactiveColor,
//               route: '/acc_summ'),
//           BottomNavyBarItem(
//               icon: Icon(Icons.event_note_sharp),
//               activeColor: Color(0xff32B9AE),
//               inactiveColor: _inactiveColor,
//               route: '/collection'),
//           BottomNavyBarItem(
//               icon: Icon(Icons.account_balance),
//               activeColor: Color(0xff32B9AE),
//               inactiveColor: _inactiveColor,
//               route: '/place'),
//         ],
//       ),
//     );
//   }
// }
