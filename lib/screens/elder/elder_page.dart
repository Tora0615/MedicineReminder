import 'package:flutter/material.dart';
import 'elder_page_finish.dart';
import 'elder_page_later.dart';
class ElderPage extends StatelessWidget {
  const ElderPage({Key key}) : super(key: key);

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.access_time,
                  size: 58,
                ),
                Text(
                  "  吃藥時間到了",
                  style: TextStyle(
                    fontSize: 42,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(32.0),
                ),
                color: Colors.amber[200],
              ),
              width: 320,
              height: 240,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "藥品清單",
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "高血壓藥  1顆",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "降檔固醇藥  1顆",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "維他命  1顆",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ElderFinished()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  color: Colors.lightGreen[300],
                ),
                width: 320,
                height: 100,
                child: Center(
                  child: Text(
                    "我已經吃藥了",
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
                  MaterialPageRoute(builder: (context) => ElderLater()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  color: Colors.red[300],
                ),
                width: 320,
                height: 100,
                child: Center(
                  child: Text(
                    "半小時候提醒我",
                    style: TextStyle(
                      fontSize: 36,
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
