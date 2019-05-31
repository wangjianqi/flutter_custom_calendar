import 'package:flutter/material.dart';
class Constants {

  //单选或者多选模式
  static const int MODE_SINGLE_SELECT = 1;
  static const int MODE_MULTI_SELECT = 2;

  /**
   * 一周七天
   */
  static const List<String> WEEK_LIST = [
    "周一",
    "周二",
    "周三",
    "周四",
    "周五",
    "周六",
    "周日"
  ];

  static List<WeekStyle> weekStyle = [
    WeekStyle(weekdays: "日",textStyle: TextStyle(color: Color(0xff999999),fontSize: 12)),
    WeekStyle(weekdays: "一",textStyle: TextStyle(color: Color(0xff333333),fontSize: 12)),
    WeekStyle(weekdays: "二",textStyle: TextStyle(color: Color(0xff333333),fontSize: 12)),
    WeekStyle(weekdays: "三",textStyle: TextStyle(color: Color(0xff333333),fontSize: 12)),
    WeekStyle(weekdays: "四",textStyle: TextStyle(color: Color(0xff333333),fontSize: 12)),
    WeekStyle(weekdays: "五",textStyle: TextStyle(color: Color(0xff333333),fontSize: 12)),
    WeekStyle(weekdays: "六",textStyle: TextStyle(color: Color(0xff999999),fontSize: 12)),
  ];


  /**
   * 农历的月份
   */
  static const List<String> LUNAR_MONTH_TEXT = [
    "春节",
    "二月",
    "三月",
    "四月",
    "五月",
    "六月",
    "七月",
    "八月",
    "九月",
    "十月",
    "冬月",
    "腊月",
  ];

  /**
   *   农历的日期
   */
  static const List<String> LUNAR_DAY_TEXT = [
    "初一",
    "初二",
    "初三",
    "初四",
    "初五",
    "初六",
    "初七",
    "初八",
    "初九",
    "初十",
    "十一",
    "十二",
    "十三",
    "十四",
    "十五",
    "十六",
    "十七",
    "十八",
    "十九",
    "二十",
    "廿一",
    "廿二",
    "廿三",
    "廿四",
    "廿五",
    "廿六",
    "廿七",
    "廿八",
    "廿九",
    "三十"
  ];
}

class WeekStyle {
  final String weekdays;
  final TextStyle textStyle;

  WeekStyle({this.weekdays, this.textStyle});

}
