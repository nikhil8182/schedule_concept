//
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// void main() => runApp(MyApp());
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: MyHomePage(),
//     );
//   }
// }
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
// class _MyHomePageState extends State<MyHomePage> {
//   var currentDate = DateTime.now();
//   var formatter = DateFormat('yyyy-MM-dd');
//   String formattedDate = " " ;
//   int day = 0;
//   int month = 0;
//   int year = 0;
//   String combination = " ";
//
//   Future<void> _selectDate(BuildContext context) async {
//     formattedDate = formatter.format(currentDate);
//     //ignore:avoid_print
//     print("formatDate $formattedDate");
//     final DateTime pickedDate = await showDatePicker(
//         context: context,
//         initialDate: currentDate,
//         firstDate: DateTime(2015),
//         lastDate: DateTime(2050));
//     if (pickedDate != null && pickedDate != currentDate) {
//       setState(() {
//
//         currentDate = pickedDate;
//         day = pickedDate.day;
//         month = pickedDate.month;
//         year = pickedDate.year;
//         combination = "$day/$month/$year";
//         //ignore:avoid_print
//         print("currentDate $currentDate");
//         //ignore:avoid_print
//         print("combination $combination");
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("DatePicker"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(currentDate.toString()),
//             RaisedButton(
//               onPressed: () => _selectDate(context),
//               child: Text('Select date'),
//             ),
//             Text(combination),
//           ],
//         ),
//       ),
//     );
//   }
// }