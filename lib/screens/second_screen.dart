import 'package:flutter/material.dart';

// ignore: camel_case_types
class Second_screen extends StatelessWidget {
  // creating 2 variables of quotes and author
  String quotetext;
  String authoname;
  // accpecting some data from from home_sceen file assigned to these 2 variables
  Second_screen({super.key, required this.authoname, required this.quotetext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Today's Quote"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                quotetext,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  authoname,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ));
  }
}
