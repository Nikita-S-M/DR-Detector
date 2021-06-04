import 'package:authentification/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("Start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  navigateToHome() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: Container(
      child: !isloggedin
          ? CircularProgressIndicator()
          : Column(
              children: <Widget>[
                SizedBox(height: 40.0.h),
                Container(
                  height: 500.h,
                  child: Image(
                    image: AssetImage("images/confirm.gif"),
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  child: Text(
                    "Congratulations  ",
                    style:
                        TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text(
                    "You are successfully logged in",
                    style:
                        TextStyle(fontSize: 18.0.sp ,fontWeight: FontWeight.normal),
                  ),
                ),
                
                 

                   ElevatedButton.icon(
                    label: Text('Get Started'),
                    icon: Icon(Icons.arrow_forward ),
                    style: ElevatedButton.styleFrom(
                    //primary: Colors.indigo,
                    onPrimary: Colors.white,
                    shadowColor: Colors.red,
                    elevation: 5,
                     ),
                    onPressed: navigateToHome,
                   )
                  
              ],
            ),
    ),),);
  }
}
