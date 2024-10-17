import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:second_quotesapp/screens/second_screen.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = "";
  String author = "";

  @override
  Widget build(BuildContext context) {
    // following code is to show the quote and button on single page it self so on click the quote keeps on change

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Click to Get Quote"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              quote,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "-$author",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // following code is for on click go to next screen and show quote
              // following is copied from pub.dev
              // and api link is from api ninja
              var url = Uri.parse(
                  'https://api.api-ninjas.com/v1/quotes?category=computers');
              Map<String, String> headers;
              // the api key is taken from our api ninja account
              var response = await http.get(url,
                  headers: headers = {
                    'X-Api-Key': 'q5y58cliCEuXhkgAnJD3Wf4BqRQuqZqK7zU3lRH8'
                  });
              print('Response status: ${response.statusCode}');
              print('Response body: ${response.body}');
              // following to convert data in normal string data which we got from api call
              var data = jsonDecode(response.body);
              // following will store quote and auther s oth element from the list to the variable
              quote = data[0]["quote"];
              author = data[0]["author"];

              setState(() {});

              // following is how we navigate to next page on pressed
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>
              //         Second_screen(quotetext: quote, authoname: author)));
            },
            child: Text("Get Quote"),
          ),
        ],
      ),
    ));
  }
}
