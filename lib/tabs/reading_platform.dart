import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ReadingPlatform extends StatefulWidget {
  @override
  ReadingPlatformState createState() {
    return new ReadingPlatformState();
  }
}

class ReadingPlatformState extends State<ReadingPlatform>{
  var counter = 0;
  var key = "counter";
  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  //加载sp里的存储的值
  _loadSavedData() async {
    // Get shared preference instance
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Get value
      counter = (prefs.getInt(key) ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
    );
  }
}
