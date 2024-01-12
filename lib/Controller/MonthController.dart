import 'package:get/get.dart';


class MonthController extends GetxController{
  List<Map<String, dynamic>> months = [
    {'title': 'January',"valuee":DateTime.january},
    {'title': 'February',"valuee":DateTime.february},
    {'title': 'March',"valuee":DateTime.march},
    {'title': 'April',"valuee":DateTime.april},
    {'title': 'May',"valuee":DateTime.may},
    {'title': 'June',"valuee":DateTime.june},
    {'title': 'July',"valuee":DateTime.july},
    {'title': 'August',"valuee":DateTime.august},
    {'title': 'September',"valuee":DateTime.september},
    {'title': 'October',"valuee":DateTime.october},
    {'title': 'November',"valuee":DateTime.november},
    {'title': 'December',"valuee":DateTime.december},
  ];
  RxBool showNearEventsProgressBar=false.obs;

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


}