import 'package:bluecrown/Activity/ClubActivity.dart';
import 'package:bluecrown/Activity/ListActivity.dart';
import 'package:bluecrown/Activity/MainListActivity.dart';
import 'package:bluecrown/Activity/MoreActivity.dart';
import 'package:bluecrown/Apis/api_models/get_response_getcubslist_model.dart';
import 'package:bluecrown/constant/imageconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../Controller/BottomBarController.dart';
import '../Controller/HomeController.dart';
import '../Tool/Color.dart';
import '../Tool/MyTextStyle.dart';
import '../constant/iconsconstants.dart';
import 'FriendsActivity.dart';
class MainActivity extends StatefulWidget{
  const MainActivity({super.key});


  @override
  State<StatefulWidget> createState() =>_MainState();
}

class _MainState extends State<MainActivity>{
  BottomBarController bottomBarController=Get.put(BottomBarController());
  var pageList=[
    const MainListActivity(),
    const ClubActivity(),
    const HomeActivity(),
    const FriendsActivity(),
    const MoreActivity(),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
        bottomNavigationBar: bottomNavigationWidgets(),
        backgroundColor: primary3Color,
        body:Obx(()=>pageList[int.parse(bottomBarController.bottomNavIndex.string)])
    );
  }

  Widget bottomNavigationWidgets(){
    return Container(
      height: 60,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
          color: primary3Color
      ),
      child: Obx(()=>
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      bottomBarController.changeBottomBarIndex(0);
                    },
                    child:bottomBarController.bottomNavIndex.value==0?Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(IconsConstants.listIcon,height: 25.px,width: 25.px,fit: BoxFit.fill,),
                        Text(StringConstants.list,style: TextStyle(fontSize: 12.px,fontWeight: FontWeight.bold,color: primaryColor),),
                        Container(width: 10.px,height: 2.px,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(1.px))
                          ),
                        )
                      ],
                    ):
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(IconsConstants.listIcon,height: 22.px,width: 22.px,fit: BoxFit.fill,),
                        Text(StringConstants.list,style: TextStyle(fontSize: 12.px,fontWeight: FontWeight.normal,color:Colors.black87),),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      bottomBarController.changeBottomBarIndex(1);
                    },
                    child:bottomBarController.bottomNavIndex.value==1?Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(IconsConstants.clubsIcon,height: 25.px,width: 25.px,fit: BoxFit.fill,),
                      Text(StringConstants.clubs,style: TextStyle(fontSize: 12.px,fontWeight: FontWeight.bold,color: primaryColor),),
                        Container(width: 10.px,height: 2.px,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(1.px))
                          ),
                        )
                      ],
                    ):
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(IconsConstants.clubsIcon,height: 22.px,width: 22.px,fit: BoxFit.fill,),
                        Text(StringConstants.clubs,style: TextStyle(fontSize: 12.px,fontWeight: FontWeight.normal,color:Colors.black87),)
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                      onTap: (){
                        bottomBarController.changeBottomBarIndex(2);
                      },
                      child:
                           Center(
                             child: SizedBox(
                               height: 50.px,width: 50.px,
                               child: Image.asset(IconsConstants.homeIcon,height: 50.px,width: 50.px,fit: BoxFit.fill,),

                             ),
                           )

                  )),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        bottomBarController.changeBottomBarIndex(3);
                      });
                    },
                    child:bottomBarController.bottomNavIndex.value==3? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(IconsConstants.friendsIcon,height: 25.px,width: 25.px,fit: BoxFit.fill,),
                        Text(StringConstants.friends,style: TextStyle(fontSize: 12.px,fontWeight: FontWeight.bold,color: primaryColor),),
                        Container(width: 10.px,height: 2.px,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(1.px))
                          ),
                        )
                      ],
                    ):
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(IconsConstants.friendsIcon,height: 22.px,width: 22.px,fit: BoxFit.fill,),
                        Text(StringConstants.friends,style: TextStyle(fontSize: 12.px,fontWeight: FontWeight.normal,color:Colors.black87),)
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      bottomBarController.changeBottomBarIndex(4);
                    },
                    child:bottomBarController.bottomNavIndex.value==4? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(IconsConstants.moreIcon,height: 25.px,width: 25.px,fit: BoxFit.fill,),
                        Text(StringConstants.more,style: TextStyle(fontSize: 12.px,fontWeight: FontWeight.bold,color: primaryColor),),
                        Container(width: 10.px,height: 2.px,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(1.px))
                          ),
                        )
                      ],
                    ):
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(IconsConstants.moreIcon,height: 22.px,width: 22.px,fit: BoxFit.fill,),
                         Text(StringConstants.more,style: TextStyle(fontSize: 12.px,fontWeight: FontWeight.normal,color:Colors.black87),)
                      ],
                    ),
                  )),
            ],
          ),
      ),

    );
  }

}

class HomeActivity extends StatefulWidget{
  const HomeActivity({super.key});

  @override
  State<StatefulWidget> createState() =>_HomeState();
}
class _HomeState extends State<HomeActivity>{
  HomeController controller=Get.put(HomeController());
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
              padding:  EdgeInsets.only(left: 15.px,right: 15.px,top: 10.px),
              child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){controller.openWardrobeActivity();},
                          child: Image.asset(IconsConstants.wordRobeIcon,height: 50.px,width: 50.px,fit: BoxFit.fill,)),


                      Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 5.px,right: 5.px,top: 10.px,bottom: 10.px),
                            child: GestureDetector(
                                onTap:(){
                                  controller.openMainQrCodeActivity();
                                },
                                child: Image.asset(IconsConstants.scanIcon,height: 30.px,width: 30.px,fit: BoxFit.fill,)
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 5.px,right: 5.px,top: 10.px,bottom: 10.px),
                            child: GestureDetector(
                                onTap:(){},
                                child: Image.asset(IconsConstants.profileIcon,height: 30.px,width: 30.px,fit: BoxFit.fill,)
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 5.px,right: 5.px,top: 10.px,bottom: 10.px),
                            child: GestureDetector(
                                onTap:(){ controller.openPointActivity();},
                                child: Image.asset(IconsConstants.crowneIcon,height: 30.px,width: 30.px,fit: BoxFit.fill,)
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
            )

          ),
            /*   sliderView(),
            Container(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Choose Category",style: MyTextStyle.titleStyle18bb,),
                      TextButton(onPressed: (){},
                          child: Text("See more",style: MyTextStyle.titleStyle12by,))
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: showCategoryList(),
                    ),
                  )
                ],
              ),
            ),*/
            Padding(
              padding: EdgeInsets.only(left: 20.px,top: 5.px),
              child: Text(StringConstants.nearByEvents,style: MyTextStyle.titleStyle16bb,),
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
    return Obx(() =>controller.showNearEventsProgressBar.value?
    Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        enabled: controller.showNearEventsProgressBar.value,
        child:ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 5,
            itemBuilder: (BuildContext context,int index){
              return  Container(
                height: 180.px,
                width: double.infinity,
                margin: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 0),
                decoration: const BoxDecoration(
                  // color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  children: [
                    Container(
                      height: 170.px,width: double.infinity,
                      margin: const EdgeInsets.only(left: 10,right: 10,top: 5),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: textColor
                      ),
                    ),
                  ],
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
            margin: const EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 0),
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