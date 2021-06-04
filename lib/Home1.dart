import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class Home1 extends StatefulWidget {
  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> 
{
  

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
                  image: AssetImage("images/start.jpg"),
                  fit: BoxFit.contain,
                 ),

                ),
              ),
              
              Padding(
                child: new Container(
                  child: new Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new ListTile(
                              leading: new Icon(Icons.phone_iphone,
                                  color: Colors.blue, size: 30),
                              title: new Text(
                                'DR Detector',
                                style: new TextStyle(
                                    fontFamily: "SF UI Display",
                                    fontSize: 18.sp,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w700),
                              ),
                              subtitle: Text(
                                '\nThe scope of this study is to detect the stage of DR in patients easily and early as possible with a mobile phone camera and a convolutional neural network that is trained with different images of DR using deep learning and image processing.',
                                 
                                style: 
                                TextStyle(
                                    fontFamily: "SF UI Display",
                                    fontSize: 14.sp,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400
                                    ),
                                textAlign: TextAlign.justify,
                                
                                 ),
                            ),
                          ]),
                    ),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                ),
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
              ),
              Padding(
                child: new Container(
                  child: new Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new ListTile(
                              leading: new Icon(Icons.remove_red_eye,
                                  color: Colors.blue, size: 30),
                              title: new Text(
                                'Diabetic Retinopathy',
                                style: new TextStyle(
                                    fontFamily: "SF UI Display",
                                    fontSize: 16.sp,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w700),
                              ),
                              subtitle: Text(
                                '\nIt has been proven by specialists that with the progression of diabetes, it causes various complications in the human body. The most prominent of these complications happens in the eyes. Because of diabetes, veins in retina become damaged and starts to leak or swollen. This results in blurry vision or even blindness.',
                                style: TextStyle(
                                    fontFamily: "SF UI Display",
                                    fontSize: 14.sp,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.justify,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                ),
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
              ),
            ],
          ),
        ),
      )),
      
    )
    );
    
  }
  
}
  