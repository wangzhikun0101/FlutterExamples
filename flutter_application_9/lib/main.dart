import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "find ladies",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("get lady phone number"),
      ),
      body: RootButton(),
    );
  }
}

class RootButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        onPressed: () {
          _navigetLady(context);
        },
        child: Text(
          "Send Phone number!",
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontSize: 18.0, color: Colors.cyan, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _navigetLady(BuildContext context) async {
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return new BeautyLady();
    }));
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("$result")));
  }
}

class BeautyLady extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("oho ,u are here"),
      ),
      body: Container(
        decoration: new BoxDecoration(
            border: new Border.all(color: Color(0xFFFF0000), width: 0.5)),
        margin: EdgeInsets.fromLTRB(10.0, 10.00, 10, 10),
        child: Center(
          child: Column(
            children: [
              RaisedButton(
                child: Text(
                  "lady one",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                clipBehavior: Clip.hardEdge,
                onPressed: () {
                  Navigator.pop(
                    context,
                    Text(
                      "lady one:phone 18856453211",
                      // style: TextStyle(
                      //   fontSize: 12.0,
                      //   fontWeight: FontWeight.bold,
                      //   color: Colors.cyan,
                      // )
                    ),
                  );
                },
              ),
              RaisedButton(
                child: Text("lady two"),
                onPressed: () {
                  Navigator.pop(
                    context,
                    Text(
                      "lady one:phone 18855645342",
                      // style: TextStyle(
                      //   fontFamily: 'Schyler',
                      //   fontSize: 14.0,
                      //   fontWeight: FontWeight.w500,
                      // )
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
