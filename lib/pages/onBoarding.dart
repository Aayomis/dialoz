import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dialoz/pages/login_pg.dart';
import 'package:dialoz/pages/work_page.dart';
import 'package:dialoz/pages/signup_page.dart';
import 'package:get/get.dart';
import 'package:dialoz/pages/auth_controller.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 140),
              height: 294,
              width: 291,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/photo.png"),
                      fit: BoxFit.cover
                  )

              ),
            ),
          ),
          SizedBox(height: 75,),
         Text.rich(TextSpan(text: 'Dailoz',
           style: TextStyle(
             fontSize: 32,
             fontWeight: FontWeight.bold,
             color: Color(0xff5B67CA)
           ),
           children: [
             TextSpan(
               text: '.',
               style: TextStyle(
                 fontSize: 32,
                 color: Color(0xffFD7694),
                 fontWeight: FontWeight.bold
               )
             )
           ]
         )),
          SizedBox(height:30,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Plan what you will do to be more organised for today,',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff2C406E)
                ),
              ),
              Text('tomorrow and beyong',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff2C406E)
                ),
              )
            ],
          ),
          SizedBox(height: 70,),
          Column(
            children: [
              GestureDetector(
                onTap: (){Get.to(()=>loginPage());},
    child:Container(
                height: 52,
                width: 310,
                decoration: BoxDecoration(
                  color: Color(0xff5B67CA),
                  borderRadius: BorderRadius.circular(14)
                ),
                child: Center(
                  child: Text('Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),),
              SizedBox(height: 30,),
              GestureDetector(
                  onTap: (){Get.to(()=>SignupPage());},
              child:Text('Sign Up',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff5B67CA)
                ),
              ))
            ],
          )

        ],
      )
    );
  }
}
