import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class customized_date_picker2 extends StatefulWidget {
  String title;

  customized_date_picker2(
      {super.key,
      required this.title,
      required this.size,
      required this.dateInput2,
      required this.dateTime});

  final Size size;
  final TextEditingController dateInput2;
  DateTime dateTime;

  @override
  State<customized_date_picker2> createState() =>
      _customized_date_picker2State();
}

class _customized_date_picker2State extends State<customized_date_picker2> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width / 2.4,
      height: widget.size.height * 0.067,
      /* decoration: BoxDecoration(
          color: Color(0XFFEBEBEB),
          borderRadius: BorderRadius.circular(18)), */
      child: Center(
        child: TextField(
          controller: widget.dateInput2,
          //editing controller of this TextField
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.calendar_today,
                size: 20,
              ),
              labelText: widget.title,
              labelStyle: const TextStyle(fontSize: 13),
              hintText: "Hello",
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 3, color: Colors.grey), //<-- SEE HERE
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
                  widget.dateInput2.text =
                      formattedDate2; //set output date to TextField value.
                  widget.dateTime = pickedDate2;
                },
              );
            } else {}
          },
        ),
      ),
    );
  }
}
