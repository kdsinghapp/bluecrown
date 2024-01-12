import 'package:bluecrown/Apis/api_models/get_response_cubfriend_model.dart';
import 'package:bluecrown/Controller/AdminWardrobeController.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../Tool/Color.dart';
import '../common/CommonWidget.dart';
import '../constant/iconsconstants.dart';
import '../constant/imageconstants.dart';
import '../constant/stringconstants.dart';

class AdminWardrobeActivity extends StatefulWidget{
  const AdminWardrobeActivity({super.key});

  @override
  State<AdminWardrobeActivity> createState() =>_AdminWardrobeState();
}
class _AdminWardrobeState extends State<AdminWardrobeActivity>{
  AdminWardrobeController controller=Get.put(AdminWardrobeController());
  @override
  Widget build(BuildContext context){
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
              padding:  EdgeInsets.only(left: 5.px,top: 10.px,bottom: 10.px),
              child: GestureDetector(
                  onTap:(){},
                  child: Icon(Icons.person_add_alt_rounded,color: primaryColor,size: 25.px,)
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 1.px,right: 10.px,top: 10.px,bottom: 10.px),
              child: Center(child: Text('50',style: MyTextStyle.titleStyle14b,textAlign: TextAlign.center,)),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 5.px,right: 15.px,top: 10.px,bottom: 10.px),
              child: GestureDetector(
                  onTap:(){
                    openDatePickerBox(context);
                  },
                  child: Image.asset(IconsConstants.dateIcon,height: 30.px,width: 30.px,color: primaryColor,)
              ),
            ),
          ],
        ),
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(StringConstants.wardrobe,style: MyTextStyle.titleStyle20bb,),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0.px),
              ),
              semanticContainer: true,
              clipBehavior: Clip.none,
              elevation: 0.px,
              color: cartColor,
              margin: EdgeInsets.all(15.px),
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
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:showWardrobeList() ,
              ),
            ),

          ],
        )

    );
  }

  /// Show Wardrobes List...
  Widget showWardrobeList() {
    return GetBuilder<AdminWardrobeController>(builder: (context) {
      return
        Obx(() =>
        controller.showProgressbar.value ?
        Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            enabled: controller.showProgressbar.value,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 60.px,
                    width: double.infinity,
                    margin:EdgeInsets.only(
                        left: 10.px, right: 10.px, top: 10.px, bottom: 0.px),
                    decoration: BoxDecoration(
                      // color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(10.px))
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            height: 50.px, width: 50.px,
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(25.px)),
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
                          trailing: Container(
                            height: 20.px, width: 50.px,
                            decoration:BoxDecoration(
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
          itemCount: controller.filterUsersList.length,
          itemBuilder: (context, int index) {
             GetClubFriendResult item=controller.filterUsersList[index];
            return GestureDetector(
              onTap: () {
                //controller.addUsers(controller.filterUsersList[index]);
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
                          imageUrl:"${item.friendImage}", fit:BoxFit.cover,width:50.px,height: 50.px,
                          placeholder: (BuildContext context, String url) => Image.asset(ImageConstants.boyImg,fit: BoxFit.fill,height: 50.px,),
                          errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(ImageConstants.boyImg,fit: BoxFit.fill,height: 50.px,),
                        ),
                      ),
                    ),
                    title: Text(item.fullName!,style: MyTextStyle.titleStyle14bb,),
                    trailing: Text(item.status!, style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color:item.status!='Active'?labelColor:greenColor ),),
                  )
              ),
            );
          },
        )
        );
    });
  }

  /// Show Date Picker Box...
  void openDatePickerBox(BuildContext context) async {
    List<DateTime?> _dates=[];
    showDialog(
      context: context,
      builder: (ctx)=>AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))
        ),
        content:  Container(
            height: 260.px,width: MediaQuery.of(context).size.width-60.px,
            padding: EdgeInsets.all(10.px),
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.range,
              ),
              value: _dates,
              onValueChanged: (dates) => _dates = dates,
            )
        ),
        alignment: Alignment.center,

        actions: <Widget>[
          CommonWidget.commonElevatedButton(
              onPressed: (){
                Get.back();
                //controller.openAdminWardrobeActivity();
              },
              text: StringConstants.submit,
              buttonMargin: EdgeInsets.all(10.px),
              borderRadius: 25.px
          ),

        ],
      ),
    );

  }

}