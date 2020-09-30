import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            getCapturedImage(),
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

  Widget getCapturedImage(){
    return Container(height: 400.0);
  }

  Widget getButtons(){
    return Row(children: <Widget>[
      Expanded(
        child: RaisedButton(
          child: Text('Capture'),
          textColor: Colors.white,
          color: Color(0xFF43464B),
          onPressed: (){
            //define camera image capture method here
          }
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