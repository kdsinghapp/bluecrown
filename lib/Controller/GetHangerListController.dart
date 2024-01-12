
import 'package:bluecrown/Apis/api_models/get_response_getclubhanger_model.dart';
import 'package:get/get.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_getcubslist_model.dart';
import '../common/ShowToast.dart';


class GetHangerListController extends GetxController {
  RxInt count=0.obs;
  RxBool showProgressBar=true.obs;

  GetClubHangerModel? getClubHangerModel;
  Map<String,String?> parameterData=Get.parameters;
  @override
  void onInit() {
    super.onInit();
    getClubHangers();
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


  changeShowProgressBar(bool value){
    showProgressBar.value=value;
  }

  openQrScannerActivity(String hangerCode) async{
    Map<String,String>data={
      'clubId':parameterData['clubId']!,
      'hangerCode':hangerCode
    };
    changeShowProgressBar(true);
    await Get.toNamed('/qrScannerActivity',parameters: data);
    onInit();
  }

  getClubHangers() async{
    getClubHangerModel = await ApiMethods.getClubHangerApi(clubId: parameterData['clubId']!);
    if (getClubHangerModel!.status!="0"??false ) {
      print(" Get Clubs Hanger Successfully complete...");
      changeShowProgressBar(false);
    }else{
      print("Get Clubs Hanger Failed....");
      changeShowProgressBar(true);
      showToastMessage(getClubHangerModel!.message!);
    }
  }

}