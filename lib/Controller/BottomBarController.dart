import 'package:get/get.dart';

class BottomBarController extends GetxController{
  RxInt bottomNavIndex=2.obs;
  changeBottomBarIndex(int index){
    bottomNavIndex.value=index;
  }
}