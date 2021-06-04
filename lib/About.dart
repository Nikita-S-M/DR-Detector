
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  
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
                  image: AssetImage("images/kle.png"),
                  fit: BoxFit.contain,
                 ),

                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: new Container(
                  child: ListTile(
                    title: new Text(
                                'KLE TECHNOLOGICAL UNIVERSITY',
                                style: new TextStyle(
                                    fontFamily: "SF UI Display",
                                    fontSize: 20.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),

                                    textAlign: TextAlign.center,
                              ),
                    subtitle: Text(
                                '\n Capstone Project',
                                 
                                style: 
                                TextStyle(
                                    fontFamily: "SF UI Display",
                                    fontSize: 18.sp,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400
                                    ),
                                textAlign: TextAlign.center,
                                
                                 ),

                    
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

