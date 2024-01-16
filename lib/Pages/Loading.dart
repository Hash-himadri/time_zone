import 'package:flutter/material.dart';
import 'package:time_zone/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});
  @override
  State<Loading> createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.cyan[400],
        child: SpinKitPianoWave(
          color: Colors.white,
          size: 200,
        ),
    );
  }

  void setupWorldTime() async{
    WorldTime instance = WorldTime("Kolkata", "India.jpeg", "Asia/Kolkata");
    await instance.getTime();

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }
}

