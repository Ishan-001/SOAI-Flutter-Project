
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(){

  runApp(MaterialApp(
    title: 'Ingredient Detection App',
    theme: ThemeData(
      primaryColor: Color(0xFF43464B)
    ),
    home: Home(),
  ));
}

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{


  PickedFile _image;
  final picker=ImagePicker();

  Future getImage() async{
    final pickedFile=await picker.getImage(source: ImageSource.camera);

    setState(() {
      if(pickedFile!=null){
        _image=PickedFile(pickedFile.path);
      }
      else{
        Fluttertoast.showToast(
            msg: "No image selected",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey[800],
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingredient Detection App')
      ),
      body: Container(
        color: Colors.grey,
        child: Column(
          children: <Widget>[
            getImageAsset(),
            _image==null?Container(height: 400.0,width: 400.0):Image.file(File(_image.path),height: 400.0,width: 1500.0),
            getButtons()
          ],
        ),
      ),
    );
  }

  Widget getImageAsset(){
    AssetImage assetImage=AssetImage('images/home_image.png');
    Image image=Image(image: assetImage);

    return Container(child: image);
  }

  // Widget getCapturedImage(){
  // }

  Widget getButtons(){
    return Row(children: <Widget>[
      Expanded(
        child: RaisedButton(
          child: Text('Capture'),
          textColor: Colors.white,
          color: Color(0xFF43464B),
          onPressed: getImage,
        ),
      ),
      Expanded(
        child: RaisedButton(
          child: Text('Detect'),
          textColor: Colors.white,
          color: Color(0xFF43464B),
          onPressed: (){
            //define fetch results method here
          },
        ),
      )
    ]);
  }

}