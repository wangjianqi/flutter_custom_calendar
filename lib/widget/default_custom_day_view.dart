import 'package:flutter/material.dart';
import 'package:flutter_custom_calendar/widget/base_day_view.dart';
import 'package:flutter_custom_calendar/model/date_model.dart';
import 'package:flutter_custom_calendar/style/style.dart';

/**
 * 这里定义成一个StatelessWidget，状态是外部的父控件传进来参数控制就行，自己不弄state类
 */

class DefaultCustomDayWidget extends BaseCustomDayWidget {
  DefaultCustomDayWidget(DateModel dateModel) : super(dateModel);

  @override
  void drawNormal(DateModel dateModel, Canvas canvas, Size size) {
    defaultDrawNormal(dateModel, canvas, size);
  }

  ///选中样式
  @override
  void drawSelected(DateModel dateModel, Canvas canvas, Size size) {
    defaultDrawSelected(dateModel, canvas, size);
  }
}

//class DefaultCustomDayWidget extends StatelessWidget {
//  DateModel dateModel;
//
//  DefaultCustomDayWidget(this.dateModel);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: new CustomPaint(
//        painter: CustomDayWidgetPainter(
//          dateModel,
//        ),
//      ),
//    );
//  }
//}
//
//class CustomDayWidgetPainter extends CustomPainter {
//  DateModel dateModel;
//
//  drawNormal normalDraw; //普通样式是必须的
//  drawSelected selectedDraw;
//
//  CustomDayWidgetPainter(this.dateModel,
//      {this.normalDraw = defaultDrawNormal,
//      this.selectedDraw = defaultDrawSelected});
//
//  Paint textPaint;
//
//  @override
//  void paint(Canvas canvas, Size size) {
////    print("paint:$size");
//    if (dateModel.isSelected) {
//      selectedDraw(dateModel, canvas, size);
//    } else {
//      normalDraw(dateModel, canvas, size);
//    }
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) {
//    return true;
//  }
//}

/**
 * 默认的样式
 */
const dotMaxY = 25;
void defaultDrawNormal(DateModel dateModel, Canvas canvas, Size size) {
  //顶部的文字
  TextPainter dayTextPainter = new TextPainter()
    ..text =
        TextSpan(text: dateModel.day.toString(), style: currentMonthTextStyle)
    ..textDirection = TextDirection.ltr
    ..textAlign = TextAlign.center;

  dayTextPainter.layout(minWidth: size.width, maxWidth: size.width);
  dayTextPainter.paint(canvas, Offset(0, 10));

  //下面的文字
  TextPainter lunarTextPainter = new TextPainter()
    ..text = new TextSpan(text: dateModel.lunarString, style: lunarTextStyle)
    ..textDirection = TextDirection.ltr
    ..textAlign = TextAlign.center;

  lunarTextPainter.layout(minWidth: size.width, maxWidth: size.width);
  lunarTextPainter.paint(canvas, Offset(0, size.height / 2));

  Paint paint = Paint()
    ..color = Color(0xffcccccc);
  ///半径
  canvas.drawCircle(Offset(size.width/2, size.height/2+dotMaxY), 3, paint);
  if (dateModel.extraData != null) {
    print("========${dateModel.extraData}");
//    if (dateModel.extraData as Map<DateTime,bool> ) {
//      final isShowDot = dateModel.extraData[DateTime.now()];
//      if (isShowDot != null && isShowDot == true) {
//        ///需要绘制小圆点
//      }
  } else {
    print("=======null");
  }
}

/**
 * 被选中的样式
 */
void defaultDrawSelected(DateModel dateModel, Canvas canvas, Size size) {
  //绘制背景
  Paint backGroundPaint = new Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;
  double padding = 8;
  canvas.drawRect(
      Rect.fromPoints(Offset(padding, padding),
          Offset(size.width - padding, size.height - padding)),
      backGroundPaint);

  //顶部的文字
  TextPainter dayTextPainter = new TextPainter()
    ..text =
        TextSpan(text: dateModel.day.toString(), style: currentMonthTextStyle)
    ..textDirection = TextDirection.ltr
    ..textAlign = TextAlign.center;

  dayTextPainter.layout(minWidth: size.width, maxWidth: size.width);
  dayTextPainter.paint(canvas, Offset(0, 10));

  //下面的文字
  TextPainter lunarTextPainter = new TextPainter()
    ..text = new TextSpan(text: dateModel.lunarString, style: lunarTextStyle)
    ..textDirection = TextDirection.ltr
    ..textAlign = TextAlign.center;
  ///文字布局
  lunarTextPainter.layout(minWidth: size.width, maxWidth: size.width);
  lunarTextPainter.paint(canvas, Offset(0, size.height / 2));

  ///需要绘制小圆点
  Paint paint = Paint()
    ..color = Color(0xffcccccc);
  ///半径
  canvas.drawCircle(Offset(size.width/2, size.height/2+dotMaxY), 3, paint);
}
