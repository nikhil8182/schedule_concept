// import 'dart:convert';
// import 'package:dart_ping/dart_ping.dart';
// import 'package:http/http.dart' as http;
//
// void main() async {
//   // Create ping object with desired args
//   final ping = Ping('o.j', count: 5);
//    //54.202.0.170
//   // [Optional]
//   // Preview command that will be run (helpful for debugging)
//   //ignore:avoid_print
//   print('Running command: ${ping.command}');
//   //Begin ping process and listen for output
//   ping.stream.listen((event) async {
//     //ignore:avoid_print
//     print("event is hello $event");
//     //ignore:avoid_print
//     print("event is hello ${event}");
//
//     if(event.error.toString() != "UnknownHost") {
//       var ip = "192.168.1.18:8000";
//       //ignore:avoid_print
//       print("event in if $ip");
//
//       final response = await http.get(Uri.parse(
//         "http://$ip/key",));
//       var fetchdata = jsonDecode(response.body);
//       if (response.statusCode > 0) {
//         //ignore:avoid_print
//         print("event inside if");
//         var data = fetchdata;
//         //ignore:avoid_print
//         print("data is $data");
//       }
//     }else{
//       var ip = "54.202.0.170";
//       //ignore:avoid_print
//       print("event in else ip is $ip");
//       final response = await http.get(Uri.parse(
//         "http://$ip/key",));
//       var fetchdata = jsonDecode(response.body);
//       if (response.statusCode > 0) {
//         //ignore:avoid_print
//         print("event inside if");
//         var data = fetchdata;
//         //ignore:avoid_print
//         print("data is $data");
//       }
//     }
//   });
// }
///ping concept

///
///post method
//
// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
//
// String drop ;
// List data = [];
// List<String> data1 =["Bulb_Button_Admin_Room"];
//
//
// Future<Album> createAlbum(String date,String time,String device,String state) async {
//   final response = await http.post(
//     Uri.parse('http://192.168.1.29/1/'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'Date': date,
//       'Time' : time,
//       'Device':device,
//       'Device_State' : state,
//     }
//     ),
//   );
//
//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create album.');
//   }
// }
//
// class Album {
//
//   final String date;
//   final String time;
//   final String device;
//   final String state;
//
//
//   Album({
//     @required this.time,
//     @required this.date,
//     @required this.device,
//     @required this.state,
//   });
//
//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       time:json['Time'],
//       date: json['Date'],
//       device : json['Device'],
//       state: json['Device_State'],
//     );
//   }
// }
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key key}) : super(key: key);
//
//   @override
//   _MyAppState createState() {
//     return _MyAppState();
//   }
// }
//
// class _MyAppState extends State<MyApp> {
//
//   final TextEditingController date = TextEditingController();
//   final TextEditingController time = TextEditingController();
//   final TextEditingController state = TextEditingController();
//
//
//   Future<Album> _futureAlbum;
//   String ipAddress = "o.j:8000";
//   String val = " ";
//   bool isSwitched = false;
//     var currentDate = DateTime.now();
//   var formatter = DateFormat('yyyy-MM-dd');
//   String formattedDate = " " ;
//   int day = 0;
//   int month = 0;
//   int year = 0;
//   String combination = " ";
//   String timeString = " ";
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
//
//
//
//
//
//   storeData() async {
//     final response = await http.get(Uri.parse("http://$ipAddress/key"));
//
//     data =  jsonDecode(response.body);
//     //ignore:avoid_print
//     //print("data is $data");
//     setState(() {
//       data1.clear();
//       for(int i = 0; i<data.length ; i++){
//         //ignore:avoid_print
//         print(data[i]);
//         data1.add(data[i]);
//       }
//       //ignore:avoid_print
//       // print("data1 is $data1");
//     });
//
//   }
//
//   TimeOfDay selectedTime = TimeOfDay.now();
//   var dummyTime = TimeOfDay.now();
//
//   _time(){
//     setState(() {
//       selectedTime = TimeOfDay.now();
//       });
//      }
//
//   @override
//   void initState() {
//     Timer.periodic(const Duration(seconds: 1), (timer) {
//       _time();
//     });
//     storeData();
//     // time();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Create Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Create Data Example'),
//         ),
//         body: Container(
//           alignment: Alignment.center,
//           padding: const EdgeInsets.all(8.0),
//           child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
//         ),
//       ),
//     );
//   }
//
//   Column buildColumn() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         // TextField(
//         //   controller: date,
//         //   decoration: const InputDecoration(hintText: 'Enter date'),
//         // ),
//         // TextField(
//         //   controller: time,
//         //   decoration: const InputDecoration(hintText: 'Enter Time'),
//         // ),
//         // TextField(
//         //   controller: device,
//         //   decoration: const InputDecoration(hintText: 'Enter device'),
//         // ),
//         // TextField(
//         //   controller: state,
//         //   decoration: const InputDecoration(hintText: 'Enter status'),
//         // ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(combination),
//             // Text(currentDate.toString()),
//             ElevatedButton(
//               onPressed: () => _selectDate(context),
//               child: Text('Select date'),
//             ),
//
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             //Text("${selectedTime.hour}:${selectedTime.minute}"),
//
//             Text(timeString),
//
//             ElevatedButton(
//               onPressed: () {
//                 _selectTime(context);
//               },
//               child: const Text("Choose Time"),
//             ),
//           ],
//         ),
//
//         const SizedBox(
//         height: 100,
//         ),
//       DropdownButton<String>(
//             hint:const Text("Select something"),
//               value: drop,
//               icon: const Icon(Icons.arrow_downward),
//             iconSize: 24,
//             elevation: 16,
//          style: const TextStyle(color: Colors.deepPurple),
//         underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//          ),
//          onChanged: (String newValue) {
//          setState(() {
//          drop = newValue;
//         val = drop;
//         //ignore:avoid_print
//           print("val is $val");
//       });
//      },
//        items: data1.map<DropdownMenuItem<String>>((value){
//        return DropdownMenuItem<String>(
//              value: value,
//            child: Text(value),
//             );
//               }).toList(),
//              ),
//              Switch(
//                value: isSwitched,
//                onChanged: (value) {
//                setState(() {
//            isSwitched = value;
//               //ignore:avoid_print
//               print(isSwitched);
//           });
//      },
//              activeTrackColor: Colors.lightGreenAccent,
//               activeColor: Colors.green,
//      ),
//
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               _futureAlbum = createAlbum(date.text,time.text,val,state.text);
//             });
//           },
//           child: const Text('Create Data'),
//         ),
//       ],
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
//         timeString = "${dummyTime.hour}:${dummyTime.minute}";
//       });
//     }
//   }
//
//   FutureBuilder<Album> buildFutureBuilder() {
//     return FutureBuilder<Album>(
//       future: _futureAlbum,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Column(
//             children: [
//               Text(snapshot.data.time),
//               Text(snapshot.data.date),
//               Text(snapshot.data.device),
//               Text(snapshot.data.state),
//             ],
//           );
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         }
//
//         return const CircularProgressIndicator();
//       },
//     );
//   }
// }


///time





///completed
///
//
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
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
///date picker
/// Flutter code sample for DropdownButton

// This sample shows a `DropdownButton` with a large arrow icon,
// purple text style, and bold purple underline, whose value is one of "One",
// "Two", "Free", or "Four".
//
// ![](https://flutter.github.io/assets-for-api-docs/assets/material/dropdown_button.png)


///dropdown list
// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// String drop ;
// List data = [];
// List<String> data1 =["Bulb_Button_Admin_Room"];

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
// This is the stateful widget that the main application instantiates.
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// /// This is the private State class that goes with MyStatefulWidget.
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {

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
