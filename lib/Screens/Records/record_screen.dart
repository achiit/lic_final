import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:internship2/Screens/Records/recorddata.dart';
import 'package:internship2/models/views/due_display.dart';
import 'package:internship2/widgets/custom_date_pickeer.dart';
import 'package:internship2/widgets/customized_date_picker2.dart';

import '../../Providers/scheme_selector.dart';

class Record_Page extends StatefulWidget {
  static const id = '/Record_Page';
  Record_Page(
    this.Location,
  );
  String Location;
  @override
  State<Record_Page> createState() => _Record_PageState(Location);
}

class _Record_PageState extends State<Record_Page> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController dateInput2 = TextEditingController();
  String dropdownvalue = 'Select City';
  var _selectedValue = DateTime.now();
  _Record_PageState(
    this.Location,
  );
  String Location;
  late String Member_Name;
  late String Plan;
  late String Account_No;
  late Timestamp date_open;
  late Timestamp date_mature;
  late String mode;
  late int installment;
  late String status;
  late int Amount_Collected;
  late int Amount_Remaining;
  late int Monthly;
  var _isloading = false;
  late final _firestone = FirebaseFirestore.instance;
  int _currentIndex = 1;
  int _currentIndex2 = 0;
  final _inactiveColor = Color(0xffEBEBEB);
  void addData(List<Widget> Memberlist, size) {
    Memberlist.add(
      due_data(
        size: size,
        Member_Name: Member_Name,
        Plan: Plan,
        Account_No: Account_No,
        date_mature: date_mature,
        date_open: date_open,
        mode: mode,
        installment: installment,
        status: status,
        Location: Location,
        Amount_Collected: Amount_Collected,
        Amount_Remaining: Amount_Remaining,
        Monthly: Monthly,
      ),
    );
  }

  // List of items in our dropdown menu
  var items = [
    'Select City',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      /* appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          elevation: 0,
          leading: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xff144743),
          ),
          backgroundColor: Colors.white,
          title: Row(
            children: [
              customized_date_picker(
                  title: "From Date", size: size, dateInput: dateInput),
              SizedBox(
                width: 4,
              ),
              customized_date_picker(
                  title: "To Date", size: size, dateInput: dateInput),
            ],
          ),
          actions: [
            IconButton(
                iconSize: 50,
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 30,
                ))
          ],
        ), */

      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  customized_date_picker1(
                      title: "From Date", size: size, dateInput: dateInput),
                  SizedBox(
                    width: 4,
                  ),
                  customized_date_picker2(
                      title: "To Date", size: size, dateInput2: dateInput2),
                ],
              ),
            ),
            Container(
              height: 100,
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Color(0xff29756F),
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedValue = date;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0XFFEBF0EF),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  border: Border.all(
                    width: 3,
                    color: Colors.grey,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        height: 35,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color(0XFFFEFEFE),
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DropdownButton(
                              // Initial Value
                              value: dropdownvalue,
                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),
                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (var newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
            ),
            SingleChildScrollView(
              child: StreamBuilder(
                  stream: _firestone
                      .collection('new_account')
                      .doc(Location)
                      .collection(Location)
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
                      mode = tile.get('mode');
                      status = tile.get('status');
                      installment = tile.get('installment');
                      Amount_Remaining = tile.get('Amount_Remaining');
                      Amount_Collected = tile.get('Amount_Collected');
                      Monthly = tile.get('monthly');
                      // str(Account_No);
                      if (_currentIndex == 1) {
                        if (Plan == 'A') addData(Memberlist, size);
                      } else if (_currentIndex == 2) {
                        if (Plan == 'B') addData(Memberlist, size);
                      } else {
                        addData(Memberlist, size);
                      }
                    }
                    return _isloading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : SingleChildScrollView(
                            child: SizedBox(
                              height: size.height * 0.61,
                              child: ListView.builder(
                                itemCount: Memberlist.length,
                                itemBuilder: (context, i) => Memberlist[i],
                              ),
                            ),
                          );
                  }),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff29756F),
              ),
              onPressed: () {},
              child: Text("View Collection Sheet"),
            )
          ],
        ),
      )),
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
