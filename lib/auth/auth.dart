import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/home/home.dart';
import 'package:todo/screens/login/login.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            // إذا كان المستخدم مسجلاً الدخول، انتقل إلى شاشة الرئيسية
            return const Home();
          } else {
            // إذا لم يكن المستخدم مسجلاً الدخول، انتقل إلى شاشة تسجيل الدخول
            return const Login();
          }
        },
      ),
    );
  }
}