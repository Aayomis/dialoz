import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dialoz/pages/signup_page.dart';
import 'package:dialoz/pages/work_page.dart';
import 'package:dialoz/pages/forgot_password.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:dialoz/pages/auth_controller.dart';
class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 120,),
                  Text('Login',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff5B67CA)
                    ),),
                  SizedBox(height: 70,),
                  TextFormField(
                    controller: emailController,
                    autofocus: true,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_outlined,color: Color(0xffA4A4A6),),
                      hintText: 'Email ID or Username',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Color(0xffC6CEDD),
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty ||!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)){
                        return 'Enter Correct Email ID or Username';
                      }else if(value!.isEmpty||!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value!)){
                        return 'Enter Correct Email ID or Username';
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    controller:passwordController,
                    autofocus: true,
                    obscureText: _obscureText,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded,color: Color(0xffA4A4A6),),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Color(0xffC6CEDD),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty ||!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value!)){
                        return 'Enter correct Password';
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(child: Container(),),
                      GestureDetector(
                        onTap: (){Get.to(()=>passwordPage());},
                        child: Text('Forgot Password?',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff5B67CA)
                        ),
                      )
                        ,)
                    ],
                  ),
                  SizedBox(height: 50,),
                  GestureDetector(
                    onTap: () {
                      AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
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
                          child: Text('Login',
                            style: TextStyle(
                                color: Color(0xffFAFAFA),
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),
                          ),)
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    height: 17,
                    width: 350,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Expanded(child: Divider(
                            thickness: 1,
                            indent: 0,
                            endIndent: 15,
                            height: 3,
                            color: Color(0xffE3E8F1),
                          )),
                          Text(' or with ',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xffC6CEDD)
                            ),
                          ),
                          Expanded(child: Divider(
                              thickness: 1,
                              height: 3,
                              indent: 15,
                              endIndent: 0,
                              color: Color(0xffE3E8F1)
                          )),
                        ]
                    ),
                  ),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffE3E8F1),width: 1),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(image: AssetImage('images/google.png'))
                        ),
                      ),
                      SizedBox(width: 15,),
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffE3E8F1),width: 1),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(image: AssetImage('images/fb.png'),)
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 120,),
                  GestureDetector(
                      onTap: (){Get.to(()=>SignupPage());},
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account? ',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff2C406E)
                            ),
                          ),
                          Text('Sign Up',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff2C406E)
                            ),
                          )
                        ],
                      ))

                ],
              )),
        ),
      ),
    );
  }
}
