
import 'package:bluecrown/Activity/PointsActivity.dart';
import 'package:bluecrown/Activity/QrScannerActivity.dart';
import 'package:bluecrown/Apis/api_methods/api_methods.dart';
import 'package:bluecrown/Apis/api_models/get_response_getcubslist_model.dart';
import 'package:get/get.dart';

import '../Activity/EventDetailActivity.dart';
import '../Activity/MainQrCodeActivity.dart';
import '../Activity/MineOfferActivity.dart';
import '../Activity/WardrobeActivity.dart';
import '../common/ShowToast.dart';
import '../constant/imageconstants.dart';


class HomeController extends GetxController {
  RxInt count=0.obs;
  RxBool showNearEventsProgressBar=true.obs;
  GetClubsModel? getClubsModel;


  List<String> images=[ImageConstants.event1Img,ImageConstants.event2Img,ImageConstants.event1Img,ImageConstants.event2Img,];


  @override
  void onInit() {
    super.onInit();
    getClubs();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changeCount(int value){
    count.value=value;
  }


  changeShowNearEventsProgressBar(bool value){
    showNearEventsProgressBar.value=value;
  }

  openClubAllEventActivity(String clubId,String clubName){
    Map<String,String> data={
      'clubId':clubId,
      'clubName':clubName
    };
    Get.toNamed('/clubAllEventActivity',parameters:data );
  }
  openPointActivity(){
    Get.to(()=> const PointActivity());
  }

  openWardrobeActivity(){
    Get.to(()=> const WardrobeActivity());
  }

  openMainQrCodeActivity(){
   Get.to(()=> const MainQrCodeActivity());
  }

  getClubs() async{
    getClubsModel = await ApiMethods.getClubListApi();
    if (getClubsModel!.status!="0"??false ) {
      print(" Get Clubs Successfully complete...");
      changeShowNearEventsProgressBar(false);
    }else{
      print("Get Clubs Failed....");
      changeShowNearEventsProgressBar(true);
      showToastMessage(getClubsModel!.message!);
    }
  }

}