import 'dart:convert';
import 'package:api_demo_office/Model/Userdata_Model.dart';
import 'package:api_demo_office/Services/Pref_Service.dart';
import 'package:api_demo_office/Utils/Common/AppString.dart';
import 'package:api_demo_office/Utils/Common/pref_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Routes/routes.dart';


class AuthenticationController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailSignupController = TextEditingController();
  TextEditingController passwordSignupcontroller = TextEditingController();
  bool isempty = false;
  RxBool isLoading =false.obs;
  RxBool loading =false.obs;

  void login() async {
    if (validatorLogIn()) {
      try {
        loading.value = true;
        var response = await http.post(
            Uri.parse('http://192.168.29.68:3000/auth/login'),
            headers: {
              'Content-Type': 'application/json'
            },
            body: jsonEncode({
              'email': email.text.toString(),
              'password': password.text.toString(),
            }));
        print(response);
        var data = jsonDecode(response.body.toString());
        print(data['token']);

        if (response.statusCode == 200) {
          var userdata = UserModel.fromJson(data);
          print(data['token']);
          print(data);
          PrefService.setvalue(PrefRes.token, userdata.token);
          Get.offAllNamed(Routes.homeScreen);
          email.clear();
          password.clear();
          Get.snackbar(AppString.logInsuccessfull, data['message'],);
        } else {
          Get.snackbar(
            AppString.logInfailed,
            data['message'],
          );
        }
      } catch (e) {
        print(e.toString());
      } finally {
        loading.value = false;
      }
    }
  }


  void signUp() async {
    if(validatorSignUp()){
      try {
        isLoading.value = true;
        var response = await http.post(
            Uri.parse('http://192.168.29.68:3000/auth/signup'),
            headers: {
              'Content-Type': 'application/json'
            },
            body: json.encode({
              'name': nameController.text,
              'email': emailSignupController.text,
              'password': passwordSignupcontroller.text,
            }));
        print(response.toString());
        var data = jsonDecode(response.body.toString());

        if (response.statusCode == 200) {
          UserModel userModel  = UserModel.fromJson(jsonDecode(response.body));
          print(userModel);
          PrefService.setvalue(PrefRes.token, userModel.token);
          print(userModel.token);
          Get.offAllNamed(Routes.homeScreen);
          nameController.clear();
          emailSignupController.clear();
          passwordSignupcontroller.clear();
          Get.snackbar(AppString.signUpsuccessfull, data['message'],);
        }else {
          Get.snackbar(AppString.signUpfailed, data['message'],);
        }
      } catch (e) {
        print(e.toString());
        rethrow;
      }finally{
        isLoading.value = false;
      }
      update();
    }
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAllNamed(Routes.logIn);
    Get.snackbar(AppString.logoutuser, AppString.userlogout,);
  }


  validatorSignUp() {
    Get.closeAllSnackbars();
    if (nameController.text.isEmpty) {
      Get.snackbar(AppString.error, AppString.name,);
      return false;
    } else if (emailSignupController.text.isEmpty) {
      Get.snackbar(AppString.error, AppString.email,);
      return false;
    } else if(!GetUtils.isEmail(emailSignupController.text)){
      Get.snackbar(AppString.error, AppString.vaildemail,);
      return false;
    }else if(passwordSignupcontroller.text.isEmpty){
      Get.snackbar(AppString.error, AppString.vaildpassword,);
      return false;
    } else if(passwordSignupcontroller.text.length < 10){
      Get.snackbar(AppString.error, AppString.vaildpasswrodlength,);
      return false;
    }
    return true;
  }


validatorLogIn() {
    Get.closeAllSnackbars();
  if (email.text.isEmpty) {
    Get.snackbar(AppString.error,  AppString.email,);
    return false;
  } else if(!GetUtils.isEmail(email.text)){
    Get.snackbar(AppString.error,AppString.vaildemail,);
    return false;
  }else if(password.text.isEmpty){
    Get.snackbar(AppString.error, AppString.vaildpassword,);
    return false;
  } else if(password.text.length < 10){
    Get.snackbar(AppString.error, AppString.vaildpasswrodlength,);
    return false;
  }
  return true;
}
}