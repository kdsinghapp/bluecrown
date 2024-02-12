
import 'package:get/get.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_clubpurchaseduser_model.dart';
import '../common/ShowToast.dart';

class ClubPurchasedUserController extends GetxController {
  RxInt count=0.obs;
  RxBool showClubPurchasedUserProgressBar=true.obs;
  RxBool presentData=false.obs;
  ClubPurchasedUserModel? clubPurchasedUserModel;

  Map<String,String?> parameterData=Get.parameters;


  @override
  void onInit() {
    super.onInit();
    getClubPurchasedUserList();
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


  changeBookingRequestProgressBar(bool value){
    showClubPurchasedUserProgressBar.value=value;
  }
  changePresentData(bool value){
    presentData.value=value;
  }


  getClubPurchasedUserList() async{
    clubPurchasedUserModel = await ApiMethods.getClubPurchasedUserApi(clubId: parameterData['clubId']!);
    if (clubPurchasedUserModel!.status!="0"??false ) {
      print(" Get Purchased User List Successfully complete...");
      changeBookingRequestProgressBar(false);
    }else{
      print("Get Purchased User List Failed....");
      changePresentData(false);
      showToastMessage(clubPurchasedUserModel!.message!);
    }
  }

}