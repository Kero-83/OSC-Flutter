// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:news/views/widgets/news_card.dart';
import 'package:news/views/widgets/news_element.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "News",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Row(
              // mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(3.5, 0, 0, 0),
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsElement(
                      title:
                          'Galaxy Z Fold 6 With Slot for S Pen? It Could Happen',
                      content:
                          '''Samsung fans have been asking for a built-in S Pen on the Galaxy Z Fold series for a few years. Frankly, we’re surprised it hasn’t yet happened, but thanks to a recently detailed patent from Samsung, it appears the company is definitely working to  make this a reality at some point in the future.
                            
Detailed by StudiMO in collaboration @xleaks7, Samsung’s patent is full of images of Galaxy Z device designs with slots for an S Pen. It seems Samsung hasn’t yet decided on where it’ll slot in, possibly on the side or on the back, but importantly, Samsung is ensuring that once this is produced and available, it’s all protected by law. Much of the patent seems focused on how the stylus interacts with the device, with S Pen designs detailed with all sorts of buttons and clickers.


''',
                      imageUrl:
                          'https://www.droid-life.com/wp-content/uploads/2023/08/Galaxy-Z-Fold-5-45-1366x911.jpg',
                    ),
                  ));
            },
            child: NewsCard(
              content:
                  '''Samsung fans have been asking for a built-in S Pen on the Galaxy Z Fold series for a few years. Frankly, we’re surprised it hasn’t yet happened, but thanks to a recently detailed patent from Samsung, it appears the company is definitely working to  make this a reality at some point in the future.
                            
Detailed by StudiMO in collaboration @xleaks7, Samsung’s patent is full of images of Galaxy Z device designs with slots for an S Pen. It seems Samsung hasn’t yet decided on where it’ll slot in, possibly on the side or on the back, but importantly, Samsung is ensuring that once this is produced and available, it’s all protected by law. Much of the patent seems focused on how the stylus interacts with the device, with S Pen designs detailed with all sorts of buttons and clickers.


''',
              title: 'Galaxy Z Fold 6 With Slot for S Pen? It Could Happen',
              imageUrl:
                  'https://www.droid-life.com/wp-content/uploads/2023/08/Galaxy-Z-Fold-5-45-1366x911.jpg',
            ),
          )
        ],
      ),
    );
  }
}
