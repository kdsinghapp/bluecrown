import 'package:bluecrown/Activity/AddListActivity.dart';
import 'package:bluecrown/Apis/api_models/get_response_category_model.dart';
import 'package:get/get.dart';

import '../Activity/ListActivity.dart';
import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';


class MainListController extends GetxController {
  RxInt count=0.obs;
  RxBool showCategoryProgressBar=true.obs;
  CategoryModel? categoryModel;


  @override
  void onInit() {
    super.onInit();
    getCategory();

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


  changeCategoryProgressBar(bool value){
    showCategoryProgressBar.value=value;
  }

  openListEventActivity(String categoryId,String image){
    Map<String,String> data={
      'categoryId':categoryId,
      'image':image
    };
    Get.toNamed('/eventDetailActivity',parameters:data );
  }


  getCategory() async{
    categoryModel = await ApiMethods.getCategoryApi();
    if (categoryModel!.status!="0"??false ) {
      print(" Category Successfully complete...");
      changeCategoryProgressBar(false);
    }else{
      print("Get Category Failed....");
      changeCategoryProgressBar(true);
      showToastMessage(categoryModel!.message!);
    }
  }

}