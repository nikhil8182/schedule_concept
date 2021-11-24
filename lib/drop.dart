// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// String drop ;
// List data = [];
// List<String> data1 =["Bulb_Button_Admin_Room"];
//
// void main() => runApp(const MyApp());
//
// /// This is the main application widget.
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const Center(
//           child: MyStatefulWidget(),
//         ),
//       ),
//     );
//   }
// }
// ////This is the stateful widget that the main application instantiates.
//
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// /// This is the private State class that goes with MyStatefulWidget.
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//
// String ipAddress = "o.j:8000";
// String val = " ";
// bool isSwitched = false;
// storeData() async {
//   final response = await http.get(Uri.parse("http://$ipAddress/key"));
//
//   data =  jsonDecode(response.body);
//   //ignore:avoid_print
//   //print("data is $data");
//   setState(() {
//     data1.clear();
//     for(int i = 0; i<data.length ; i++){
//       //ignore:avoid_print
//       print(data[i]);
//        data1.add(data[i]);
//     }
//     //ignore:avoid_print
//     // print("data1 is $data1");
//   });
//
// }
//
// @override
// void initState() {
//   // Timer.periodic(const Duration(seconds: 1), (timer) {
//   //   storeData();
//   // });
//   storeData();
//   // time();
// }
//
//   @override
//   Widget build(BuildContext context) {
//      // time();
//     //ignore:avoid_print
//     print("data1 in widget is $data1");
//     return Column(
//       children: [
//         const SizedBox(
//           height: 100,
//         ),
//         DropdownButton<String>(
//           hint:const Text("Select something"),
//           value: drop,
//           icon: const Icon(Icons.arrow_downward),
//           iconSize: 24,
//           elevation: 16,
//           style: const TextStyle(color: Colors.deepPurple),
//           underline: Container(
//             height: 2,
//             color: Colors.deepPurpleAccent,
//           ),
//           onChanged: (String newValue) {
//             setState(() {
//               drop = newValue;
//               val = drop;
//               //ignore:avoid_print
//               print("val is $val");
//             });
//           },
//           items: data1.map<DropdownMenuItem<String>>((value){
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//         ),
//         Switch(
//           value: isSwitched,
//           onChanged: (value) {
//             setState(() {
//               isSwitched = value;
//               //ignore:avoid_print
//               print(isSwitched);
//             });
//           },
//           activeTrackColor: Colors.lightGreenAccent,
//           activeColor: Colors.green,
//         ),
//       ],
//     );
//
//   }
// }