
import 'package:bluecrown/Apis/api_models/get_response_termscondition_model.dart';
import 'package:get/get.dart';

import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';


class TermsConditionController extends GetxController{
  RxBool showProgressbar=true.obs;
  TermsConditionModel? termsConditionModel;

  @override
  void onInit() {
    super.onInit();
    getTermsConditions();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getTermsConditions() async{
    termsConditionModel = await ApiMethods.getTermsConditionsApi();
    if (termsConditionModel!.status!="0"??false ) {
      changeProgressbarStatus(false);
      print(" Get Terms Conditions Successfully complete...");
    }else{
      print("Get Terms Conditions  Failed....");
      showToastMessage(termsConditionModel!.message!);
    }
  }

  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
  }
}