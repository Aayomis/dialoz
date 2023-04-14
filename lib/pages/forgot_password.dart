import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dialoz/pages/auth_controller.dart';
class passwordPage extends StatefulWidget {
  const passwordPage({Key? key}) : super(key: key);

  @override
  State<passwordPage> createState() => _passwordPageState();
}

class _passwordPageState extends State<passwordPage> {
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff5B67CA),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text('Enter your email to get reset link',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff5B67CA)),
                  borderRadius: BorderRadius.circular(12)
                ),
                hintText: 'Email ID',
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
          ),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: () {
              AuthController.instance.passwordReset(emailController.text.trim());
            },
            child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    color: Color(0xff5B67CA),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFFAFAFA),
                        offset: Offset(1, 1),
                        blurRadius: 20,
                        spreadRadius: 20,
                      ),]
                ),
                child: Center(
                  child: Text('Reset Password',
                    style: TextStyle(
                        color: Color(0xffFAFAFA),
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),)
            ),
          )
        ],
      ),
    );
  }
}
