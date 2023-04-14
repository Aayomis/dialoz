import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dialoz/pages/login_pg.dart';
import 'package:get/get.dart';
import 'package:dialoz/pages/auth_controller.dart';
import 'package:dialoz/pages/signup_page.dart';
class WorkPage extends StatelessWidget {
  String email;
   WorkPage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 150,),
            Text('Welcome Page'),
            SizedBox(height: 10,),
            Text(email,style: TextStyle(
                fontSize: 16,
                color: Color(0xff5B67CA)
            ),),
            SizedBox(height: 400,),
            Center(child:GestureDetector(
              onTap: () {
                AuthController.instance.logOut();
              },
              child: Container(
                  height: 52,
                  width: 350,
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
                    child: Text('Sign Out',
                      style: TextStyle(
                          color: Color(0xffFAFAFA),
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),
                    ),)
              ),
            ), )
          ],
        )
    );
  }
}


