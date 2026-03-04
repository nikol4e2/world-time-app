import 'package:flutter/material.dart';
import "package:worldtimeapp/services/world_time.dart";

class Loading extends StatefulWidget {

  
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time="Loading";

  void setupWorldTime() async{
    WorldTime instance= WorldTime(location: "MK", flag: "mk.png");
    await instance.getTime();

    setState(() {
      time=instance.time;
      print(time);
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
      body: Padding(padding: EdgeInsetsGeometry.all(50.0), 
      child: Text(time),),
    );
  }
}
