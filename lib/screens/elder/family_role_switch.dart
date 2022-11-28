import 'package:flutter/material.dart';
import 'package:medicine/screens/bodyinfomonitor/body_info_monitor_page.dart';
import 'elder_page.dart';
import 'package:medicine/screens/home/home.dart';

class FamilyRoleSwitch extends StatelessWidget {
  const FamilyRoleSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("模式選擇"),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(32.0),
                ),
                //color: Colors.grey[300],
              ),
              width: 300,
              height: 125,
              child: Center(
                child: Text(
                  "家庭模式中分為 : \n"
                  "1. 給照顧者了解長輩身體狀況與是否有吃藥的頁面\n"
                  "2. 給長輩使用的極簡易模式",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BodyInfo()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  color: Colors.grey[300],
                ),
                width: 250,
                height: 125,
                child: Center(
                  child: Text(
                    "監護者模式\n(健康與吃藥現況)",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ElderPage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  color: Colors.amber[300],
                ),
                width: 250,
                height: 125,
                child: Center(
                  child: Text(
                    "長者模式\n(簡易模式)",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
