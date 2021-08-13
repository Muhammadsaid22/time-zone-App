import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:world_time/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime vaqt = WorldTime(location: 'Tashkent', flag: 'uzb.jpeg', url: 'Asia/Tashkent');
    await vaqt.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': vaqt.location,
      'flag': vaqt.flag,
      'time': vaqt.time,
      'isDayTime': vaqt.isDayTime,
    });
  }

  @override

  void initState() {
    super.initState();
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Padding(
            padding: EdgeInsets.all(50.0),
            child: Center(
              child: SpinKitCircle(
                color: Colors.white,
                size: 80.0,
              ),

            )

        )
    );
  }
}
