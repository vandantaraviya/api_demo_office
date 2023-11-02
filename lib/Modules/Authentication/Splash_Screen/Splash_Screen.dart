import 'dart:async';
import 'package:api_demo_office/Routes/Routes.dart';
import 'package:api_demo_office/Services/Pref_Service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utils/Common/pref_res.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  feacthvalue(){
    String tokanvalue = PrefService.getString(PrefRes.token);
    Timer(
      const Duration(seconds: 3),
       () {
         if(tokanvalue.isEmpty){
           Get.offAllNamed(Routes.logIn);
         }else{
           Get.offAllNamed(Routes.homeScreen);
         }
       },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    feacthvalue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FlutterLogo(
              duration: Duration(milliseconds: 750),
              curve: Curves.fastOutSlowIn,
              style: FlutterLogoStyle.markOnly,
              size: 350,
            )
          ],
        ),
      ),
    );
  }
}
