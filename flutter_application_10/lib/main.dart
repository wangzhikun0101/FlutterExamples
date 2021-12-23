import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(new MaterialApp(
    title: 'theme Title',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      backgroundColor: Colors.blueGrey,
    ),
    // debugShowMaterialGrid: false,
    home: DemoApp(),
    routes: {
      '/first': (BuildContext context) => new FirstPage(),
      '/second': (BuildContext context) => new SecondPage(""),
    },
    initialRoute: '/first', //初始化路由为first页面
  ));
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.red,
      appBar: new AppBar(
        leading: Icon(Icons.menu),
        actions: <Widget>[Icon(Icons.search)],
        title: new Text('routes demo'),
      ),
      body: new Center(
        child: Column(
          children: [
            RaisedButton(
              child: new Text('主页,单机页面跳转'),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new FirstPage();
                }));
              },
            ),
            InkWell(
              child: RichText(
                  text: TextSpan(
                      text: 'hello RichText Click',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w800))),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new SecondPage('主页面参数传递Demo01');
                }));
              },
            ),
            Expanded(
                child: Image.asset(
              "img/1.jpg",
              fit: BoxFit.fill,
            )),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.cyan,
      appBar: new AppBar(
        title: new Text('First Page'),
      ),
      body: new Center(
        child: RaisedButton(
            child: new Text('第一个页面'),
            onPressed: () {
              //静态路由跳转，不给第二个页面传值
//              Navigator.pushNamed(context, '/second').then((value){
//                Fluttertoast.showToast(msg: value,toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.BOTTOM);
//              });
              //动态路由跳转，给第二个页面传值
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return new SecondPage('这是从第一个页面传递出去的数据');
              })).then((value) {
                // Fluttertoast.showToast(msg: value,toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.BOTTOM);
              });
            }),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  var content = '';
  SecondPage(this.content);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: new AppBar(
        title: new Text('Second Page'),
      ),
      body: new RaisedButton(
          child: new Text(content),
          onPressed: () {
//            Navigator.pop(context);//不给上一级页面返回参数
            Navigator.of(context).pop("这个是从第二个页面返回的数据"); //给上一级页面返回参数
          }),
    );
  }
}
