import 'package:authentification/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        body: Container(
      child: Container(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
              ),
              
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: new Container(
                  child: Image(
                  image: AssetImage("images/profile.gif"),
                  fit: BoxFit.contain,
                 ),

                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: new Container(
                  child: Text(
                    "${user.displayName}",
                    style:
                        TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.bold),
                  ),

                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: new Container(
                  child: Text(
                    "${user.email}",
                    style:
                        TextStyle(fontSize: 12.0.sp ,fontWeight: FontWeight.normal),
                  ),

                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: new Container(
                  child: ElevatedButton.icon(
                    label: Text('Log Out'),
                    icon: Icon(Icons.logout ),
                    style: ElevatedButton.styleFrom(
                    //primary: Colors.indigo,
                    onPrimary: Colors.white,
                    shadowColor: Colors.red,
                    elevation: 5,
                     ),
                    onPressed: signOut,
                   )

                ),
              ),
              

            ],
          ),
        ),
      )),
      
    )
    );
    
  }


}
