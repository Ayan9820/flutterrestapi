// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
// ignore: unused_import

import 'package:test_app/model/post2.dart';
import 'package:test_app/services/remote_services.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Posts>? postsapi;

  var isloading = false;

  @override
  void initState() {
    getdata();
  }

  getdata() async {
    postsapi = await Remote_Service().getPosts();
    if (postsapi != null) {
      setState(() {
        isloading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messaging'),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isloading,
        child: ListView.builder(
            itemCount: postsapi?.length,
            itemBuilder: (context, index) {
              return Container(
                child: Text(postsapi![index].id.toString()),
              );
            }),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    //     body: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               ElevatedButton(onPressed: getdata, child: Text("Fetch Data")),
    //               ElevatedButton(onPressed: reset, child: Text("Reset Data")),
    //             ],
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Flexible(
    //                 child: Text(
    //                   message,
    //                   maxLines: 20,
    //                   style: TextStyle(fontSize: 30),
    //                 ),
    //               )
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   );
    // }

    // void reset() {
    //   setState(() {
    //     message = " ";
    //   });
    // }

    // void getdata() {
    //   var somedata = fetch();
    //   // print("hello world");
    //   setState(() {
    //     message = somedata;
    //   });
    // }

    // Future fetch() async {
    //   try {
    //     var url = 'https://jsonplaceholder.typicode.com/todos/1';
    //     Response response = await get(Uri.parse(url));

    //     print(response.body);
    //     // return 'hey bitch';
    //   } catch (error) {
    //     print(error);
    //     return error.toString();
    //   }
  }
}
