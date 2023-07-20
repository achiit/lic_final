import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:internship2/models/views/due_display.dart';
import 'package:internship2/widgets/customnavbar.dart';
import 'package:intl/intl.dart';

import '../../Providers/scheme_selector.dart';

class Record_Page extends StatefulWidget {
  static const id = '/Record_Page';
  Record_Page(this.Location, {super.key});
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
  final _isloading = false;
  late final _firestone = FirebaseFirestore.instance;
  int _currentIndex = 1;
  final int _currentIndex2 = 0;
  final _inactiveColor = const Color(0xffEBEBEB);
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

  DateTime dateTime1 = DateTime(1900);
  DateTime dateTime2 = DateTime(1900);

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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CustomNavBar()),
            );
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  Expanded(
                    child: SizedBox(
                      width: size.width / 2.4,
                      height: size.height * 0.067,
                      /* decoration: BoxDecoration(
          color: Color(0XFFEBEBEB),
          borderRadius: BorderRadius.circular(18)), */
                      child: Center(
                        child: TextField(
                          controller: dateInput,
                          //editing controller of this TextField
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.calendar_today,
                                size: 20,
                              ),
                              labelText: "From Date",
                              labelStyle: const TextStyle(fontSize: 13),
                              hintText: dateInput.text,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3,
                                    color: Colors.grey), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(50.0),
                              )),
                          readOnly: true,
                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));
                            print(pickedDate);
                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);

                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              setState(
                                () {
                                  dateInput.text =
                                      formattedDate; //set output date to TextField value.
                                  dateTime1 = pickedDate;
                                },
                              );
                            } else {}
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: size.width / 2.4,
                      height: size.height * 0.067,
                      /* decoration: BoxDecoration(
          color: Color(0XFFEBEBEB),
          borderRadius: BorderRadius.circular(18)), */
                      child: Center(
                        child: TextField(
                          controller: dateInput2,
                          //editing controller of this TextField
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.calendar_today,
                                size: 20,
                              ),
                              labelText: "To Date",
                              labelStyle: const TextStyle(fontSize: 13),
                              hintText: "Hello",
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3,
                                    color: Colors.grey), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(50.0),
                              )),
                          readOnly: true,
                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate2 = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));
                            print(pickedDate2);
                            if (pickedDate2 != null) {
                              print(
                                  pickedDate2); //pickedDate2 output format => 2021-03-10 00:00:00.000
                              String formattedDate2 =
                                  DateFormat('yyyy-MM-dd').format(pickedDate2);
                              print(
                                  formattedDate2); //formatted date output using intl package =>  2021-03-16
                              setState(
                                () {
                                  dateInput2.text =
                                      formattedDate2; //set output date to TextField value.
                                  dateTime2 = pickedDate2;
                                },
                              );
                            } else {}
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: const Color(0xff29756F),
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
                  color: const Color(0XFFEBF0EF),
                  borderRadius: const BorderRadius.all(
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
                        decoration: const BoxDecoration(
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
                  borderRadius: const BorderRadius.all(
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
                      return const Center(
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
                      DateTime openingDate =
                          DateTime.fromMicrosecondsSinceEpoch(
                              date_open.microsecondsSinceEpoch);

                      // from date != "" && to date != "", then
                      //if from date and to date is not empty, then
                      //check if openingDate >= from date && openingDate <= to date, then
                      //selectedDate >= from date && selectedDate <= to date, then
                      //add data

                      if (_currentIndex == 1) {
                        if (Plan == 'A') {
                          dateFilter(openingDate, Memberlist, size);
                        }
                      } else if (_currentIndex == 2) {
                        if (Plan == 'B') {
                          dateFilter(openingDate, Memberlist, size);
                        }
                      } else {
                        dateFilter(openingDate, Memberlist, size);
                      }
                    }
                    return _isloading
                        ? const Center(
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
                backgroundColor: const Color(0xff29756F),
              ),
              onPressed: () {},
              child: const Text("View Collection Sheet"),
            )
          ],
        ),
      )),
    );
  }

  dateFilter(DateTime openingDate, List<Widget> Memberlist, Size size) {
    if (dateInput.text != "" && dateInput2.text != "") {
      if (dateTime1.isBefore(openingDate) && dateTime2.isAfter(openingDate)) {
        addData(Memberlist, size);
      }
    } else {
      if (dateInput.text != "") {
        //
        if (dateTime1.isBefore(openingDate)) {
          // in range, then add data
          addData(Memberlist, size);
        } else {
          Memberlist.clear();
        }
      } else {
        if (dateInput2.text != "") {
          if (dateTime2.isAfter(openingDate)) {
            // in range, then add data
            addData(Memberlist, size);
          } else {
            Memberlist.clear();
          }
        } else {
          addData(Memberlist, size);
        }
      }
    }
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
