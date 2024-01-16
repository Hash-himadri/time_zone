import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  late String time;
  String flag;
  String url;
  late bool isDaytime;

  WorldTime(this.location, this.flag, this.url);

  Future<void> getTime() async{
    try{
      //int x  = Integer.parseInt("12");
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      // print("Response: $response");
      Map data = jsonDecode(response.body);

      print("response: $data");

      String datetime = data['datetime'];
      String hour = data['utc_offset'].substring(0,3);
      String mins = data['utc_offset'].substring(4,6);
      print("Hour = $hour and mins = $mins");

      DateTime now = DateTime.parse(datetime);
      print("Now = $now");

      now = now.add(Duration(hours: int.parse(hour)));
      now = now.add(Duration(minutes: int.parse(mins)));
      print("Now: $now");

      isDaytime = now.hour >6 && now.hour<19 ? true : false;
      time = DateFormat.jm().format(now);
      print("Time is = $time");
    }
    catch(e){
      print("Error: $e");
      time = "could not be processed!";
    }
  }
}