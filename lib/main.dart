import 'package:flutter/material.dart';
import 'package:flutter_app_demo/stateful_weight.dart';
import 'package:flutter_app_demo/stateless_weight.dart';
import 'package:flutter_app_demo/tabs/first.dart';
import 'package:flutter_app_demo/tabs/second.dart';
import 'package:flutter_app_demo/tabs/third.dart';

void main() {
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      // Home
      title: "",
      home: new MyHome()));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return new TabBar(
      tabs: <Tab>[
        new Tab(
          // set icon to the tab
          text: "功能设置",
//          icon: new Icon(Icons.favorite),
        ),
        new Tab(
          text: "使用说明",
        ),
        new Tab(
          text: "变态游戏",
        ),
      ],
      // setup the controller
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return new TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: controller,
    );
  }

  /*
   *-------------------- Setup the page by setting up tabs in the body ------------------*
   */
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // Appbar
        appBar: new AppBar(
          // Title
          title: new Text("自动阅读会员版"),
          centerTitle: true,
          actions: <Widget>[
//------------------------------------------------------------------------------------------------------------
//              解决snackbar不弹出问题
            Builder(
              builder: (context) => IconButton(
                    icon: Icon(Icons.add_comment),
                    onPressed: () {
//                        print("点击消息");
//                        Scaffold.of(context).showSnackBar(
//                            new SnackBar(content: new Text("点击消息")));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Stateful()));
                    },
                  ),
            ),
            Builder(
              builder: (context) => IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
//                        print("点击设置");
//                        Scaffold.of(context).showSnackBar(
//                            new SnackBar(content: new Text("点击设置")));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Stateless()));
                    },
                  ),
            ),
//-------------------------------------------------------------------------------------------------------------
          ],
          // Set the background color of the App Bar
          backgroundColor: Colors.blue,
          // Set the bottom property of the Appbar to include a Tab Bar
          bottom: getTabBar(),
        ),
        // Set the TabBar view as the body of the Scaffold
        body: getTabBarView(<Widget>[new First(), new Second(), new Third()]));
  }
}
