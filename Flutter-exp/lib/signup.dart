
import "package:temp/main.dart";
import 'package:fancy_text_reveal/fancy_text_reveal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:temp/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'firebase_options.dart';
final FirebaseAuth auth = FirebaseAuth.instance;
Future<void> gSignup(BuildContext context) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    // Getting users credential
    UserCredential result = await auth.signInWithCredential(authCredential);
    User? user = result.user;

    if (result != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } // if result not null we simply call the MaterialpageRoute,
    // for go to the HomePage screen
  }
}
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override

  Widget build(BuildContext context) {
    TextEditingController f_name=TextEditingController();
    TextEditingController l_name=TextEditingController();
    TextEditingController emailc=TextEditingController();
    TextEditingController dob=TextEditingController();
    TextEditingController pass=TextEditingController();
    double width_=MediaQuery.of(context).size.width;
    //FirebaseAuth auth=FirebaseAuth.instance;
    Future<void> checkPermission() async {
      var mic=await Permission.microphone.status;
      if(! mic.isGranted){
        Permission.microphone.request();
      }

    }
    checkPermission();
    Future<void> signUp() async {
      //  auth.signInWithEmailAndPassword(email: "hai", password: "hai");
      try {
        FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailc.text, password: pass.text);
      }
      catch(e){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }

    }
    void validate(){
      int count=0;
      if(f_name.text.isNotEmpty){
        count++;
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter a first name")));
      }
      if(l_name.text.isNotEmpty){
        count++;
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter a first name")));
      }
      if(dob.text.isNotEmpty){
        count++;
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter a DOB")));
      }

      if(emailc.text.isNotEmpty&&emailc.text.length>5){
        count++;
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter a valid email")));
      }

      if(pass.text.isNotEmpty&&pass.text.length>5){
        count++;
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter valid password")));
      }
      if(count==5)
        signUp();
    }
    if(width_<1000){
      width_=MediaQuery.of(context).size.width-30;
    }
    else{
      width_=400;
    }


    return  Scaffold(
    

      body:  Center(
        child: Container(
          decoration: const BoxDecoration(
            image:DecorationImage(
              image: AssetImage("assets/mesh.png"),
              fit: BoxFit.cover,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child:Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child:ListView(
                children: [


                  SizedBox(height:5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child:  Container(
                        width:MediaQuery.of(context).size.width,
                        height:MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color:  context.isDarkMode ? Colors.black87: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(6)),


                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: ListView(
                            children: [
                              FancyTextReveal(
                                  child: Text("Let us provide you with the extra layer of protection you deserve.",
                                    style:TextStyle(letterSpacing: 1.5,fontSize: 32,fontWeight: FontWeight.w500,color: context.isDarkMode ? Colors.blue: Colors.indigo) ,)),
                              SizedBox(height:30),
                              TextField(
                                controller: f_name,
                                decoration: InputDecoration(
                                  labelText: "First name",
                                  labelStyle: TextStyle(color: context.isDarkMode ? Colors.white: Colors.black87,fontSize: 20),
                                  fillColor:context.isDarkMode ? Colors.white: Colors.black87,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color:context.isDarkMode ? Colors.white: Colors.black87),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color:context.isDarkMode ? Colors.white: Colors.black87),
                                  ),
                                ),
                              ),
                              SizedBox(height:26),
                              TextField(
                                controller: l_name,
                                decoration: InputDecoration(
                                  labelText: "Last name",
                                  labelStyle: TextStyle(color: context.isDarkMode ? Colors.white: Colors.black87,fontSize: 20),
                                  fillColor: Colors.black,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: context.isDarkMode ? Colors.white: Colors.black87),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: context.isDarkMode ? Colors.white: Colors.black87),
                                  ),
                                ),
                              ),
                              SizedBox(height:26),
                              TextField(
                                controller: dob,
                                keyboardType: TextInputType.datetime,

                                decoration: InputDecoration(
                                  labelText: "DOB",

                                  labelStyle: TextStyle(color: context.isDarkMode ? Colors.white: Colors.black87,fontSize: 20),
                                  fillColor: Colors.black,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: context.isDarkMode ? Colors.white: Colors.black87),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: context.isDarkMode ? Colors.white: Colors.black87),
                                  ),
                                ),
                              ),
                              SizedBox(height:26),
                              TextField(
                                controller: emailc,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  labelStyle: TextStyle(color:  context.isDarkMode ? Colors.white: Colors.black87,fontSize: 20),
                                  fillColor:  context.isDarkMode ? Colors.white: Colors.black87,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color:  context.isDarkMode ? Colors.white: Colors.black87),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: context.isDarkMode ? Colors.white: Colors.black87),
                                  ),
                                ),
                              ),
                              SizedBox(height:26),

                              TextField(
                                controller: pass,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: context.isDarkMode ? Colors.white: Colors.black87,fontSize: 20),
                                  fillColor: context.isDarkMode ? Colors.white: Colors.black87,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: context.isDarkMode ? Colors.white: Colors.black87),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color:  context.isDarkMode ? Colors.white: Colors.black87),
                                  ),
                                ),
                              ),
                              SizedBox(height:30),
                              Container(

                                height: 50,

                                child: MaterialButton(
                                  padding: EdgeInsets.symmetric(horizontal: 60),
                                  color: Colors.blue,
                                  onPressed: (){
                                      validate();
                                  },
                                  child: Text("Sign Up",style: TextStyle(color: context.isDarkMode ? Colors.black87: Colors.white,letterSpacing: 3,fontSize: 20,fontWeight: FontWeight.w500),),

                                ),
                              ),
                              SizedBox(height:20),
                              Container(

                                height: 50,

                                child:IconButton(
                                  iconSize: 46,
                                  color: Colors.blue,
                                  icon: Icon(MdiIcons.fromString("google")), onPressed: () {
                                   gSignup(context);
                                },


                                ),
                              ),
                              SizedBox(height:18),
                              TextButton(onPressed: (){
                                Navigator.pop(context);

                              }, child: Text("Already have an account")),
                            ],
                          ),
                        ),

                      ),
                    ),
                  ),

                ],
              ),
            ),
          ) ,
        ),
      ),
    );
  }
}
