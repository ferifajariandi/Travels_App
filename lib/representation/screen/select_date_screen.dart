import 'package:flutter/material.dart';
import 'package:travels_app/core/constants/color_constract.dart';
import 'package:travels_app/core/constants/dissmension_constract.dart';
import 'package:travels_app/representation/widgets/app_bar_container.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travels_app/representation/widgets/button_widget.dart';

class SelectDateScreen extends StatelessWidget {
  static const String routeName = './select_date_screen';

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Select date',
      implementLeading: true,
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding * 1.5,
          ),
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings:
                DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            selectionColor: ColorPalette.yellowColor,
            endRangeSelectionColor: ColorPalette.yellowColor,
            rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
            todayHighlightColor: ColorPalette.yellowColor,
            toggleDaySelection: true,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                rangeStartDate = args.value.startDate;
                rangeEndDate = args.value.endDate;
              } else {
                rangeStartDate == null;
                rangeEndDate == null;
              }
            },
          ),
          ButtonWidget(
            title: 'Select',
            onTap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: 'Cancel',
            onTap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
          ),
        ],
      ),
    );
  }
}
