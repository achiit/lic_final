// import 'dart:math';

// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class AccountSummary extends StatefulWidget {
//   static const id = '/acc_summ';
//   const AccountSummary({super.key});

//   @override
//   State<AccountSummary> createState() => _AccountSummaryState();
// }

// class _AccountSummaryState extends State<AccountSummary> {
//   final List<double> values = [
//     Random().nextDouble() * 100,
//     Random().nextDouble() * 100,
//     Random().nextDouble() * 100,
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 68,
//             ),
//             Container(
//               width: 400,
//               height: 140,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Color(0xFF205955),
//               ),
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(30.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Money Collection",
//                             style: TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xff55E8DC),
//                             ),
//                           ),
//                           Text(
//                             "₹ 1,00,000",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Collection Today",
//                             style: TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Text(
//                             "₹ 24,567",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 85),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "OVERALL COLLECTION",
//                     style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
//                   ),
//                   Text(
//                     "View Report",
//                     style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 70,
//             ),
//             Container(
//               width: 300,
//               height: 300,
//               child: Stack(
//                 children: [
//                   PieChart(
//                     PieChartData(
//                       startDegreeOffset: 90,
//                       //centerSpaceRadius: 80,
//                       borderData: FlBorderData(show: false),
//                       sectionsSpace: 1,
//                       centerSpaceRadius: 80,
//                       sections: [
//                         PieChartSectionData(
//                             value: 35, color: Color(0xffF8BBD0), radius: 100),
//                         PieChartSectionData(
//                             value: 40, color: Color(0xffFF8A65), radius: 100),
//                         PieChartSectionData(
//                             value: 55, color: Color(0xff73C2DB), radius: 100),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     top: 130,
//                     left: 80,
//                     child: Text(
//                       "Collections",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }
