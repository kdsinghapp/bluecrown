import 'package:bluecrown/Apis/api_models/get_response_getcubslist_model.dart';
import 'package:bluecrown/Controller/WardrobeListController.dart';
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

class WardrobeListActivity extends StatefulWidget{
  const WardrobeListActivity({super.key});

  @override
  State<WardrobeListActivity> createState() =>_WardrobeListState();
}
class _WardrobeListState extends State<WardrobeListActivity>{
  WardrobeListController controller=Get.put(WardrobeListController());
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor:backgroundColor ,
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
              padding:  EdgeInsets.only(left: 5.px,right: 15.px,top: 10.px,bottom: 10.px),
              child: GestureDetector(
                  onTap:(){},
                  child: Image.asset(IconsConstants.profileIcon,height: 30.px,width: 30.px,)
              ),
            ),
          ],
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
                      prefixIcon: IconButton(
                        icon: Icon(
                          Icons.search_rounded, color: primaryColor, size: 25.px,),
                        onPressed: () {
                          //controller.changeSearchUsersProgressbar(true);
                          //controller.searchUserByName(controller.searchController.text);
                        },
                      ),
                      suffixIcon: Container(
                        height: 20.px, width: 20.px,
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
              padding: EdgeInsets.only(left: 20.px,top: 10.px,right: 10.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(StringConstants.wardrobe,style: MyTextStyle.titleStyle20bb,),
                  SizedBox(
                    height: 40.px, width: 40.px,
                    child: Image.asset(ImageConstants.jacketImg, fit: BoxFit.cover,),

                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:showClubsList() ,
              ),
            ),

          ],
        )

    );
  }

  /// Show Clubs List...
  Widget showClubsList() {
    return GetBuilder<WardrobeListController>(builder: (context) {
      return
        Obx(() =>
        controller.showProgressBar.value ?
        Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            enabled: controller.showProgressBar.value,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100.px,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        left: 10.px, right: 10.px, top: 10.px, bottom: 0.px),
                    decoration: const BoxDecoration(
                      // color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            height: 40.px, width: 60.px,
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.px)),
                                color: textColor
                            ),
                          ),
                          //horizontalTitleGap: 5.0,
                          title: Container(
                            height: 15.px, width: 80.px,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5)),
                                color: textColor
                            ),
                          ),
                          subtitle: Container(
                            height: 15.px, width: 50.px,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5)),
                                color: textColor
                            ),
                          ),
                          trailing: Container(
                            height: 50.px, width: 60.px,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.px)),
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
          itemCount: controller.filterClubsList.length,
          itemBuilder: (context, int index) {
             GetClubsResult item=controller.filterClubsList[index];
            return GestureDetector(
              onTap: () {
                controller.openHangerListActivity(item.id!);
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
                      height: 60.px, width: 80.px,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(15.px)),
                        child: CachedNetworkImage(
                          imageUrl:item.image!, fit:BoxFit.cover,width: 60.px,height: 60.px,
                          placeholder: (BuildContext context, String url) => Image.asset(ImageConstants.event1Img,fit: BoxFit.fill,height: 60.px,),
                          errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(ImageConstants.event1Img,fit: BoxFit.fill,height: 60.px,),
                        )
                      ),
                    ),
                    title: Text(item.fullName!,
                      style: MyTextStyle.titleStyle16bb,),
                    subtitle: Text(item.type!, style: MyTextStyle.titleStyle12blb,),
                    trailing: SizedBox(
                      height: 40.px, width: 40.px,
                      child:Image.asset(ImageConstants.scannerImg,fit: BoxFit.fill,height: 40.px,),

                    ),
                  )
              ),
            );
          },
        )
        );
    });
  }

}