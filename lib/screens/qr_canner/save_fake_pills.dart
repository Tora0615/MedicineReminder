import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:medicine/database/repository.dart';
import 'package:medicine/helpers/snack_bar.dart';
import 'package:medicine/models/medicine_type.dart';
import 'package:medicine/models/pill.dart';
import 'package:medicine/notifications/notifications.dart';
import '../../helpers/platform_flat_button.dart';
import '../../screens/add_new_medicine/form_fields.dart';
import '../../screens/add_new_medicine/medicine_type_card.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class FakeAdder{

  final Snackbar snackbar = Snackbar();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int howManyWeeks = 1;
  String selectWeight;
  DateTime setDate = DateTime.now();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  String name;    // 藥物名稱
  String amount;  // 使用量
  String unit;    // 單位 (顆、毫升、微克)
  int weeks;      // 持續多久
  String type;    // 種類 (糖漿、藥片、膠囊)
  FakeAdder(this.name,this.amount,this.unit,this.weeks,this.type);


  //medicine types
  final List<String> weightValues = ["顆", "毫升", "微克"];

  //list of medicines forms objects
  final List<MedicineType> medicineTypes = [
    MedicineType("糖漿", Image.asset("assets/images/syrup.png"), true),
    MedicineType("藥片", Image.asset("assets/images/pills.png"), false),
    MedicineType("膠囊", Image.asset("assets/images/capsule.png"), false),
    MedicineType("乳膏", Image.asset("assets/images/cream.png"), false),
    MedicineType("Drops", Image.asset("assets/images/drops.png"), false),
    MedicineType("Syringe", Image.asset("assets/images/syringe.png"), false),
  ];

  //-------------- Database and notifications ------------------
  final Repository _repository = Repository();
  final Notifications _notifications = Notifications();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future savePill() async {
    //check if medicine time is lower than actual time
    if (setDate.add(Duration(hours: 1)).millisecondsSinceEpoch <=
        DateTime.now().millisecondsSinceEpoch) {
      // snackbar.showSnack(
      //     "請確認提醒時間是否沒有小於現在時間", _scaffoldKey, null);
    } else {
      //create pill object
      setDate = setDate.add(Duration(hours: 4));
      Pill pill = Pill(
          amount: amount,
          howManyWeeks: weeks,
          medicineForm: type,
          name: name,
          time: setDate.millisecondsSinceEpoch,
          type: unit,
          notifyId: Random().nextInt(10000000));

      //---------------------| Save as many medicines as many user checks |----------------------
      for (int i = 0; i < howManyWeeks; i++) {
        dynamic result =
        await _repository.insertData("Pills", pill.pillToMap());
        if (result == null) {
          snackbar.showSnack("Something went wrong", _scaffoldKey, null);
          return;
        } else {
          //set the notification schneudele
          tz.initializeTimeZones();
          tz.setLocalLocation(tz.getLocation('Europe/Warsaw'));
          await _notifications.showNotification(
              pill.name,
              pill.amount + " " + pill.medicineForm + " " + pill.type,
              time,
              pill.notifyId,
              flutterLocalNotificationsPlugin);
          print(time);
          setDate = setDate.add(Duration(milliseconds: 604800000));
          pill.time = setDate.millisecondsSinceEpoch;
          pill.notifyId = Random().nextInt(10000000);
        }
      }
      //---------------------------------------------------------------------------------------
      //snackbar.showSnack("Saved", _scaffoldKey, null);
      // Navigator.pop(context);
      print('Saved');
    }
  }

  //get time difference
  int get time =>
      setDate.millisecondsSinceEpoch -
          tz.TZDateTime.now(tz.local).millisecondsSinceEpoch;
}