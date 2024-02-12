import 'package:bluecrown/Apis/api_models/get_response_getcubslist_model.dart';
import 'package:bluecrown/Controller/UsePointClubsController.dart';
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
class UsePointClubsActivity extends StatefulWidget{
  const UsePointClubsActivity({super.key});

  @override
  State<UsePointClubsActivity> createState() =>_UsePointClubsState();
}
class _UsePointClubsState extends State<UsePointClubsActivity>{
  UsePointClubsController controller=Get.put(UsePointClubsController());
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
          title: Center(
            child: Padding(
              padding:  EdgeInsets.only(right: 40.px),
              child: Text('Choose Clubs',style: MyTextStyle.titleStyle20bb,),
            ),
          ),
        ),
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            controller.openUsePointEventsActivity(item.id!,item.fullName!);
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
                        // Padding(
                        //   padding:  EdgeInsets.only(right: 30.px),
                        //   child: Text("100m",style: MyTextStyle.titleStyle14bw,),
                        // ),
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