import 'package:flutter/material.dart';
import './Course.dart';
import './HomePage.dart';
import './Message.dart';
import './MyCenter.dart';
import '../Login/Login.dart';

class TabsIcon extends StatelessWidget {
  final String imgUrl;
  TabsIcon(this.imgUrl);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.0,
      width: 24.0,
      child: Image.asset(imgUrl),
    );
  }
}

class Tabs extends StatefulWidget {
  final int currenIndex;
  Tabs({Key key, this.currenIndex = 0}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _TabsState(currentIndex: currenIndex);
  }
}

class _TabsState extends State<Tabs> {
  var pages = [
    HomePage(),
    Course(),
    Message(),
    MyCenter(),
  ];
  int _currentIndex;
  _changeIndex(v) {
    setState(() {
      _currentIndex = v;
    });
  }

  _TabsState({int currentIndex = 0}){
    this._currentIndex = currentIndex;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: this._changeIndex,
        currentIndex: this._currentIndex,
        unselectedLabelStyle: TextStyle(color: Colors.black54, fontSize: 12.0),
        selectedLabelStyle:
            TextStyle(color: Color.fromRGBO(32, 102, 177, 1.0), fontSize: 12.0),
        type: BottomNavigationBarType.fixed,
        iconSize: 24.0,
        items: [
          BottomNavigationBarItem(
            title: Text('首页'),
            icon: TabsIcon("assets/icon/home.png"),
            activeIcon: TabsIcon("assets/icon/home-active.png"),
          ),
          BottomNavigationBarItem(
            title: Text('课程'),
            icon: TabsIcon("assets/icon/book.png"),
            activeIcon: TabsIcon("assets/icon/book-active.png"),
          ),
          BottomNavigationBarItem(
            title: Text('通知'),
            icon: TabsIcon("assets/icon/message.png"),
            activeIcon: TabsIcon("assets/icon/message-active.png"),
          ),
          BottomNavigationBarItem(
            title: Text('我的'),
            icon: TabsIcon("assets/icon/myCenter.png"),
            activeIcon: TabsIcon("assets/icon/myCenter-active.png"),
          )
        ],
      ),
    );
  }
}
