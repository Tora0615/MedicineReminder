import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TitleAndMessage extends StatelessWidget {
  final double deviceHeight;
  TitleAndMessage(this.deviceHeight);
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height: deviceHeight * 0.15,
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: AutoSizeText(
                "從現在開始\n改善您的吃藥習慣",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.black, height: 1.3),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ),
        Container(
          height: deviceHeight * 0.15,
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: AutoSizeText(
              "這是一款簡單易使用的 APP ，可以幫助您在適當時間服藥",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.grey[600], height: 1.3,),
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
          ),
        ),
      ],
    );
  }
}
