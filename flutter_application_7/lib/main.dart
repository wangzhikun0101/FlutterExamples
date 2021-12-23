import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(new MaterialApp(
    title: 'abc',
    debugShowCheckedModeBanner: true,
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: new Center(
        child: RaisedButton(
          child: Text('Check Detail'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => secondScreen()));
          },
        ),
      ),
    );
  }
}

class secondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Seconde Page'),
      ),
      body: new Center(
        child: RaisedButton(
          child: Text('Return Third page'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return new ThirdScreen();
            }));
            // Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(),
      body: new ListView(
        children: [
          Text("第三屏幕"),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return new secondScreen();
              // })
              // );
            },
            child: Text("返回第第二屏幕"),
          ),
          RaisedButton(
            onPressed: () {
              //Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return new MyApp();
              }));
            },
            child: Text("Return Home"),
          ),
        ],
      ),
    );
  }
}

// class SampleApp extends StatelessWidget {
// @override
//   Widget build(BuildContext context) {
//  Column  buildButtonColum(IconData icon, String label){
//       Color color = Theme.of(context).primaryColor;
//        return  new Column(
//          mainAxisSize: MainAxisSize.min,
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            new Icon(icon, color: color,),
//            new Container(
//              margin: const EdgeInsets.only(top: 8.0),
//              child: new Text(
//                label,
//                style: new TextStyle(
//                  fontSize: 12.0,
//                  fontWeight: FontWeight.w400,
//                  color: color,
//                ),
//              ),
//            ),
//          ],
//        );
//     }
//   }
// }
