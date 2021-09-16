import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Card TrainingPlanWidget(BuildContext context, String name) {
  return Card(
    child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {
        print('Card tapped.');
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 100,
        child: (Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.indigo,
              radius: 50,
              child: Text("PON"),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 5.0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Container(
                    height: 20,
                    width: 100,
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: ListView(
                      dragStartBehavior: DragStartBehavior.down,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Text("A"),
                        Text("A"),
                        Text("A"),
                        Text("A"),
                        Text("A"),
                        Text("A"),
                        Text("A"),
                        Text("A"),
                        Text("A"),
                        Text("A"),
                        Text("A"),
                        Text("A"),
                        Text("B"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    ),
  );
}
