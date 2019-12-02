import 'package:flutter/material.dart';
import '../Login/Login.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
          elevation: 0,
        ),
        body: Container(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return Login();
              }));
            },
            child: Container(
              height: 50,
              color: Colors.blue,
              child: Text('跳转登录页'),
            ),
          ),
        ));
  }
}
