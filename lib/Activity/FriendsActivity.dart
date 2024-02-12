import 'package:bluecrown/Activity/LocalNotification.dart';
import 'package:bluecrown/Apis/api_models/get_response_getfriends_model.dart';
import 'package:bluecrown/Controller/FriendsController.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../Tool/Color.dart';
import '../constant/iconsconstants.dart';
import '../constant/imageconstants.dart';
import '../constant/stringconstants.dart';

class FriendsActivity extends StatefulWidget{
  const FriendsActivity({super.key});

  @override
  State<FriendsActivity> createState() =>_FriendsState();
}
class _FriendsState extends State<FriendsActivity>{
  FriendsController controller=Get.put(FriendsController());
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: primary3Color,
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
                    onTap: () {},
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
                        hintText: StringConstants.search,
                        hintStyle: MyTextStyle.titleStyle16b,
                        prefixIcon:Icon(Icons.search_rounded, color: primaryColor, size: 25.px,),
                        suffixIcon: Container(
                          height: 20.px, width: 20.px,
                          padding: EdgeInsets.all(8.px),
                          child: Image.asset(
                            IconsConstants.filterIcon, fit: BoxFit.cover,),
                        ),

                      ),
                      onChanged: (text) {
                        controller.changeFilterUsersList(controller.searchController.text);
                      },

                    ),
                    /* ListTile(
                    leading:const Icon(Icons.search_rounded,color: primaryColor,size: 25,),
                    horizontalTitleGap: 0.0,
                    title: Text("Search", style:MyTextStyle.titleStyle16by,),
                    trailing:InkWell(
                      onTap: (){
                        _showBottomSheetFilter(context);
                      },
                        child: Image.asset('assets/icons/filter.png',height: 25,width: 25,))
                ),*/
                  ),
                ),

            ),
            Padding(
              padding: EdgeInsets.only(left: 20.px,top: 5.px),
              child: Text(StringConstants.friends,style: MyTextStyle.titleStyle18bb,),
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
    return GetBuilder<FriendsController>(builder: (context) {
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
                //controller.addUsers(controller.filterUsersList[index]);
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>
                // WaterReminderHomePage()));
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
                          child: CachedNetworkImage(
                            imageUrl:"${item.image}", fit:BoxFit.cover,width:50.px,height: 50.px,
                            placeholder: (BuildContext context, String url) => Image.asset(ImageConstants.boyImg,fit: BoxFit.fill,height: 50.px,),
                            errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(ImageConstants.boyImg,fit: BoxFit.fill,height: 50.px,),
                          ),
                        ),
                      ),
                      title: Text(item.fullName!, style: MyTextStyle.titleStyle14bb,),
                      subtitle: Text(item.dob!, style: MyTextStyle.titleStyle12b,),
                  )
              ),
            );
          },
        )
        );
    });
  }

}