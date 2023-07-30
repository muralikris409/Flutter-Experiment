
import 'package:fancy_text_reveal/fancy_text_reveal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:temp/signup.dart';
import 'package:temp/home.dart';
import 'firebase_options.dart';
import 'mainhome.dart';

// ...

User? user=FirebaseAuth.instance.currentUser;
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
          context, MaterialPageRoute(builder: (context) => const Home()));
    } // if result not null we simply call the MaterialpageRoute,
    // for go to the HomePage screen
  }
}
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCRu32S10xXbnDogBSsUqLdvMUO5MNRq2I',
      appId: '1:565732616998:android:9a1e174d33483eb5d12fe7',
      messagingSenderId: '565732616998',
      projectId: 'crash-detection-a6f5a',
      databaseURL: 'https://crash-detection-a6f5a-default-rtdb.firebaseio.com',
      storageBucket: 'crash-detection-a6f5a.appspot.com',
    ),
  );
// function to implement the google signin

// creating firebase instance




  runApp(MaterialApp(
  home:user==null?const Login():const Home(),
  ));

}
Future<void> checkPermission() async {
  var mic=await Permission.microphone.status;
  if(! mic.isGranted){
    Permission.microphone.request();
  }

  if(await Permission.sensors.status.isDenied) {
    Permission.sensors.request();
  }

  if(await Permission.manageExternalStorage.isDenied){
    Permission.manageExternalStorage.request();
  }

}
extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override

  Widget build(BuildContext context) {
    TextEditingController email=TextEditingController();
    TextEditingController pass=TextEditingController();
    double width_=MediaQuery.of(context).size.width;
    //FirebaseAuth auth=FirebaseAuth.instance;

    checkPermission();
    Future<void> signIn() async {


      FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: pass.text);


    }
    if(width_<1000){
      width_=MediaQuery.of(context).size.width-30;
    }
    else{
      width_=400;
    }

    return  Scaffold(
  drawerEnableOpenDragGesture: false,

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

                  SizedBox(height:20),
                  Container(width:200,height:200,child: Image.asset("assets/accident-car.png")),
                  SizedBox(height:26),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child:  Container(
                        width:MediaQuery.of(context).size.width,
                        height:MediaQuery.of(context).size.height/1.5,
                        decoration: BoxDecoration(
                          color: context.isDarkMode ? Colors.black87: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(6)),


                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: ListView(
                            children: [
                              FancyTextReveal(
                                  child: Text("Stay safe, we've got your back.",
                                    style:TextStyle(letterSpacing: 1.5,fontSize: 32,fontWeight: FontWeight.w500,color:Colors.indigo) ,)),
                              SizedBox(height:56),
                              TextField(

                                decoration: InputDecoration(
                                  labelText: "Username",
                                  labelStyle: TextStyle(color: context.isDarkMode ? Colors.white: Colors.black87,fontSize: 20),
                                  fillColor:  context.isDarkMode ? Colors.black87: Colors.white,
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
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: context.isDarkMode ? Colors.white: Colors.black87,fontSize: 20),
                                  fillColor:  context.isDarkMode ? Colors.black87: Colors.white,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: context.isDarkMode ? Colors.white: Colors.black87),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: context.isDarkMode ? Colors.white: Colors.black87),
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
                                    signIn();
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Logged in:)"+FirebaseAuth.instance.currentUser!.email.toString() )));
                                  },
                                  child: Text("Sign In",style: TextStyle(color: context.isDarkMode ? Colors.black87: Colors.white,letterSpacing: 3,fontSize: 20,fontWeight: FontWeight.w500),),

                                ),
                              ),
                              SizedBox(height:30),
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
                              const SizedBox(height:20),
                              TextButton(onPressed: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>Signup()));

                              }, child: Text("Create an Account")),
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
