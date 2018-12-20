import 'package:flutter/material.dart';
import 'package:flutter_app_demo/tabs/second.dart';
import 'package:flutter_app_demo/tabs/third.dart';

class First extends StatefulWidget {
  @override
  FirstState createState() => new FirstState();
}

// SingleTickerProviderStateMixin is used for animation
class FirstState extends State<First> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    controller = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return new TabBar(
      labelColor: Colors.black,
      indicatorColor: Colors.black,
      unselectedLabelColor: Colors.white,
      tabs: <Tab>[
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
    final List<Tab> myTabs = <Tab>[
      new Tab(text: "要阅读的平台"),
      new Tab(text: "参数配置"),
    ];
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          title: new TabBar(
            controller: controller,
            tabs: myTabs,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
          ),
        ),
        // Set the TabBar view as the body of the Scaffold
        body: getTabBarView(<Widget>[new Second(), new Third()]));
  }
}
