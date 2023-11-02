import 'package:api_demo_office/Modules/Home_Screen/Home_Controller.dart';
import 'package:api_demo_office/Utils/Common_Widget/Custom_showDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../Utils/Common/AppString.dart';
import '../Authentication/Authentication_Controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController homeScreenController =
  Get.put(HomeScreenController());
  final AuthenticationController authenticationController =   Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(AppString.home),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => homeScreenController.sheet(context),
              icon: Icon(
                Icons.add,
                size: 25.sp,
              ),
            ),
            IconButton(
              onPressed: ()=> Get.dialog(
                  CustomshowDialog(
                    text: AppString.areyousurelogoutDesc,
                    canceltitle: AppString.cancel,
                    title: AppString.logout,
                    ontap: () {
                      authenticationController.logout();
                    }
                  ),
                ),
              icon: Icon(

                Icons.logout_outlined,
                size: 25.sp,
              ),
            ),
          ],
        ),
        body: Obx(() {
          return homeScreenController.isLoading.value ? const Center(child: CircularProgressIndicator()):
          ListView.builder(
              itemCount: homeScreenController.postList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  color: homeScreenController.getRandomColor(),
                  shadowColor: Colors.indigo,
                  elevation: 5,
                  child: ListTile(
                    leading: Text('${1 + index}'),
                    title: Text(
                        homeScreenController.postList[index].title!.toString()),
                    subtitle: Text(homeScreenController.postList[index].subTitle!
                        .toString()),
                    trailing: IconButton(
                        onPressed: ()=> Get.dialog(
                             CustomshowDialog(
                               text: AppString.deleteDesc,
                               canceltitle: AppString.cancel,
                               title: AppString.delete,
                               ontap: (){
                                 homeScreenController.delete(homeScreenController.postList[index].sId!.toString());
                               },
                             ),
                        ),
                        icon: const Icon(Icons.delete),
                    ),
                  ),
                );
              });
        }));
  }
}
