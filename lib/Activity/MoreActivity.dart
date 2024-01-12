
import 'package:bluecrown/constant/imageconstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Controller/MoreController.dart';
import '../Tool/Color.dart';
import '../Tool/MyTextStyle.dart';
import '../common/CommonWidget.dart';
import '../constant/iconsconstants.dart';
import '../constant/stringconstants.dart';

class MoreActivity extends StatefulWidget {
  const MoreActivity({super.key});

  @override
  State<MoreActivity> createState() => _MoreState();
}
class _MoreState extends State<MoreActivity> {

  MoreController controller=Get.put(MoreController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20,bottom: 5),
                margin: const EdgeInsets.only( top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() => controller.isPresentData.value?
                        Column(
                          children: [
                            SizedBox(
                              height: 80,width: 80,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: CachedNetworkImage(
                                    imageUrl:controller.userData.result!.image!, fit:BoxFit.cover,width:80,height: 80.px,
                                    placeholder: (BuildContext context, String url) =>Image.asset(ImageConstants.boyImg,fit: BoxFit.fill,height: 80.px,),
                                    errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(ImageConstants.boyImg,fit: BoxFit.fill,height: 80.px,),
                                  ),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            Text(controller.userData.result!.fullName??"",style: MyTextStyle.titleStyle16bb,),
                            const SizedBox(height: 10,),
                            Text(controller.userData.result!.email??"",style: MyTextStyle.titleStyle12b,),
                          ],
                        ):
                        SizedBox(height: 30.px,)
                    ),

                    const SizedBox(height: 20,),
                    mainProfileList(),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20,bottom: 10,top: 20),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("More",style: MyTextStyle.titleStyle16b,),
                          ),

                        ],
                      ),
                    ),
                    moreProfileList(),
                    Obx(() => controller.isPresentData.value?
                    Visibility(
                        visible: controller.userData.result!.type=="User"?false:true,
                        child: Column(
                          children: [
                            ListTile(
                              onTap: ()=>controller.openForClubHost(),
                              leading: SizedBox(
                                height: 40,width: 40,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(IconsConstants.userIcon, fit: BoxFit.cover
                                  ),
                                ),
                              ),
                              title:  Text(StringConstants.iAmClubHost,style: MyTextStyle.titleStyle16bb,),
                              subtitle:  Text('Lorem ipsum dolor sit amet, ',style:MyTextStyle.titleStyle14b ,),
                              trailing: const Icon(Icons.arrow_forward_ios,size: 20,color: Colors.black26,),

                            ),
                            ListTile(
                              onTap: ()=>controller.openForAdmin(),
                              leading: SizedBox(
                                height: 40,width: 40,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(IconsConstants.userIcon, fit: BoxFit.cover
                                  ),
                                ),
                              ),
                              title:  Text(StringConstants.iAmAdmin,style: MyTextStyle.titleStyle16bb,),
                              subtitle:  Text('Lorem ipsum dolor sit amet, ',style:MyTextStyle.titleStyle14b ,),
                              trailing: const Icon(Icons.arrow_forward_ios,size: 20,color: Colors.black26,),

                            ),
                          ],
                        )):SizedBox(height: 5.px,),
                    ),


                    Container(
                      width: double.infinity,
                      height: 45,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      clipBehavior: Clip.hardEdge,
                      margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                      child: TextButton(
                        onPressed: (){
                          controller.openLogoutActivity();
                        },
                        style: TextButton.styleFrom(backgroundColor: primaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(() => Visibility(
                                visible: controller.showProgressbar.value,
                                child: const SizedBox(
                                    height:30,width:30,
                                    child:CircularProgressIndicator(color:primary3Color,)
                                )
                            )),
                            const SizedBox(width: 10,),
                            Obx(() => controller.showProgressbar.value?Text("Loading...",style: MyTextStyle.titleStyle16bw,):
                            Text(StringConstants.logout,style: MyTextStyle.titleStyle16bw,),),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              ),


            ],
          ),
        ),

    );
  }

  Widget mainProfileList(){
    return  ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.list1.length,
      itemBuilder: (context, index){
        return
          Column(
            children: [
              ListTile(
                onTap: ()=>controller. openMainProfilePages(index),
                leading: SizedBox(
                  height: 40,width: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      controller.mainIconList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title:  Text(controller.list1[index],style: MyTextStyle.titleStyle16bb,),
                subtitle:  Text('Lorem ipsum dolor sit amet, ',style:MyTextStyle.titleStyle14b ,),
                trailing: const Icon(Icons.arrow_forward_ios,size: 20,color: Colors.black26,),

              ),
            ],
          );
      },);
  }
  Widget moreProfileList(){
    return  ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.list2.length,
      itemBuilder: (context, index){
        return
          Column(
            children: [
              ListTile(
                onTap: ()=>controller. openMoreProfilePages(index),
                leading: SizedBox(
                  height: 40,width: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                        controller.moreIconList[index],
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                title:  Text(controller.list2[index],style: MyTextStyle.titleStyle16bb,),
                subtitle:  Text('Lorem ipsum dolor sit amet, ',style:MyTextStyle.titleStyle14b ,),
                trailing: const Icon(Icons.arrow_forward_ios,size: 20,color: Colors.black26,),

              ),
            ],
          );
      },);
  }

}