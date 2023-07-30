

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:temp/main.dart';
import 'main.dart';





class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<dynamic> accelerometerValue=[];
  var x=0.0,y=0.0,z=0.0;
  void getAccelero(){
    setState(() {
      accelerometerEvents.listen((event) {

       accelerometerValue.insert(0,event.x.toString());
       accelerometerValue.insert(1,event.y.toString());
       accelerometerValue.insert(2,event.z.toString());

      },
          onError: (e){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Check the sensors")));
          }

    );});
  }
  @override

  void initState(){
    super.initState();
    setState(() {
      accelerometerEvents.listen((event) {

        setState(() {
          accelerometerValue.insert(0,event.x.toString());
          accelerometerValue.insert(1,event.y.toString());
          accelerometerValue.insert(2,event.z.toString());

        });

         print(event);
      },
      onError: (e){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Check the sensors")));
      }

      );
    });
  }
  @override
  Widget build(BuildContext context) {
    checkPermission();


    return  AnimatedContainer(
      duration: const Duration(seconds: 5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: context.isDarkMode ? Colors.black87: Colors.white,
      child: ListView(
        children: [

         Center(child:Text("x :  "+accelerometerValue[0].toString(),style: const TextStyle(fontSize: 20,letterSpacing: 1,color: Colors.lightGreen),),),
          Center(child:Text("Y :  "+accelerometerValue[1].toString(),style: const TextStyle(fontSize: 20,letterSpacing: 1,color: Colors.lightGreen),),),
          Center(child:Text("Z :  "+accelerometerValue[1].toString(),style: const TextStyle(fontSize: 20,letterSpacing: 1,color: Colors.lightGreen ),),)




          ]),

    );
  }
}
