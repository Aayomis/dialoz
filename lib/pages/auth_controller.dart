import 'package:get/get.dart';
import 'package:dialoz/pages/onBoarding.dart';
import 'package:dialoz/pages/login_pg.dart';
import 'package:dialoz/pages/work_page.dart';
import 'package:dialoz/pages/forgot_password.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AuthController extends GetxController {
  static AuthController instance =Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    if (user==null){
      print('login Page');
      Get.offAll(()=>HomePage());
    }else{
      Get.offAll(()=>WorkPage(email:user.email!));
    }
  }

  void register(String username, email , password)async{
    try {
     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
     User user = userCredential.user!;
     await user.updateProfile(displayName: username);
     Get.snackbar('Success', 'You have been registered successfully!',
       duration: Duration(seconds: 5),
       snackPosition: SnackPosition.BOTTOM,
       backgroundColor: Colors.green,
       colorText: Colors.white,
     );

    } on FirebaseAuthException catch (e){
      if (e.code == 'weak-password'){
        Get.snackbar('Error', 'The password is too weak',
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }else if (e.code == 'email-already-in-use'){
        Get.snackbar('Error', 'The account already exist for that email.',
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }catch (e){
      Get.snackbar('Error', 'An error occured while registering, please try again later',
        duration: Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
  void login(String email , password)async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Success', 'You have been registered successfully!',
        duration: Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }catch(e){
      Get.snackbar('About Login', 'Login message',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text('Login Failed',
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(e.toString(),
            style: TextStyle(
                color: Colors.white
            ),)
      );
    }
  }
  void logOut()async{
    await auth.signOut();
  }
  Future passwordReset (String email) async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar('Success', 'Password reset link sent successfully to your email!',
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } on FirebaseAuthException catch (e){
      Get.snackbar('About Reset', 'Reset message',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text('Reset Failed',
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(e.toString(),
            style: TextStyle(
                color: Colors.white
            ),)
      );
    }
  }
}
