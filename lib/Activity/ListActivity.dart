
import 'package:bluecrown/Apis/api_models/get_response_getfriends_model.dart';
import 'package:bluecrown/Controller/ListController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/common/ShowToast.dart';
import 'package:bluecrown/constant/imageconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../constant/iconsconstants.dart';

class ListActivity extends StatefulWidget {
  const ListActivity({super.key});

  @override
  State<ListActivity> createState() => _ListState();
}

class _ListState extends State<ListActivity> {
  ListController controller = Get.put(ListController());


  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.only(left: 3.px),
                child: IconButton(onPressed: () {
                  Get.back();
                },
                    icon: const Icon(
                      Icons.arrow_back_ios, size: 20, color: textColor,)
                ),
              )
          ),
        ), actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.px, top: 10.px, bottom: 10.px),
          child: GestureDetector(
              onTap: () {},
              child: Image.asset(IconsConstants.profileIcon, height: 35.px,
                width: 35.px,
                fit: BoxFit.fill,)
          ),
        ),
      ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.px))
              ),
              color: cartColor,
              margin: EdgeInsets.only(left: 20.px,right: 20.px,top: 2.px,bottom: 2.px),
              elevation: 0.px,
              child: SizedBox(
                height: 130.px,
                width: double.infinity,
                child: GestureDetector(
                  onTap: (){
                    if(controller.selectedUsers.isNotEmpty){
                      openSelectedAlertBox();
                    }else{
                      showToastMessage('Select friends first...');
                    }

                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(IconsConstants.addIcon, height: 50.px,
                        width: 50.px,
                        fit: BoxFit.fill,),
                      SizedBox(height: 10.px,),
                      Text(StringConstants.createList,
                        style: MyTextStyle.titleStyle12b,),
                    ],
                  ),
                ),
              )
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.px),
            ),
            semanticContainer: true,
            clipBehavior: Clip.none,
            elevation: 0.px,
            color: cartColor,
            margin:EdgeInsets.only(left: 20.px,right: 20.px,top: 5.px,bottom: 5.px),
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
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
                hintText: StringConstants.search,
                hintStyle: MyTextStyle.titleStyle16b,
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.search_rounded, color: primaryColor, size: 25,),
                  onPressed: () {
                    //controller.changeSearchUsersProgressbar(true);
                    //controller.searchUserByName(controller.searchController.text);
                  },
                ),
                suffixIcon: Container(
                  height: 20, width: 20,
                  padding: EdgeInsets.all(8.px),
                  child: InkWell(
                      onTap: () {
                        // _showBottomSheetFilter(context);
                      },
                      child: Image.asset(
                        IconsConstants.filterIcon, fit: BoxFit.cover,)),
                ),

              ),
              onChanged: (text) {
                controller.changeFilterUsersList(controller.searchController.text);
              },

            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.px,right: 20.px,top: 2.px,bottom: 2.px),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text('${controller.selectLength.value.toString()} Persons', style: MyTextStyle.titleStyle16bb,),),
                GestureDetector(
                  onTap: (){
                    controller.selectedUsers.clear();
                    controller.update();
                  },
                    child: Text('Clear All', style: MyTextStyle.titleStyle14blb,)),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: showSelectedList(),
            ),
          ),
          Divider(color: Colors.black,thickness: 1.px,indent: 20.px,endIndent: 20.px,),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: showEventsList(),
            ),
          ),

        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  /// show Selected user Lists...
  Widget showSelectedList() {
    return GetBuilder<ListController>(builder: (context) {
      return ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: controller.selectedUsers.length,
        itemBuilder: (context, int index) {
          GetFriendsResult item=controller.selectedUsers[index];
          return GestureDetector(
            onTap: () {
            controller.removeUsers(index);
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
                        borderRadius: BorderRadius.all(Radius.circular(25.px)),
                        child: Image.asset(ImageConstants.boyImg, fit: BoxFit.cover,),
                      ),
                    ),
                    title: Text(item.fullName!,
                      style: MyTextStyle.titleStyle16bb,),
                    subtitle: Text(item.dob!, style: MyTextStyle.titleStyle12blb,),
                    trailing: Image.asset(
                      IconsConstants.checkIcon, fit: BoxFit.fill,
                      height: 25.px,
                      width: 25.px,)
                )
            ),
          );
        },
      );
    });
  }

  /// Show All Friends list...
  Widget showEventsList() {
    return GetBuilder<ListController>(builder: (context) {
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
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 80.px,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        left: 10.px, right: 10.px, top: 5.px, bottom: 0.px),
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
                controller.addUsers(item);
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
                        child: CachedNetworkImage(
                          imageUrl:item.image!, fit:BoxFit.cover,
                          placeholder: (BuildContext context, String url) => Image.asset(ImageConstants.boyImg,fit: BoxFit.fill,height: 50.px,),
                          errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(ImageConstants.boyImg,fit: BoxFit.fill,height: 50.px,),
                        ),
                      ),
                      title: Text(item.fullName!,
                        style: MyTextStyle.titleStyle16bb,),
                      subtitle: Text(item.dob!, style: MyTextStyle.titleStyle12blb,),
                      trailing:
                      Image.asset(IconsConstants.circleIcon, fit: BoxFit.fill,
                        height: 25.px,
                        width: 25.px,)
                  )
              ),
            );
          },
        )
        );
    });
  }




  /// Show Diolog Box...
  void openSelectedAlertBox(){
    showDialog(
      context: context,
      builder: (ctx)=>AlertDialog(
        title:  Center(child: Text("My Friends List",style: MyTextStyle.titleStyle20bb,)),
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.px))
        ),
        content:  Container(
          height: 350.px,width: MediaQuery.of(context).size.width-60.px,
          child:ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: controller.selectedUsers.length,
            itemBuilder: (context, int index) {
              GetFriendsResult item=controller.selectedUsers[index];
              return GestureDetector(
                onTap: () {

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
                            borderRadius: BorderRadius.all(Radius.circular(25.px)),
                            child: Image.asset(ImageConstants.boyImg, fit: BoxFit
                                .cover,),
                          ),
                        ),
                        title: Text(item.fullName!, style: MyTextStyle.titleStyle16bb,),
                        subtitle: Text(item.dob!, style: MyTextStyle.titleStyle12blb,),
                    )
                ),
              );
            },
          ) ,
        ),
        alignment: Alignment.center,

        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonWidget.commonElevatedButton(
                  onPressed: ()async {
                    Get.back();
                    bool result=await controller.callingSubmitFriendsRequestForm();
                    if(result){
                      openSendRequestBox(context);
                    }
                  },
                  text: StringConstants.createList,
                  wantContentSizeButton: true,
                  width: 120.px,
                  height: 50.px,
                  borderRadius: 25.px
              ),
              CommonWidget.commonElevatedButton(
                  onPressed: (){
                    Get.back();
                  },
                  text: StringConstants.addFier,
                  wantContentSizeButton: true,
                  width: 120.px,
                  height: 50.px,
                  borderRadius: 25.px,
                  buttonColor: Colors.grey
              ),
            ],
          ),


        ],
      ),
    );
  }

  /// Show Send Request Box...
  void openSendRequestBox(BuildContext context){
    showDialog(
      context: context,
      builder: (ctx)=>AlertDialog(
        title:  Center(child: Text("Your request has been sent!",style: MyTextStyle.titleStyle24bb,)),
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))
        ),
        content:  Container(
          height: 260.px,width: MediaQuery.of(context).size.width-60.px,
          padding: EdgeInsets.all(10.px),
          child:Image.asset(ImageConstants.sendRequestImg,fit: BoxFit.cover,)
        ),
        alignment: Alignment.center,

        actions: <Widget>[
          Center(
            child: TextButton(onPressed: (){
              Get.back();
            },
                child: const Text( StringConstants.done,style: TextStyle(fontWeight: FontWeight.bold,fontSize:16,color: Colors.green),)),
          ),



        ],
      ),
    );
  }
}