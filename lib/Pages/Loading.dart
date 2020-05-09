import 'package:flutter/material.dart';
import 'package:worldtime/Services/WorldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  String time= 'Loading';
  void setupWorldTime() async{
    WorldTime instance = WorldTime(url:'Europe/London',location:'London',flags:'London.jpg');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flags,
      'isDayTime':instance.isDayTime,
    });
    //print(instance.time);
    setState(() {
      time=instance.time;
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
      backgroundColor: Colors.blue[800],
      body: Center(

        child:SpinKitFadingCircle(
          color: Colors.white,
          size: 50.0,

        ),
      )
    );
  }
}
