import 'package:flutter/material.dart';
import 'package:internship2/Screens/Collection/collection2.dart';
import 'package:internship2/Screens/Lapse/lapse.dart';
import 'package:internship2/Screens/Place/usersearch.dart';
import 'package:internship2/Screens/Maturity/maturity.dart';

class lapse_title extends StatelessWidget {
  lapse_title(this.Name);
  late String Name;
  late Widget path;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.009,
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => lapse(Name)),
            );
          },
          selected: false,
          focusColor: Color(0xffA9C8C5),
          tileColor: Colors.white,
          selectedTileColor: Color(0xffA9C8C5),
          leading: Container(
            child: Image.asset('assets/place_edit/h3.png'),
          ),
          title: Text(
            '$Name',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
