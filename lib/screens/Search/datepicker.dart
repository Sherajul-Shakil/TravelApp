import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatepickerPage extends StatefulWidget {
  const DatepickerPage({Key? key}) : super(key: key);

  @override
  _DatepickerPageState createState() => _DatepickerPageState();
}

class _DatepickerPageState extends State<DatepickerPage> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  String startdate = "";
  String enddate = "";
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SfDateRangePicker(
            navigationMode: DateRangePickerNavigationMode.scroll,
            navigationDirection: DateRangePickerNavigationDirection.horizontal,
            selectionMode: DateRangePickerSelectionMode.range,
            onCancel: () {
              Navigator.pop(context);
            },
            onSubmit: (p0) {
              Navigator.pop(context);
            },
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              setState(() {
                if (args.value is PickerDateRange) {
                  _range = DateFormat('MMM dd')
                          .format(args.value.startDate)
                          .toString() +
                      ' - ' +
                      DateFormat('MMM dd')
                          .format(args.value.endDate ?? args.value.startDate)
                          .toString();
                  startdate = DateFormat('yyyy-MM-dd')
                      .format(args.value.startDate)
                      .toString();

                  enddate = DateFormat('yyyy-MM-dd')
                      .format(args.value.endDate ?? args.value.startDate)
                      .toString();
                } else if (args.value is DateTime) {
                  _selectedDate = args.value.toString();
                } else if (args.value is List<DateTime>) {
                  _dateCount = args.value.length.toString();
                } else {
                  _rangeCount = args.value.length.toString();
                }
              });
              // searchprovider.datepicker(_range);
              // searchprovider.startenddatepicker(startdate, enddate);
            },
            showActionButtons: true,
          ),
        ],
      ),
    );
  }
}
