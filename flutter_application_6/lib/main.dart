import 'package:flutter/material.dart';
import 'dart:convert';
import 'getData.dart';
import 'AndroidBeat.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String text = "Flutter Demo 6";
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo 6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Center(
        child: ParentWidget(),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  @override
  Widget build(BuildContext context) {
    //调用方法
    //返回
    getNetdata();
    return Scaffold(
      body: Center(
        child: Text(MyApp.text),
      ),
    );
  }

  //编写方法
  getNetdata() async {
    var url = 'http://172.31.11.50:9095/hc/it';
    NetUtils.get(url, (data) {
      //判断是否为空
      if (data == null) {
      } else {
        setState(() {
          MyApp.text = data;
          if (MyApp.text.trim() == '') {
            MyApp.text = '拉取测试服务器上的接口失败';
          }
        });
      }
    }, errorCallback: (e) {
      MyApp.text = "$e";
    });
  }
}
