import 'package:flutter/material.dart';

var themeColor = Color.fromRGBO(37, 102, 177, 1);
class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  int _loginType = 0; //0 免密登录 1 密码登录
  String _phone = '';
  bool _isShow = false; //密码是否可见
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        width: 16.0,
                        height: 16.0,
                        alignment: Alignment.center,
                        child: Image.asset("assets/icon/arrow-left-black.png"),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          this._loginType = _loginType == 0 ? 1 : 0;
                        });
                      },
                      child: Text(
                        this._loginType == 0 ? '密码登录' : '免密登录',
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: ListTile(
                      title: Text(this._loginType == 0 ? '手机免密登录' : '密码登录',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20.0,
                            height: 30,
                          )),
                      subtitle: Text('欢迎登录',
                          style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                    )),
                Container(
                  child: TextField(
                    onChanged: (v) {
                      setState(() {
                        this._phone = v;
                      });
                    },
                    obscureText: this._isShow,
                    decoration: InputDecoration(
                        icon: InkWell(
                      child: Container(
                        width: 20,
                        height: 20,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              this._isShow = !this._isShow;
                            });
                          },
                          child: Image.asset(this._isShow
                              ? "assets/icon/eye-close.png"
                              : "assets/icon/eye-open.png"),
                        ),
                      ),
                    ),
                    labelText: '请输入手机号码'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 50.0,),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(25.0),
                        color: themeColor,
                      ),
                      padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
                      alignment: Alignment.center,
                      child: Text('获取验证码'),

                    ),
                    SizedBox(width: 50,)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
