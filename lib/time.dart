//
// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main()
// {
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter TimePicker',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState()
//   {
//     return _MyHomePageState();
//   }
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   TimeOfDay selectedTime = TimeOfDay.now();
//   var dummyTime = TimeOfDay.now();
//
//   time(){
//     setState(() {
//       selectedTime = TimeOfDay.now();
//     });
//   }
//   @override
//   void initState() {
//     Timer.periodic(const Duration(seconds: 1), (timer) {
//       time();
//     });
//     // TODO: implement initState
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter TimePicker"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text("${selectedTime.hour}:${selectedTime.minute}"),
//             ElevatedButton(
//               onPressed: () {
//                 _selectTime(context);
//               },
//               child: Text("Choose Time"),
//             ),
//             Text("${dummyTime.hour}:${dummyTime.minute}"),
//           ],
//         ),
//       ),
//     );
//   }
//   _selectTime(BuildContext context) async {
//     final TimeOfDay timeOfDay = await showTimePicker(
//       context: context,
//       initialTime: selectedTime,
//       initialEntryMode: TimePickerEntryMode.dial,
//
//     );
//     if(timeOfDay != null && timeOfDay != selectedTime)
//     {
//       setState(() {
//         //selectedTime = timeOfDay;
//         dummyTime = timeOfDay;
//       });
//     }
//   }
// }