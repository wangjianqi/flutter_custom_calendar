import 'package:flutter/material.dart';
import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';

class DefaultStylePage extends StatefulWidget {
  DefaultStylePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DefaultStylePageState createState() => _DefaultStylePageState();
}

class _DefaultStylePageState extends State<DefaultStylePage> {
  String text;

  CalendarController controller;

  @override
  void initState() {
    super.initState();
    text = "${DateTime.now().year}年${DateTime.now().month}月";

    controller = new CalendarController();
    controller.extraDataMap = {DateTime.now():true};

    ///监听当前日期
    controller.addMonthChangeListener(
      (year, month) {
        setState(() {
          text = "$year年$month月";
        });
      },
    );

    ///时间变化监听
    controller.addOnCalendarSelectListener((dateModel) {
      //刷新选择的时间
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                    icon: Icon(Icons.navigate_before),
                    onPressed: () {
                      ///上个月
                      controller.moveToPreviousMonth();
                    }),
                new Text(text),
                new IconButton(
                    icon: Icon(Icons.navigate_next),
                    onPressed: () {
                      ///下一个月
                      controller.moveToNextMonth();
                    }),
              ],
            ),
            CalendarViewWidget(
              calendarController: controller,
            ),
            new Text(
              ///选中的日期
                "单选模式\n选中的时间:\n${controller.getSingleSelectCalendar().toString()}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
