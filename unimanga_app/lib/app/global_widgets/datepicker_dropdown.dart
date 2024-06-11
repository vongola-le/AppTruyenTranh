// ignore_for_file: non_constant_identifier_names

library datepicker_dropdown;

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// Defines widgets which are to used as DropDown Date Picker.
// ignore: must_be_immutable
class DropdownDatePicker extends StatefulWidget {
  ///DropDown select text style
  final TextStyle? textStyle;

  ///DropDown container box decoration
  final BoxDecoration? boxDecoration;

  ///InputDecoration for DropDown
  final InputDecoration? inputDecoration;

  ///DropDown expand icon
  final Icon? icon;

  ///Start year for date picker
  ///Default is 1900
  final int? startYear;

  ///End year for date picker
  ///Default is Current year
  final int? endYear;

  ///width between each drop down
  ///Default is 12.0
  final double width;

  ///Return selected date
  ValueChanged<String?>? onChangedDay;

  ///Return selected month
  ValueChanged<String?>? onChangedMonth;

  ///Return selected year
  ValueChanged<String?>? onChangedYear;

  ///Error message for Date
  String errorDay;

  ///Error message for Month
  String errorMonth;

  ///Error message for Year
  String errorYear;

  ///Hint for Month drop down
  ///Default is "Month"
  String hintMonth;

  ///Hint for Year drop down
  ///Default is "Year"
  String hintYear;

  ///Hint for Day drop down
  ///Default is "Day"
  String hintDay;

  ///Hint Textstyle for drop down
  TextStyle? hintTextStyle;

  ///Is Form validator enabled
  ///Default is false
  final bool isFormValidator;

  ///Is Expanded for dropdown
  ///Default is true
  final bool isExpanded;

  ///Selected Day between 1 to 31
  final int? selectedDay;

  ///Selected Month between 1 to 12
  final int? selectedMonth;

  ///Selected Year between startYear and endYear
  final int? selectedYear;

  ///Default [isDropdownHideUnderline] = false. Wrap with DropdownHideUnderline for the dropdown to hide the underline.
  final bool isDropdownHideUnderline;

  /// locale
  ///
  /// default `en`
  ///
  /// support `zh_CN`
  ///
  /// support `it_IT`
  final String locale;

  /// default true
  bool showYear;
  bool showMonth;
  bool showDay;

  /// month expanded flex
  int monthFlex;

  /// day expanded flex
  int dayFlex;

  /// year expanded flex
  int yearFlex;

  DropdownDatePicker(
      {Key? key,
      this.textStyle,
      this.boxDecoration,
      this.inputDecoration,
      this.icon,
      this.startYear,
      this.endYear,
      this.width = 12.0,
      this.onChangedDay,
      this.onChangedMonth,
      this.onChangedYear,
      this.isDropdownHideUnderline = false,
      this.errorDay = 'Please select day',
      this.errorMonth = 'Please select month',
      this.errorYear = 'Please select year',
      this.hintMonth = 'Month',
      this.hintDay = 'Day',
      this.hintYear = 'Year',
      this.hintTextStyle,
      this.isFormValidator = false,
      this.isExpanded = true,
      this.selectedDay,
      this.selectedMonth,
      this.selectedYear,
      this.locale = 'en',
      this.showDay = true,
      this.showMonth = true,
      this.showYear = true,
      this.monthFlex = 2,
      this.dayFlex = 1,
      this.yearFlex = 2})
      : assert(["en", "zh_CN", "it_IT"].contains(locale)),
        super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DropdownDatePickerState createState() => _DropdownDatePickerState();
}

class _DropdownDatePickerState extends State<DropdownDatePicker> {
  var monthselVal = '';
  var dayselVal = '';
  var yearselVal = '';
  int daysIn = 32;
  late List listdates = [];
  late List listyears = [];
  late List<dynamic> listMonths = [];

  @override
  void initState() {
    super.initState();
    dayselVal = widget.selectedDay != null ? widget.selectedDay.toString() : '';
    monthselVal =
        widget.selectedMonth != null ? widget.selectedMonth.toString() : '';
    yearselVal =
        widget.selectedYear != null ? widget.selectedYear.toString() : '';
    listdates = Iterable<int>.generate(daysIn).skip(1).toList();
    listyears =
        Iterable<int>.generate((widget.endYear ?? DateTime.now().year) + 1)
            .skip(widget.startYear ?? 1900)
            .toList()
            .reversed
            .toList();

    if (widget.locale == "zh_CN") {
      listMonths = listMonths_zh_CN;
    } else if (widget.locale == "it_IT") {
      listMonths = listMonths_it_IT;
    } else {
      listMonths = listMonths_en;
    }
  }

  ///Month selection dropdown function
  monthSelected(value) {
    widget.onChangedMonth!(value);
    monthselVal = value;
    int days = daysInMonth(
        yearselVal == '' ? DateTime.now().year : int.parse(yearselVal),
        int.parse(value));
    listdates = Iterable<int>.generate(days + 1).skip(1).toList();
    checkDates(days);
    update();
  }

  ///check dates for selected month and year
  void checkDates(days) {
    if (dayselVal != '') {
      if (int.parse(dayselVal) > days) {
        dayselVal = '';
        widget.onChangedDay!('');
        update();
      }
    }
  }

  ///find days in month and year
  int daysInMonth(year, month) => DateTimeRange(
          start: DateTime(year, month, 1), end: DateTime(year, month + 1))
      .duration
      .inDays;

  ///day selection dropdown function
  daysSelected(value) {
    widget.onChangedDay!(value);
    dayselVal = value;
    update();
  }

  ///year selection dropdown function
  yearsSelected(value) {
    widget.onChangedYear!(value);
    yearselVal = value;
    if (monthselVal != '') {
      int days = daysInMonth(
          yearselVal == '' ? DateTime.now().year : int.parse(yearselVal),
          int.parse(monthselVal));
      listdates = Iterable<int>.generate(days + 1).skip(1).toList();
      checkDates(days);
      update();
    }
    update();
  }

  ///list of months , en
  List<dynamic> listMonths_en = [
    {"id": 1, "value": "1"},
    {"id": 2, "value": "2"},
    {"id": 3, "value": "3"},
    {"id": 4, "value": "4"},
    {"id": 5, "value": "5"},
    {"id": 6, "value": "6"},
    {"id": 7, "value": "7"},
    {"id": 8, "value": "8"},
    {"id": 9, "value": "9"},
    {"id": 10, "value": "10"},
    {"id": 11, "value": "11"},
    {"id": 12, "value": "12"}
  ];

  ///list of months , zh_CN
  List<dynamic> listMonths_zh_CN = [
    {"id": 1, "value": "1月"},
    {"id": 2, "value": "2月"},
    {"id": 3, "value": "3月"},
    {"id": 4, "value": "4月"},
    {"id": 5, "value": "5月"},
    {"id": 6, "value": "6月"},
    {"id": 7, "value": "7月"},
    {"id": 8, "value": "8月"},
    {"id": 9, "value": "9月"},
    {"id": 10, "value": "10月"},
    {"id": 11, "value": "11月"},
    {"id": 12, "value": "12月"}
  ];

  ///list of months , it_IT
  List<dynamic> listMonths_it_IT = [
    {"id": 1, "value": "Gennaio"},
    {"id": 2, "value": "Febbraio"},
    {"id": 3, "value": "Marzo"},
    {"id": 4, "value": "Aprile"},
    {"id": 5, "value": "Maggio"},
    {"id": 6, "value": "Giugno"},
    {"id": 7, "value": "Luglio"},
    {"id": 8, "value": "Agosto"},
    {"id": 9, "value": "Settembre"},
    {"id": 10, "value": "Ottobre"},
    {"id": 11, "value": "Novembre"},
    {"id": 12, "value": "Dicembre"}
  ];

  ///update function
  update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.showDay)
          Expanded(
            flex: widget.dayFlex,
            child: Container(
              decoration: widget.boxDecoration ?? const BoxDecoration(),
              child: SizedBox(
                  // height: 49,
                  child: ButtonTheme(
                alignedDropdown: true,
                child: widget.isDropdownHideUnderline
                    ? DropdownButtonHideUnderline(
                        child: dayDropdown(),
                      )
                    : dayDropdown(),
              )),
            ),
          ),
        if (widget.showDay) w(widget.width),
        if (widget.showMonth)
          Expanded(
            flex: widget.monthFlex,
            child: Container(
              decoration: widget.boxDecoration ?? const BoxDecoration(),
              child: SizedBox(
                // height: 49,
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: widget.isDropdownHideUnderline
                      ? DropdownButtonHideUnderline(
                          child: monthDropdown(),
                        )
                      : monthDropdown(),
                ),
              ),
            ),
          ),
        if (widget.showMonth) w(widget.width),
        if (widget.showYear)
          Expanded(
            flex: widget.yearFlex,
            child: Container(
              decoration: widget.boxDecoration ?? const BoxDecoration(),
              child: SizedBox(
                // height: 49,
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: widget.isDropdownHideUnderline
                      ? DropdownButtonHideUnderline(
                          child: yearDropdown(),
                        )
                      : yearDropdown(),
                ),
              ),
            ),
          ),
      ],
    );
  }

  ///month dropdown
  Container monthDropdown() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.lightBlack,
          width: 0.5,
        ),
        color: AppColors.gray,
      ),
      child: DropdownButton<String>(
          isExpanded: widget.isExpanded,
          hint: Center(
              child: Text(widget.hintMonth,
                  style: widget.hintTextStyle, maxLines: 1)),
          icon:
              widget.icon ?? const Icon(Icons.expand_more, color: Colors.grey),
          value: monthselVal == '' ? null : monthselVal,
          onChanged: (value) {
            monthSelected(value);
          },
          items: listMonths.map((item) {
            return DropdownMenuItem<String>(
              value: item["id"].toString(),
              child: Center(
                child: Text(
                  item["value"].toString(),
                  style: widget.textStyle ??
                      const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                ),
              ),
            );
          }).toList()),
    );
  }

  ///Remove underline from dropdown
  InputDecoration removeUnderline() {
    return const InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
  }

  ///year dropdown
  Container yearDropdown() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.lightBlack,
          width: 0.5,
        ),
        color: AppColors.gray,
      ),
      child: DropdownButton<String>(
          hint: Center(
              child: Text(widget.hintYear,
                  style: widget.hintTextStyle, maxLines: 1)),
          isExpanded: widget.isExpanded,
          alignment: Alignment.center,
          icon:
              widget.icon ?? const Icon(Icons.expand_more, color: Colors.grey),
          value: yearselVal == '' ? null : yearselVal,
          onChanged: (value) {
            yearsSelected(value);
          },
          items: listyears.map((item) {
            return DropdownMenuItem<String>(
              value: item.toString(),
              child: Center(
                child: Text(
                  item.toString(),
                  style: widget.textStyle ??
                      const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                ),
              ),
            );
          }).toList()),
    );
  }

  ///day dropdown
  Container dayDropdown() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.lightBlack,
          width: 0.5,
        ),
        color: AppColors.gray,
      ),
      child: DropdownButton<String>(
          hint: Center(
              child: Text(widget.hintDay,
                  style: widget.hintTextStyle, maxLines: 1)),
          isExpanded: widget.isExpanded,
          icon:
              widget.icon ?? const Icon(Icons.expand_more, color: Colors.grey),
          value: dayselVal == '' ? null : dayselVal,
          onChanged: (value) {
            daysSelected(value);
          },
          items: listdates.map((item) {
            return DropdownMenuItem<String>(
              value: item.toString(),
              child: Center(
                child: Text(item.toString(),
                    style: widget.textStyle ??
                        const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
              ),
            );
          }).toList()),
    );
  }

  ///sizedbox for width
  Widget w(double count) => SizedBox(
        width: count,
      );
}
