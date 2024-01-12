
import 'package:bluecrown/Apis/api_models/get_response_privacypolicy_model.dart';
import 'package:get/get.dart';

import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';


class PrivacyPolicyController extends GetxController{
  RxBool showProgressbar=true.obs;
  PrivacyPolicyModel? privacyPolicyModel;

  @override
  void onInit() {
    super.onInit();
    getPrivacyPolicy();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getPrivacyPolicy() async{
    privacyPolicyModel = await ApiMethods.getPrivacyPolicyApi();
    if (privacyPolicyModel!.status!="0"??false ) {
      changeProgressbarStatus(false);
      print(" Get Privacy Policy Successfully complete...");
    }else{
      print("Get Privacy Policy Failed....");
      showToastMessage(privacyPolicyModel!.message!);
    }
  }

  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
  }
}