import 'package:flutter/material.dart';

class ElderFinished extends StatelessWidget {
  const ElderFinished({Key key}) : super(key: key);

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
            Icon(Icons.check_circle_outline,size: 140,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(32.0),
                ),
                color: Colors.grey[300],
              ),
              width: 320,
              height: 280,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "近期無吃藥提醒",
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "下次吃藥  四小時後",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
