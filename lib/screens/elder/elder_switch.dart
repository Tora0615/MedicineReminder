import 'package:flutter/material.dart';
import 'elder_page.dart';
import 'package:medicine/screens/home/home.dart';

class ElderSwitch extends StatelessWidget {
  const ElderSwitch({Key key}) : super(key: key);

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
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
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
                height: 250,
                child: Center(
                  child: Text(
                    "一般模式",
                    style: TextStyle(
                      fontSize: 48,
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
                height: 250,
                child: Center(
                  child: Text(
                    "長者模式",
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
    );
  }
}
