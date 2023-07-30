import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shake/shake.dart';
import 'package:temp/ORwidget.dart';

import 'package:temp/main.dart';

TextEditingController dataQR=TextEditingController();
var flag=0;
double qr_size=250;
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    ShakeDetector detector=ShakeDetector.autoStart(onPhoneShake: (){

      setState(() {
        qr_size=qr_size+10;
      });
    }

    );
    Future.delayed(Duration(seconds: 1),(){
      setState(() {
        flag=0;
      });
    }
    );

  }
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: context.isDarkMode ? Colors.black87: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children:[
            TextField(
              style: TextStyle(letterSpacing: 1,color:context.isDarkMode ? Colors.white:Colors.black ),

              controller: dataQR,
            decoration: const InputDecoration(

              fillColor: Colors.white,
           labelText:"Enter the Data",
              labelStyle: TextStyle(letterSpacing: 1,color: Colors.white,fontSize: 18),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreen),
            ),

              focusedBorder:OutlineInputBorder(
                borderSide: BorderSide(color:Colors.lightGreen),
              )
              ),
              textAlign: TextAlign.start,

            ),
            SizedBox(height: 10,),
            SizedBox(
             height: 60,
             child: MaterialButton(
  color: Colors.lightGreen,
                 onPressed:(){
    setState(() {

    });

                 }, child: Text("Generate QR",style: TextStyle(color: Colors.white,letterSpacing: 1,fontSize: 18),)),
           ),
           SizedBox(height: 40,),
           Center(child:Container(
             width: 260,
             height: 260,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(8),
               color: Colors.white,

             ),
             child: Center(

               child: QrImageView(
                 size:qr_size,
                 data: dataQR.text,
                 version: QrVersions.auto,
                 embeddedImage: const AssetImage("assets/accident-car.png"),
                 backgroundColor:  Colors.white,
                 dataModuleStyle:const QrDataModuleStyle(
                   dataModuleShape: QrDataModuleShape.square,
                   color: Colors.indigo,


                 ) ,



               ),
             ),
           )),

           ],

        ),
      ),
    );
  }
}
