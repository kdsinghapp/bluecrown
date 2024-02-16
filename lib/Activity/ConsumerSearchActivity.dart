import 'package:bluecrown/Apis/api_models/get_response_getfriends_model.dart';
import 'package:bluecrown/Controller/ConsumerController.dart';
import 'package:bluecrown/Controller/ConsumerSearchController.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../Tool/Color.dart';
import '../common/CommonWidget.dart';
import '../constant/iconsconstants.dart';
import '../constant/imageconstants.dart';

class ConsumerSearchActivity extends StatefulWidget{
  const ConsumerSearchActivity({super.key});

  @override
  State<ConsumerSearchActivity> createState() =>_ConsumerSearchState();
}
class _ConsumerSearchState extends State<ConsumerSearchActivity>{
  ConsumerSearchController controller=Get.put(ConsumerSearchController());
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: primary3Color,
        appBar: AppBar(
          backgroundColor: primary3Color,
          elevation: 0.px,
          leading: SizedBox(
            height: 40.px,
            width: 40.px,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.px))
                ),
                color: editTextButton,
                margin: EdgeInsets.all(10.px),
                child: Padding(
                  padding:  EdgeInsets.only(left: 3.px),
                  child: IconButton(onPressed: (){
                    Get.back();
                  },
                      icon: const Icon(Icons.arrow_back_ios,size: 20,color: textColor,)
                  ),
                )
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.px, top: 10.px, bottom: 10.px),
              child: GestureDetector(
                  onTap: () {
                    controller.openAddVipUser();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Add Vip User ",style: MyTextStyle.titleStyle12b,),
                      const Icon(Icons.person_add_alt_1,size: 25,color: primaryColor,),
                    ],
                  )
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
            padding:  EdgeInsets.only(left: 20.px,right: 20.px,bottom: 10.px),
            child:
            Obx(() => controller.showLoading.value?
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.all(10.px),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.px)),
                  color: primaryColor
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                      height:30,width:30,
                      child:CircularProgressIndicator(color:primary3Color,)
                  ),
                  const SizedBox(width: 10,),
                  Text("Loading...",style: MyTextStyle.titleStyle16bw,),

                ],
              ),
            ):SizedBox(height: 5.px,)
            )
        ),
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child:Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.px),
                ),
                semanticContainer: true,
                clipBehavior: Clip.none,
                elevation: 0.px,
                color: cartColor,
                margin: EdgeInsets.all(10.px),
                child: GestureDetector(
                  onTap: () {
                    //controller.openConsumerSearchActivity();
                  },
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'FontBold',
                    ),
                    controller: controller.searchController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0.px, horizontal: 10.0.px),
                      hintText:'Search Consumer',
                      hintStyle: MyTextStyle.titleStyle16b,
                      prefixIcon: IconButton(
                        icon: Icon(
                          Icons.search_rounded, color: primaryColor, size: 25.px,),
                        onPressed: () {
                          //controller.changeSearchUsersProgressbar(true);
                          //controller.searchUserByName(controller.searchController.text);
                        },
                      ),

                    ),
                    onChanged: (text) {
                      controller.changeFilterUsersList(controller.searchController.text);
                    },

                  ),
                ),
              ),

            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:showFriendsList() ,
              ),
            ),

          ],
        )

    );
  }

  /// Show Friends List...
  Widget showFriendsList() {
    return GetBuilder<ConsumerSearchController>(builder: (context) {
      return
        Obx(() =>
        controller.showFriendsProgressBar.value ?
        Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            enabled: controller.showFriendsProgressBar.value,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 80.px,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        left: 10.px, right: 10.px, top: 10.px, bottom: 0.px),
                    decoration: BoxDecoration(
                      // color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(10.px))
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            height: 60.px, width: 60.px,
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30.px)),
                                color: textColor
                            ),
                          ),
                          //horizontalTitleGap: 5.0,
                          title: Container(
                            height: 15.px, width: 80.px,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5.px)),
                                color: textColor
                            ),
                          ),
                          subtitle: Container(
                            height: 15.px, width: 60.px,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5.px)),
                                color: textColor
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
            )
        ) :
        ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: controller.filterUsersList.length,
          itemBuilder: (context, int index) {
            GetFriendsResult item=controller.filterUsersList[index];
            return GestureDetector(
              onTap: () {
                openAlertBox(context,item);
              },
              child: Container(
                  height: 60.px,
                  //width: double.infinity,
                  margin: EdgeInsets.all(10.px),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ListTile(
                    leading: SizedBox(
                      height: 50.px, width: 50.px,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(25.px)),
                        child: Image.asset(ImageConstants.boyImg, fit: BoxFit.cover,),
                      ),
                    ),
                    title: Text(item.fullName!,
                      style: MyTextStyle.titleStyle16bb,),
                    subtitle: Text(item.dob!, style: MyTextStyle.titleStyle12blb,),
                    trailing: item.hostMember=='vip'?const Icon(Icons.star,size: 15,color: greenColor,):
                        SizedBox(height: 5.px,width: 5.px,)
                  )
              ),
            );
          },
        )
        );
    });
  }

  /// Show Alert Box...
  void openAlertBox(BuildContext context,GetFriendsResult model){
    showDialog(
      context: context,
      builder: (ctx)=>AlertDialog(
        title:  Center(child: Text("Costumer Register",style: MyTextStyle.titleStyle24bb,)),
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))
        ),
        content:  Container(
            height: 260.px,width: MediaQuery.of(context).size.width-60.px,
            padding: EdgeInsets.all(10.px),
            child:Column(
              children: [
                ListTile(
                  leading:Padding(
                    padding:  EdgeInsets.only(top: 3.px),
                    child: Text('Name :',style: MyTextStyle.titleStyle14b,),
                  ) ,
                  title:Text(model.fullName!,style: MyTextStyle.titleStyle14bb,) ,
                  horizontalTitleGap: 1.px,
                ),
                ListTile(
                  leading:Padding(
                    padding:  EdgeInsets.only(top: 3.px),
                    child: Text('Address :',style: MyTextStyle.titleStyle14b,),
                  ) ,
                  title:Text(model.address!,style: MyTextStyle.titleStyle14bb,) ,
                  horizontalTitleGap: 1.px,
                ),
                ListTile(
                  leading:Padding(
                    padding:  EdgeInsets.only(top: 3.px),
                    child: Text('Email :',style: MyTextStyle.titleStyle14b,),
                  ) ,
                  title:Text(model.email!,style: MyTextStyle.titleStyle14bb,) ,
                  horizontalTitleGap: 1.px,
                ),
                ListTile(
                  leading:Padding(
                    padding:  EdgeInsets.only(top: 3.px),
                    child: Text('Status :',style: MyTextStyle.titleStyle14b,),
                  ) ,
                  title:Text(model.status!,style: MyTextStyle.titleStyle14bb,) ,
                  horizontalTitleGap: 1.px,
                ),
              ],
            )
        ),
        alignment: Alignment.center,

        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10.px),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonWidget.commonElevatedButton(
                    onPressed: ()async {
                      Get.back();
                       controller.changeShowLoadingProgressBar(true);
                       controller.callingSubmitAddContomerForm(model.id!,);
                    },
                    text: StringConstants.customerRegister,
                    wantContentSizeButton: true,
                    width: 120.px,
                    height: 50.px,
                    borderRadius: 25.px,
                    buttonColor: Colors.green
                ),
                CommonWidget.commonElevatedButton(
                    onPressed: (){
                      Get.back();
                    },
                    text: StringConstants.reject,
                    wantContentSizeButton: true,
                    width: 120.px,
                    height: 50.px,
                    borderRadius: 25.px,
                    buttonColor: Colors.redAccent
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

}