import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String time="";
  String flag;
  bool? isDaytime;

  WorldTime({required this.location,required this.flag});



  Future<void> getTime() async{

    try{
      Response response= await get(Uri.parse("https://timeapi.io/api/v1/time/current/utc"));
      Map data = jsonDecode(response.body);
      DateTime dateTime = DateTime.parse( data['utc_time']);
      dateTime=dateTime.add(Duration(hours: 1));
      String formattedTime =
          "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
      time = DateFormat.jm().format(dateTime);
      isDaytime=dateTime.hour >6 && dateTime.hour<20 ? true : false;
      print(time);
    }
    catch(e)
    {
      time="Error";
    }


  }


}

