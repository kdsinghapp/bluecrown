
import 'package:bluecrown/Apis/api_models/get_response_getcubslist_model.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../Controller/ClubController.dart';
import '../Tool/MyTextStyle.dart';
import '../constant/iconsconstants.dart';
import '../constant/imageconstants.dart';
import '../constant/stringconstants.dart';
class ClubActivity extends StatefulWidget{
  const ClubActivity({super.key});

  @override
  State<StatefulWidget> createState() =>_ClubListState();
}
class _ClubListState extends State<ClubActivity>{
  ClubController controller=Get.put(ClubController());
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
                    padding:  EdgeInsets.only(left: 15.px,right: 15.px,top: 2.px),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       /* Padding(
                          padding:  EdgeInsets.only(left: 5.px,right: 5.px,top: 10.px,bottom: 0.px),
                          child: GestureDetector(
                            onTap:(){},
                            child: Icon(Icons.search,size: 30.px,),
                            // child: Image.asset(IconsConstants.searchIcon,height: 25.px,width: 25.px,fit: BoxFit.fill,)
                          ),
                        ),*/
                        Padding(
                          padding:  EdgeInsets.only(left: 5.px,right: 5.px,top: 5.px,bottom: 0.px),
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
              padding: EdgeInsets.only(left: 20.px),
              child: Text(StringConstants.clubs,style: MyTextStyle.titleStyle16bb,),
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
        CommonWidget.commonShimmer(
          itemCount: 4,
            shimmerWidget:Container(
              height: 200.px,
              width: double.infinity,
              decoration:  BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10.px)),
              ),
              margin: EdgeInsets.only(left:20.px,right: 20.px,top: 5.px,bottom: 2.px),
              clipBehavior: Clip.hardEdge,
            )
        ):
         ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: controller.getClubsModel!.result!.length,
      itemBuilder: (context, int index) {
        GetClubsResult item=controller.getClubsModel!.result![index];
        return GestureDetector(
          onTap: () {
            controller.openClubAllEventActivity(item.id!,item.fullName!);
          },
          child:Container(
            height: 200.px,
            width: double.infinity,
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.px)),
            ),
            margin: EdgeInsets.only(left:10.px,right: 10.px,top: 2.px,bottom: 2.px),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl:item.image!, fit:BoxFit.cover,width: double.infinity,height: 200.px,
                  placeholder: (BuildContext context, String url) => Image.asset(ImageConstants.event1Img,fit: BoxFit.fill,height: 200.px,),
                  errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(ImageConstants.event1Img,fit: BoxFit.fill,height: 200.px,),
                ),
                Positioned(
                    bottom: 30.px,left: 0,right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30.px),
                          child: Text(item.fullName!,style: MyTextStyle.titleStyle14bw,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: 30.px),
                          child: Text("100m",style: MyTextStyle.titleStyle14bw,),
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