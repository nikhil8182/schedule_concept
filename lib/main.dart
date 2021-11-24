import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

String drop;
List data = [];
List<String> data1 = ["Bulb_Button_Admin_Room"];

void main() {
  runApp(MyApp());
}


//completed schedule concept on 25-nov-2021

Future<Album> createAlbum(
    String time, String date, String device, bool state) async {
  final response = await http.post(
    Uri.parse('http://192.168.1.29:80/1/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'Time': time,
      'Date': date,
      'Device': device,
      'Device_State': state.toString(),
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final String date;
  final String time;
  final String device;
  final bool state;

  Album({
    @required this.time,
    @required this.date,
    @required this.device,
    @required this.state,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      time: json['Time'],
      date: json['Date'],
      device: json['Device'],
      state: json['Device_State'] as bool,
    );
  }
}






class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TimePicker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Album> _futureAlbum;
  TimeOfDay selectedTime = TimeOfDay.now();
  var dummyTime = TimeOfDay.now();
  var currentDate = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  String formattedDate = " ";
  int day = 0;
  int month = 0;
  int year = 0;
  String combination = " ";
  String ipAddress = "o.j:8000";
  String val = " ";
  bool isSwitched = false;
  String dumTime = " ";
  int zeroHour = 0;
  int zeroMin = 0;
  int zeroDay=0;
  int zeroMonth = 0;

  storeData() async {
    final response = await http.get(Uri.parse("http://$ipAddress/key"));
    data = jsonDecode(response.body);
    setState(() {
      data1.clear();
      for (int i = 0; i < data.length; i++) {
        data1.add(data[i]);
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    formattedDate = formatter.format(currentDate);
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
        day = pickedDate.day;
        month = pickedDate.month;
        year = pickedDate.year;
        combination = "$day/$month/$year";
      });
    }
  }

  time() {
    setState(() {
      selectedTime = TimeOfDay.now();
    });
  }

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      time();
    });
    storeData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Method"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: (_futureAlbum == null)
            ? buildColumn(context)
            : buildFutureBuilder(context),
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //Text("${selectedTime.hour}:${selectedTime.minute}"),
            ElevatedButton(
              onPressed: () {
                _selectTime(context);
              },
              child: const Text("Choose Time"),
            ),
            Text(dumTime.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select date'),
            ),
            Text(combination),
          ],
        ),
        DropdownButton<String>(
          hint: const Text("Select something"),
          value: drop,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              drop = newValue;
              val = drop;
              //ignore:avoid_print
              //print("val is $val");
            });
          },
          items: data1.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Device Status'),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  //ignore:avoid_print
                  print(isSwitched);
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(dumTime.toString(), combination, val, isSwitched);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder(BuildContext context) {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(snapshot.data.time),
              Text(snapshot.data.date),
              Text(snapshot.data.device),
              Text(snapshot.data.state.toString()),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        //selectedTime = timeOfDay;
        dummyTime = timeOfDay;
        dumTime = dummyTime.toString().substring(10,15);
        // //ignore:avoid_print
        // print("ferosh  is $ferosh");
        //ignore:avoid_print
        print("dumm is ${dummyTime}");
        //dumTime = "${dummyTime.hour}:${dummyTime.minute}";
        //ignore:avoid_print
        print("dumTime is $dumTime");

      });
    }
  }
}
