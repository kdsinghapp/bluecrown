
import 'package:bluecrown/Activity/SignUpActivity.dart';
import 'package:get/get.dart';

import '../Activity/ClubHostSignUpActivity.dart';
import '../Activity/LoginActivity.dart';

class LoginTypeController extends GetxController{

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  pressButton(int index){
    switch(index){
      case 0:{
        Get.to(()=> const ClubHostSignUpActivity());
      }break;
      case 1:{
        Get.to(()=> const SignUpActivity());
      }break;
      case 2:{
        Get.toNamed('/loginActivity');
      }break;
    }
  }
}