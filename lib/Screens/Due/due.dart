import 'package:flutter/material.dart';
import 'package:internship2/Providers/scheme_selector.dart';
import 'package:internship2/Providers/custom_animated_bottom_bar.dart';
import 'package:internship2/Providers/_buildBottomBar.dart';
import '../../models/views/due_display.dart';
import 'package:internship2/Screens/Menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class due extends StatefulWidget {
  static const id = '/due';
  @override
  State<due> createState() => _dueState();
}

class _dueState extends State<due> {
  late String Member_Name;
  late String Plan;
  late String Account_No;
  late Timestamp date_open;
  late Timestamp date_mature;
  var _isloading = false;
  late final _firestone = FirebaseFirestore.instance;
  int _currentIndex = 1;
  final _inactiveColor = Color(0xffEBEBEB);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const menu()),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xff144743),
          ),
        ),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              width: size.width * 0.60,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                  color: Color(0XFFEBEBEB),
                  borderRadius: BorderRadius.circular(18)),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0XFF999999),
                    ),
                    hintText: 'Search',
                    border: InputBorder.none),
              ),
            ),
            IconButton(
                iconSize: 50,
                onPressed: () {},
                icon: Image.asset('assets/Acc/trailing.png'))
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              border: Border.all(
                width: 3,
                color: Colors.grey,
                style: BorderStyle.solid,
              ),
            ),
            child: _buildAboveBar(),
          ),
          StreamBuilder(
              stream: _firestone
                  .collection('new_account')
                  .orderBy('Member_Name')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                  );
                }
                final tiles = snapshot.data!.docs;
                List<Widget> Memberlist = [];
                for (var tile in tiles) {
                  Member_Name = tile.get('Member_Name');
                  Plan = tile.get('Plan');
                  Account_No = tile.get('Account_No').toString();
                  date_open = tile.get('Date_of_Opening');
                  date_mature = tile.get('Date_of_Maturity');
                  Memberlist.add(
                    due_data(
                      size: size,
                      Member_Name: Member_Name,
                      Plan: Plan,
                      Account_No: Account_No,
                      date_mature: date_mature,
                      date_open: date_open,
                    ),
                  );
                }
                return _isloading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                                height: size.height,
                                child: ListView.builder(
                                  itemCount: Memberlist.length,
                                  itemBuilder: (context, i) => Memberlist[i],
                                )),
                          ],
                        ),
                      );
              }),
          // SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       Container(
          //         height: size.height * 0.25,
          //         child: due_data(size: size),
          //       ),
          //       Container(
          //         height: size.height * 0.25,
          //         child: due_data(size: size),
          //       ),
          // Container(
          //   height: size.height * 0.23,
          //   child: due_data(size: size),
          // ),
          //     ],
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget _buildAboveBar() {
    Size size = MediaQuery.of(context).size;
    return CustomAnimatedAboveBar(
      containerHeight: size.height * 0.07,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <AboveNavyBarItem>[
        AboveNavyBarItem(
          alpha: 'All',
          activeColor: Colors.grey,
          inactiveColor: _inactiveColor,
        ),
        AboveNavyBarItem(
          alpha: 'A',
          activeColor: Colors.grey,
          inactiveColor: _inactiveColor,
        ),
        AboveNavyBarItem(
          alpha: 'B',
          activeColor: Colors.grey,
          inactiveColor: _inactiveColor,
        ),
      ],
    );
  }
}
