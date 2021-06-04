import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tflite/tflite.dart';




class ImageP extends StatefulWidget {
  @override
  _ImagePState createState() => _ImagePState();
}

class _ImagePState extends State<ImageP> {
  List _outputs;
  File _image;
  bool _loading = false;
  final imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/lable.txt",
      numThreads: 1,
    );
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0, 
        imageStd: 255.0, 
        numResults: 2, 
        threshold: 0.2, 
        asynch: true
        );
    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  pickImage() async {
    var image = await imagePicker.getImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      
      body: Center(
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _loading ? Container(
              padding: EdgeInsets.all(10.w),
              width: 0.6.sw,
              height: 0.7.sh,
            ):
            Center(
              child: Text(
              "Select image from gallery",
              style: TextStyle(fontSize: 20.sp),
              ),
             ),

            Container(
              
              margin: EdgeInsets.all(20.w),
              width: MediaQuery.of(context).size.width,
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                

                children: <Widget>[
                  _image == null ? Text("No image selected") : Image.file(_image),
                  SizedBox(
                    height: 10.h,
                  ),
                  _image == null ? Text("") : _outputs != null ? 
                  Text("Result : "+_outputs[0]["label"],style: TextStyle(color: Colors.indigoAccent.shade700,fontSize: 20.sp),
                  ) : Container(child: Text("Getting result......"))
                ],
              ), 
              

            
            

            ),
            
            

          
           Padding
           (
                padding: const EdgeInsets.all(12.0),
                child: new Container(
                child: FloatingActionButton(
                onPressed: pickImage,
                tooltip: "Pick Image",
                child: Icon(Icons.photo_filter ),
                  ),
                ),
           ),

            
 
          ],
        ),
        ),
      ),
    );
  }

}


