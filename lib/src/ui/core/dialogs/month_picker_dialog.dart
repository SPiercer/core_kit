//TODO: Use date picker theme instead of creating a custom widget.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<DateTime?> showMonthPicker({
  required BuildContext context,
  required DateTime initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  return await showDialog<DateTime>(
      context: context,
      builder: (context) => _MonthPickerDialog(
            initialDate: initialDate,
            firstDate: firstDate,
            lastDate: lastDate,
          ));
}

class _MonthPickerDialog extends StatefulWidget {
  final DateTime? initialDate, firstDate, lastDate;

  const _MonthPickerDialog({
    Key? key,
    required this.initialDate,
    this.firstDate,
    this.lastDate,
  }) : super(key: key);

  @override
  _MonthPickerDialogState createState() => _MonthPickerDialogState();
}

class _MonthPickerDialogState extends State<_MonthPickerDialog> {
  PageController? pageController;
  DateTime? selectedDate;
  late int displayedPage;
  bool isYearSelection = false;
  DateTime? _firstDate, _lastDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime(widget.initialDate!.year, widget.initialDate!.month);
    if (widget.firstDate != null) {
      _firstDate = DateTime(widget.firstDate!.year, widget.firstDate!.month);
    }
    if (widget.lastDate != null) {
      _lastDate = DateTime(widget.lastDate!.year, widget.lastDate!.month);
    }
    displayedPage = selectedDate!.year;
    pageController = PageController(initialPage: displayedPage);
  }

  String _locale(BuildContext context) {
    var locale = Localizations.localeOf(context);
    if (locale == null) {
      return Intl.systemLocale;
    }
    return '${locale.languageCode}_${locale.countryCode}';
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var localizations = MaterialLocalizations.of(context);
    var locale = _locale(context);
    var header = buildHeader(theme, locale);
    var pager = buildPager(theme, locale);
    var content = Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [pager, buildButtonBar(context, localizations)],
      ),
      color: theme.dialogBackgroundColor,
    );
    return Theme(
      data: Theme.of(context).copyWith(
        dialogBackgroundColor: Colors.white,
      ),
      child: Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(
              builder: (context) {
                if (MediaQuery.of(context).orientation == Orientation.portrait) {
                  return IntrinsicWidth(
                    child: Column(children: [header, content]),
                  );
                }
                return IntrinsicHeight(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [header, content],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildButtonBar(
    BuildContext context,
    MaterialLocalizations localizations,
  ) {
    return ButtonTheme(
      child: ButtonBar(
        children: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, null),
            child: Text(localizations.cancelButtonLabel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, selectedDate),
            child: Text(localizations.okButtonLabel),
          ),
        ],
      ),
    );
  }

  Widget buildHeader(ThemeData theme, String locale) {
    return Material(
      color: theme.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              DateFormat.yMMM(locale).format(selectedDate!),
              style: theme.primaryTextTheme.subtitle1!.copyWith(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (!isYearSelection)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isYearSelection = true;
                      });
                      // pageController.jumpToPage(displayedPage ~/ 12);
                    },
                    child: Text(
                      DateFormat.y(locale).format(DateTime(displayedPage)),
                      style: theme.primaryTextTheme.headline6!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                if (isYearSelection)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        DateFormat.y(locale).format(DateTime(displayedPage * 12)),
                        style: theme.primaryTextTheme.headline6!.copyWith(color: Colors.white),
                      ),
                      Text(
                        '-',
                        style: theme.primaryTextTheme.headline6!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        DateFormat.y(locale).format(DateTime(displayedPage * 12 + 11)),
                        style: theme.primaryTextTheme.headline6!.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                      ),
                      onPressed: () => pageController!.animateToPage(
                        displayedPage - 1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      onPressed: () => pageController!.animateToPage(displayedPage + 1,
                          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPager(ThemeData theme, String locale) {
    return SizedBox(
      height: 220.0,
      width: 300.0,
      child: Theme(
        data: theme.copyWith(
          buttonTheme: const ButtonThemeData(
            padding: EdgeInsets.all(2.0),
            shape: CircleBorder(),
            minWidth: 4.0,
          ),
        ),
        child: PageView.builder(
          controller: pageController,
          scrollDirection: Axis.vertical,
          onPageChanged: (index) {
            setState(() {
              displayedPage = index;
            });
          },
          itemBuilder: (context, page) {
            return GridView.count(
              padding: const EdgeInsets.all(8.0),
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: isYearSelection
                  ? List<int>.generate(12, (i) => page * 12 + i)
                      .map(
                        (year) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: _getYearButton(year, theme, locale),
                        ),
                      )
                      .toList()
                  : List<int>.generate(12, (i) => i + 1)
                      .map((month) => DateTime(page, month))
                      .map(
                        (date) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: _getMonthButton(date, theme, locale),
                        ),
                      )
                      .toList(),
            );
          },
        ),
      ),
    );
  }

  Widget _getMonthButton(final DateTime date, final ThemeData theme, final String locale) {
    VoidCallback? callback;
    if (_firstDate == null && _lastDate == null) {
      callback = () => setState(() => selectedDate = DateTime(date.year, date.month));
    } else if (_firstDate != null &&
        _lastDate != null &&
        _firstDate!.compareTo(date) <= 0 &&
        _lastDate!.compareTo(date) >= 0) {
      callback = () => setState(() => selectedDate = DateTime(date.year, date.month));
    } else if (_firstDate != null && _lastDate == null && _firstDate!.compareTo(date) <= 0) {
      callback = () => setState(() => selectedDate = DateTime(date.year, date.month));
    } else if (_firstDate == null && _lastDate != null && _lastDate!.compareTo(date) >= 0) {
      callback = () => setState(() => selectedDate = DateTime(date.year, date.month));
    } else {
      callback = null;
    }
    return TextButton(
      onPressed: callback,
      style: TextButton.styleFrom(
        backgroundColor: date.month == selectedDate!.month && date.year == selectedDate!.year
            ? theme.primaryColor
            : null,
        textStyle: TextStyle(
          color: date.month == selectedDate!.month && date.year == selectedDate!.year
              ? theme.canvasColor
              : date.month == DateTime.now().month && date.year == DateTime.now().year
                  ? theme.primaryColor
                  : null,
        ),
      ),
      child: Text(
        DateFormat.MMM(locale).format(date),
      ),
    );
  }

  Widget _getYearButton(int year, ThemeData theme, String locale) {
    return TextButton(
      onPressed: () {
        pageController!.jumpToPage(year);
        setState(() {
          isYearSelection = false;
        });
      },
      style: TextButton.styleFrom(
        backgroundColor: year == selectedDate!.year ? theme.primaryColor : null,
        textStyle: TextStyle(
          color: year == selectedDate!.year
              ? theme.canvasColor
              : year == DateTime.now().year
                  ? theme.primaryColor
                  : null,
        ),
      ),
      child: Text(
        DateFormat.y(locale).format(DateTime(year)),
      ),
    );
  }
}
