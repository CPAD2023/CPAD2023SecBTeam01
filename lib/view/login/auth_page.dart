import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/view/login/login_or_register_page.dart';
import 'package:fitness/view/login/login_view.dart';
import 'package:fitness/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget{
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return const MainTabView();

          }
          else{
            return const LoginOrRegisterPage();
          }
        
        }
      )
    );
  }
}