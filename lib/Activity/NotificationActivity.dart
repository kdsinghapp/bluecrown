
import 'package:bluecrown/Controller/PrivacyPolicyController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/imageconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Apis/api_models/get_response_getnotification_model.dart';
import '../Controller/NotificationController.dart';

class NotificationActivity extends StatefulWidget {
  const NotificationActivity({super.key});

  @override
  State<NotificationActivity> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationActivity> {
  NotificationController controller=Get.put(NotificationController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:primary3Color ,
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(StringConstants.notification,style: MyTextStyle.titleStyle24bb,),
          SizedBox(height: 10.px,),
          Padding(
            padding: EdgeInsets.all(15.px),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Allow Notifcations',style: MyTextStyle.titleStyle16bb,),
                        Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumym',style: MyTextStyle.titleStyle12b,),
                      ],
                    )
                ),
                Expanded(
                  flex: 1,
                    child: Center(
                      child: GFToggle(
                        onChanged: (val){
                          if(val!){

                          }
                        },
                        value: false,
                        disabledTrackColor: editTextButton,
                        enabledTrackColor: editTextButton,
                        enabledThumbColor:primaryColor,
                        type: GFToggleType.ios,
                      ),
                    ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.px),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email Notifcations',style: MyTextStyle.titleStyle16bb,),
                        Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumym',style: MyTextStyle.titleStyle12b,),
                      ],
                    )
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: GFToggle(
                      onChanged: (val){
                        if(val!){

                        }
                      },
                      value: false,
                      disabledTrackColor: editTextButton,
                      enabledTrackColor: editTextButton,
                      enabledThumbColor:primaryColor,
                      type: GFToggleType.ios,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.px),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sound',style: MyTextStyle.titleStyle16bb,),
                        Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumym',style: MyTextStyle.titleStyle12b,),
                      ],
                    )
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: GFToggle(
                      onChanged: (val){
                        if(val!){

                        }
                      },
                      value: false,
                      disabledTrackColor: editTextButton,
                      enabledTrackColor: editTextButton,
                      enabledThumbColor:primaryColor,
                      type: GFToggleType.ios,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:Padding(
                padding: const EdgeInsets.all(10.0),
                child: Obx(() => controller.showProgressbar.value?Text("There are not present notification",style: MyTextStyle.titleStyle14b,):
                showNotification()),
              ),
            ),
          ),

        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );

  }
  /// Show Popular Question and Answer...
  Widget showNotification(){
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: controller.getNotificationModel!.result!.length,
      itemBuilder: (context, int index) {
        GetNotificationResult item=controller.getNotificationModel!.result![index];
        return GestureDetector(
            onTap: () {
            },
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              semanticContainer: true,
              clipBehavior: Clip.none,
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              elevation: 0,
              color: primary3Color,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Icon(Icons.notification_important,size: 15,)),
                    Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.notification!,style: MyTextStyle.titleStyle13b,),
                            const SizedBox(height: 5,),
                            Text(calculateTimeDifference(item.dateTime!),style: MyTextStyle.titleStyle10b,)
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }


  String calculateTimeDifference(String time) {
    DateTime dateTime = DateTime.parse(time);
    Duration difference = DateTime.now().difference(dateTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }

}