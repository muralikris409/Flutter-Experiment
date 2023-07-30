import "dart:developer";

import "package:animated_splash_screen/animated_splash_screen.dart";
import "package:material_design_icons_flutter/material_design_icons_flutter.dart";
import "package:permission_handler/permission_handler.dart";

import "package:temp/Profile.dart";
import "package:temp/mainhome.dart";
import "package:temp/map.dart";

import 'main.dart';
import "package:flutter/material.dart";
import "package:google_nav_bar/google_nav_bar.dart";
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _tab=0;
  late AnimationController _controller;
 bool status=false;

  void initState()  {
    super.initState();

    _controller=AnimationController(vsync:this,duration: const Duration(seconds: 3));

  }
  void animate(){
    if(status==false) {
      _controller.forward();
      status=true;
    }
    else{
      status=false;
      _controller.reverse();
    }
  }

  List<Widget> screens=[
    const HomePage(),
    const map(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {



    return  Scaffold(
     appBar:AppBar(
        leading: Icon(MdiIcons.menu,color:context.isDarkMode ? Colors.white70: Colors.black, ),

        actions: [
          GestureDetector(
              onTap: ()=>animate(),
              child: AnimatedIcon(icon: AnimatedIcons.list_view, progress: _controller,))

        ],

        backgroundColor: context.isDarkMode ? Colors.black: Colors.indigo,


      ) ,
      body:screens[_tab],
      bottomNavigationBar:AnimatedContainer(
        duration: const Duration(seconds: 2),
        height: 70,
        color: Colors.black,
        child: GNav(
          backgroundColor: context.isDarkMode ? Colors.black: Colors.white24,
          tabs: [
          GButton(
            padding: const EdgeInsets.all(12),

            icon: MdiIcons.home,
            iconActiveColor: context.isDarkMode ? Colors.lightGreen: Colors.lightGreen,
            iconColor: context.isDarkMode ? Colors.white: Colors.black87,
            text: "Home",textStyle: const TextStyle(color: Colors.lightGreen,letterSpacing: 0.5,fontWeight: FontWeight.w600),
            active: true,

            backgroundColor: context.isDarkMode ? const Color(0xFFffffff).withOpacity(0.2): const Color(0x00000000).withOpacity(0.5),
            textColor: context.isDarkMode ? Colors.white: Colors.black87,
            gap: 5,
          ),
            GButton(
              padding: const EdgeInsets.all(12),

              icon: MdiIcons.mapMarker,
              iconActiveColor: context.isDarkMode ? Colors.lightGreen: Colors.lightGreen,
              iconColor: context.isDarkMode ? Colors.white: Colors.black87,
              text: "Map",textStyle: const TextStyle(color: Colors.lightGreen,letterSpacing: 0.5,fontWeight: FontWeight.w600),
              active: true,

              backgroundColor: context.isDarkMode ? const Color(0xFFffffff).withOpacity(0.2): const Color(0x00000000).withOpacity(0.5),
              textColor: context.isDarkMode ? Colors.white: Colors.black87,
              gap: 5,
            ),
            GButton(
              padding: const EdgeInsets.all(12),

              icon: MdiIcons.faceManProfile,
              iconActiveColor: context.isDarkMode ? Colors.lightGreen: Colors.lightGreen,
              iconColor: context.isDarkMode ? Colors.white: Colors.black87,
              text: "Profile",textStyle: const TextStyle(color: Colors.lightGreen,letterSpacing: 0.5,fontWeight: FontWeight.w600),
              active: true,

              backgroundColor: context.isDarkMode ? const Color(0xFFffffff).withOpacity(0.2): const Color(0x00000000).withOpacity(0.5),
              textColor: context.isDarkMode ? Colors.white: Colors.black87,
              gap: 5,
            ),


        ],
          onTabChange: (index){
            setState(() {
              _tab=index;
              if(index==1){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const map()));
              }
            });
          },


        ),
      ) ,
    );
  }
}
