import 'dart:convert';
import 'dart:math';
import 'package:api_demo_office/Model/PostAdd_Model.dart';
import 'package:api_demo_office/Services/Pref_Service.dart';
import 'package:api_demo_office/Utils/Common/AppString.dart';
import 'package:api_demo_office/Utils/Common/pref_res.dart';
import 'package:api_demo_office/Utils/Common_Widget/Custom_Textfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  var postList = <Data>[].obs;
  RxBool isLoading = false.obs;
  RxBool loading = false.obs;

  List<Color> backgroundColors = [
    const Color(0xFFCCE5FF), // light blue
    const Color(0xFFD7F9E9), // pale green
    const Color(0xFFFFF8E1), // pale yellow
    const Color(0xFFF5E6CC), // beige
    const Color(0xFFFFD6D6), // light pink
    const Color(0xFFE5E5E5), // light grey
    const Color(0xFFFFF0F0), // pale pink
    const Color(0xFFE6F9FF), // pale blue
    const Color(0xFFD4EDDA), // mint green
    const Color(0xFFFFF3CD), // pale orange
  ];

  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }



  Future<void> delete(String id) async {
    try{
       var token = PrefService.getString(PrefRes.token);
      print(token);
      var response = await http.delete(
        Uri.parse('http://192.168.29.68:3000/feed/deletePost/'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          "postId" : id,
        }
      );
     print(id);
      if (response.statusCode == 200) {
        return getData();
      }else{
        Get.snackbar(
          AppString.error,
          'failed data',
        );
      }
    }catch(e){
      print(e.toString());
      rethrow;
    }
  }

  getData() async {
    try {
      isLoading.value = true;
      var response = await http.get(
        Uri.parse('http://192.168.29.68:3000/feed/posts'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${PrefService.getString(PrefRes.token)}',
        },
      );
      PostModel postModel = PostModel.fromJson(jsonDecode(response.body));
      postList.value = postModel.posts!.data!;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  createPost() async {
   if(validatorHome()){
     try {
       loading.value = true;
       var response = await http.post(
         Uri.parse('http://192.168.29.68:3000/feed/createpost'),
         body: json.encode({
           'title': title.text,
           'subTitle': subtitle.text,
         }),
         headers: {
           'Content-Type': 'application/json',
           'Authorization': 'Bearer ${PrefService.getString(PrefRes.token)}',
         },
       );
       print(response.body);
       var data = jsonDecode(response.body.toString());

       if (response.statusCode == 200) {
         PostModel.fromJson(jsonDecode(response.body));
         Get.back();
         getData();
         title.clear();
         subtitle.clear();
         Get.snackbar(
           AppString.postsuccessfull,
           data['message'],
         );
       }else{
         Get.snackbar(
           AppString.error,
           data['message'],
         );
       }
     } catch (e) {
       print(e);
     } finally {
       loading.value = false;
     }
   }
  }

  validatorHome() {
    Get.closeAllSnackbars();
    if (title.text.isEmpty) {
      Get.snackbar(
        AppString.error,
        AppString.titlevaild,
      );
      return false;
    } else if (subtitle.text.isEmpty) {
      Get.snackbar(
        AppString.error,
       AppString.subtitlevaild,
      );
      return false;
    }
    return true;
  }


  Future<void> sheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      builder: (BuildContext context) {
        return Obx(
          () => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: 80.h,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    CustomTextField(
                      titleText: AppString.title,
                      textEditingController: title,
                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextField(
                      titleText: AppString.subtitle,
                      textEditingController: subtitle,
                      textInputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      width: 500,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          createPost();
                        },
                        child: (loading.value)
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(AppString.add),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
