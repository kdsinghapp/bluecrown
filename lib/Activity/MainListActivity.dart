
import 'package:bluecrown/Apis/api_models/get_response_category_model.dart';
import 'package:bluecrown/Controller/MainListController.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/imageconstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../Tool/Color.dart';
import '../constant/iconsconstants.dart';
import '../constant/stringconstants.dart';

class MainListActivity extends StatefulWidget{
  const MainListActivity({super.key});

  @override
  State<StatefulWidget> createState() =>_MainListState();
}
class _MainListState extends State<MainListActivity>{
  MainListController controller=Get.put(MainListController());
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: primary3Color,
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
                child: Padding(
                  padding:  EdgeInsets.only(left: 15.px,right: 15.px,top: 0.px),
                  child:Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     /* Padding(
                        padding:  EdgeInsets.only(left: 5.px,right: 5.px,top: 10.px,bottom: 10.px),
                        child: GestureDetector(
                            onTap:(){},
                          child: Icon(Icons.search,size: 30.px,),
                           // child: Image.asset(IconsConstants.searchIcon,height: 25.px,width: 25.px,fit: BoxFit.fill,)
                        ),
                      ),*/
                      Padding(
                        padding:  EdgeInsets.only(left: 5.px,right: 5.px,top: 10.px,bottom: 0.px),
                        child: GestureDetector(
                            onTap:(){},
                            child: Image.asset(IconsConstants.profileIcon,height: 30.px,width: 30.px,fit: BoxFit.fill,)
                        ),
                      ),

                    ],
                  )
                )

            ),
            Padding(
              padding: EdgeInsets.only(left: 15.px,top: 0.px),
              child: Text(StringConstants.categories,style: MyTextStyle.titleStyle16bb,),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:showNearEvents() ,
              ),
            ),

          ],
        )

    );
  }

  /// Show Near Events...
  Widget showNearEvents(){
    return Obx(() =>controller.showCategoryProgressBar.value?
    Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        enabled: controller.showCategoryProgressBar.value,
        child:ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context,int index){
              return  Container(
                height: 200.px,
                width: double.infinity,
                margin: EdgeInsets.only(left: 15.px,right: 15.px,top: 5.px,bottom: 5.px),
                decoration: const BoxDecoration(
                   color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              );
            }
        )
    ):
    ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: controller.categoryModel!.result!.length,
      itemBuilder: (context, int index) {
        CategoryResult item=controller.categoryModel!.result![index];
        return GestureDetector(
          onTap: () {
            controller.openListEventActivity(item.id!,item.image!);
          },
          child:Container(
            height: 200.px,
            width: double.infinity,
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.px)),
            ),
            margin: EdgeInsets.only(left: 15.px,right: 15.px,top: 5.px,bottom: 5.px),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl:item.image!, fit:BoxFit.cover,width: double.infinity,height: 200.px,
                  placeholder: (BuildContext context, String url) => CommonWidget.commonShimmer(
                      shimmerWidget: Container(
                        height: 200.px,width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.px)),
                          color: Colors.black
                        ),
                      )
                  ),
                  errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(ImageConstants.event1Img,fit: BoxFit.fill,height: 200.px,),
                ),
                Positioned(
                    bottom: 30.px,left: 0,right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30.px),
                          child: Text(item.name!,style: MyTextStyle.titleStyle16bw,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: 30.px),
                          child: Text("100m",style: MyTextStyle.titleStyle16bw,),
                        ),
                      ],
                    )
                )
              ],
            ),
          ),
        );
      },
    )
    );
  }

}