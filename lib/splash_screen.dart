import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_role_app/home_screen.dart';
import 'package:multi_role_app/login_screen.dart';
import 'package:multi_role_app/student_screen.dart';
import 'package:multi_role_app/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';

    if (isLogin) {
      if (userType == 'student') {
        Timer(Duration(seconds: 2), () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentScreen()));
        });
      } else if (userType == 'teacher') {
        Timer(Duration(seconds: 2), () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TeacherScreen()));
        });
      } else {
        Timer(Duration(seconds: 2), () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TeacherScreen()));
        });
      }
    } else {
      Timer(Duration(seconds: 2), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Image(
          height: double.infinity,
          fit: BoxFit.fitHeight,
          image: NetworkImage(
              'https://images.pexels.com/photos/1400172/pexels-photo-1400172.jpeg?auto=compress&cs=tinysrgb&w=800')),
    );
  }
}
