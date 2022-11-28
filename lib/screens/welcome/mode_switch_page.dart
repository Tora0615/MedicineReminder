import 'package:flutter/material.dart';
import 'package:medicine/screens/elder/family_role_switch.dart';
import 'package:medicine/screens/welcome/welcome.dart';

class ModeSwitch extends StatelessWidget {
  const ModeSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime _lastPressedAt; //上次点击时间

    // capture return action (https://book.flutterchina.club/chapter7/willpopscope.html)
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 2)) {
          //两次点击间隔超过1秒则重新计时

          // warning msg
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("再按一次返回建退出APP"),
          ));

          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: Scaffold(
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
                    "此 APP 可依照訂閱程度有不同功能。\n以下為展示不同模式下的功能與頁面",
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
                    // MaterialPageRoute(builder: (context) => Home()),
                    MaterialPageRoute(builder: (context) => Welcome()),
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
                      "個人使用模式",
                      style: TextStyle(
                        fontSize: 36,
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
                    MaterialPageRoute(builder: (context) => FamilyRoleSwitch()),
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
                      "家庭模式",
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
