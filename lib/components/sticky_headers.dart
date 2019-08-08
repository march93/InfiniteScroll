import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class StickyHeader extends StatelessWidget {
  StickyHeader({
    @required this.startDateString,
    this.backgroundColor,
    this.headerStyle,
    this.height,
  });

  final String startDateString;
  final Color backgroundColor;
  final TextStyle headerStyle;
  final double height;

  Widget build(BuildContext context) {
    final String todayString = toDateOnlyString(DateTime.now());
    final String titleText = todayString == startDateString ? 'Today' : startDateString;

    return Container(
      color: backgroundColor,
      height: height,
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text(titleText ?? '', style: headerStyle),
        ),
      ),
    );
  }

  String toDateOnlyString(DateTime date) {
    if (date == null) return null;
    return formatDate(date, [D, ', ', MM, ' ', dd]);
  }
}