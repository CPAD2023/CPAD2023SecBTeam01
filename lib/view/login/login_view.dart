import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/button_tile.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/common_widget/round_textfield.dart';
import 'package:fitness/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../main_tab/main_tab_view.dart';

class LoginView extends StatefulWidget {
  
  final Function()? onTap;
  const LoginView({super.key, required this.onTap});
  

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isCheck = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void logUserIn() async {
    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text
        );
        Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      
      wrongCredentialsMessage(e.code);
      
    }


      
  }

  //wrong email message pop up
  void wrongCredentialsMessage(String message){
    showDialog(
      context: context,
      builder: (context){
        return  AlertDialog(
          backgroundColor: Color(0xff26a69a),
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color:Colors.white)

              )
          )
        );
      },
    );
  }
//  // wrong password message pop up
//   void wrongPasswordMessage(){
//     showDialog(
//       context: context,
//       builder: (context){
//         return const  AlertDialog(
//           title: Text('Incorrect Password')
//         );
//       },
//     );
//   }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height * 0.9,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: media.width * 0.02),
                Text(
                  "Hey there,",
                  style: TextStyle(color: TColor.gray, fontSize: 16),
                ),
                SizedBox(height: media.width * 0.02),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTextField(
                  controller: emailController,
                  hitText: "Email",
                  icon: "assets/img/email.png"
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTextField(
                  controller: passwordController,
                  hitText: "Password",
                  icon: "assets/img/lock.png",
                  obscureText: true,
                  
                ),
                SizedBox(height: media.width * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot your password?",
                      style: TextStyle(
                          color: TColor.gray,
                          fontSize: 10,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.03),
              //  const Spacer(),
                RoundButton(
                    title: "Login",
                    onPressed: logUserIn
                    // () async {
                    //   // await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) =>
                    //               const MainTabView()));
                    // }
                    ),
                    SizedBox(height: media.width * 0.02),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: media.width * 0.01),

                   // google sign in buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // google button
                        ButtonTile(
                          onTap: () => AuthService().signInWithGoogle(),
                          imagePath: "assets/img/google.png"),

                        

                        // apple button
                        // SquareTile(imagePath: 'lib/images/apple.png')
                        
                      ],
                    
                    ),
                    SizedBox(height: media.width * 0.01),

                    // not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Not a member?',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: widget.onTap,
                                child: const Text(
                                  'Register now',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )


                    
                ],
            ),
          ),
        ),
      ),
    );
  }
}
