import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dialoz/pages/login_page.dart';
import 'package:dialoz/pages/signup_page.dart';
import 'package:get/get.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _textController = TextEditingController();
  final _passwordController = TextEditingController();
  bool passwordVisible=false;
  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }
  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          height: h,
          width: w,
              child: Column(
                children: [
                  Container(
                    height: h,
                    child: Stack(
                      children: [
                        Positioned(
                            left:35,
                            top:130,
                            child: Text('Login',
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff5B67CA)
                              ),
                            )),
                        Positioned(
                          top: 250,
                          left: 35,
                          right: 35,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 13),
                            decoration: BoxDecoration(
                                border: Border(
                                    top:BorderSide.none ,
                                    bottom: BorderSide(width: 1.0, color: Color(0xffE3E8F1)),
                                    left: BorderSide.none,
                                    right: BorderSide.none
                                )
                            ),
                            child: Row(
                              children: [
                                Expanded(child: TextField(
                                  controller: _textController,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.mail_outline,color: Color(0xffA4A4A6),size: 24,),
                                    border: InputBorder.none,
                                    hintText: "Email ID or Username",
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffC6CEDD),
                                    ),
                                    contentPadding: EdgeInsets.only(left: 0),
                                    isDense: true,
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 330,
                          left: 35,
                          right: 35,
                          child:Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    top:BorderSide.none ,
                                    bottom: BorderSide(width: 1.0, color: Color(0xffE3E8F1)),
                                    left: BorderSide.none,
                                    right: BorderSide.none
                                )
                            ),
                            child: Row(
                              children: [
                                Expanded(child: TextField(
                                  controller: _passwordController,
                                  autocorrect: false,
                                  obscureText: passwordVisible,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  decoration:  InputDecoration(

                                    icon: Icon(Icons.lock_outline,color: Color(0xffA4A4A6),size: 24,),
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xffC6CEDD),
                                      ),
                                      contentPadding: EdgeInsets.only(top:15,left: 0),
                                      isDense: true,
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(
                                                    () {
                                                  passwordVisible = !passwordVisible;
                                                }
                                            );
                                          }
                                          , icon: Icon(
                                          passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Color(0xffA4A4A6)
                                      )),

                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ))
                              ],
                            ),
                          ),),
                        Positioned(
                            left: 255,
                            top: 390,
                            child: Text('Forgot Password?',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff5B67CA)
                              ),
                            )),
                        Positioned(
                            left: 35,
                            right: 35,
                            top: 460,
                            child: Container(
                                height: 52,
                                width: 304,
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
                            )),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 560,
                          child: Container(
                            height: 17,
                            width: 304,
                            child: Row(
                                children: const [
                                  Expanded(child: Divider(
                                    thickness: 1,
                                    indent: 40,
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
                                      endIndent: 40,
                                      color: Color(0xffE3E8F1)
                                  )),
                                ]
                            ),
                          ),),
                        Positioned(
                            left: 145,
                            right: 145,
                            top: 610,
                            child: Row(
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
                            )),
                        Positioned(
                            left: 90,
                            right: 80,
                            bottom: 50,
                            child:
                            GestureDetector(
                                onTap: (){

                                },
                                child:Row(
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
                        )
                      ],
                    ),
                  ),
                ],
              )),
        );
  }
}




