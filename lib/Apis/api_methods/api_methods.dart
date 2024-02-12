import 'dart:io';


import 'package:bluecrown/Apis/api_models/get_addpurchaseevent_model.dart';
import 'package:bluecrown/Apis/api_models/get_clubpurchaseduser_model.dart';
import 'package:bluecrown/Apis/api_models/get_mywallethistory_model.dart';
import 'package:bluecrown/Apis/api_models/get_responce_scaneventqr_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_addclubcostomer_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_addevent_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_addhangermodel.dart';
import 'package:bluecrown/Apis/api_models/get_response_addlist_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_bookingrequestmodel.dart';
import 'package:bluecrown/Apis/api_models/get_response_checkotp_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_common_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_cubfriend_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_currentjacket_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_forgotpassword_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_getclubhanger_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_getclubrequest_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_getcubslist_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_getfriends_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_getnotification_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_getwardrobeusers_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_howtoearnpoints_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_mypurchasingevents_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_privacypolicy_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_published_myevent_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_termscondition_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_updateclubrequest_model.dart';
import 'package:bluecrown/Apis/api_models/get_usercategory_model.dart';
import 'package:bluecrown/Apis/api_models/get_walletbyclubid_model.dart';

import '../../Common/http_methods.dart';
import '../api_constants/api_url_constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api_models/get_response_category_model.dart';
import '../api_models/get_response_friendsrequest_model.dart';
import '../api_models/get_response_hangjacket_model.dart';
import '../api_models/get_response_login_model.dart';
import '../api_models/get_response_parties_model.dart';
import '../api_models/get_response_singup_model.dart';

class ApiMethods {
  /// Registration Api Calling .....
  static Future<SignUpModel?> submitRegistrationForm({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SignUpModel? signUpModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSignUp,
      checkResponse: checkResponse,
    );
    if (response != null) {
      signUpModel = SignUpModel.fromJson(jsonDecode(response.body));
      return signUpModel;
    }
    return null;
  }

  /// Host Registration Api Calling .....
  static Future<SignUpModel?> submitHostRegistrationForm({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SignUpModel? signUpModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfHostSignUp,
      checkResponse: checkResponse,
    );
    if (response != null) {
      signUpModel = SignUpModel.fromJson(jsonDecode(response.body));
      return signUpModel;
    }
    return null;
  }

  /// Host Registration As Vip Api Calling .....
  static Future<SignUpModel?> submitVipClubHostForm({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SignUpModel? signUpModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfVipHostSignUp,
      checkResponse: checkResponse,
    );
    if (response != null) {
      signUpModel = SignUpModel.fromJson(jsonDecode(response.body));
      return signUpModel;
    }
    return null;
  }

  ///Login Api Calling.....
  static Future<LogInModel?> logInApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    LogInModel? logInModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfLogin,
      checkResponse: checkResponse,
    );

    if (response != null) {
      logInModel = LogInModel.fromJson(jsonDecode(response.body));
      return logInModel;
    }
    return null;
  }
  ///GetProfile Api Calling.....
  static Future<LogInModel?> getProfileApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    LogInModel? logInModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetProfile,
      checkResponse: checkResponse,
    );

    if (response != null) {
      logInModel = LogInModel.fromJson(jsonDecode(response.body));
      return logInModel;
    }
    return null;
  }
  ///Forgot Password Api Calling.....
  static Future<ForgotPasswordModel?> forgotPasswordApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    ForgotPasswordModel? forgotPasswordModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfForgot,
      checkResponse: checkResponse,
    );

    if (response != null) {
      forgotPasswordModel = ForgotPasswordModel.fromJson(jsonDecode(response.body));
      return forgotPasswordModel;
    }
    return null;
  }

  ///Check Otp Api Calling.....
  static Future<CheckOtpModel?> checkOtpApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    CheckOtpModel? checkOtpModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfCheckOtp,
      checkResponse: checkResponse,
    );

    if (response != null) {
      checkOtpModel = CheckOtpModel.fromJson(jsonDecode(response.body));
      return checkOtpModel;
    }
    return null;
  }

  ///Create New Password Api Calling.....
  static Future<CommonResponseModel?> newPasswordApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    CommonResponseModel? commonResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfResetPassword,
      checkResponse: checkResponse,
    );

    if (response != null) {
      commonResponseModel = CommonResponseModel.fromJson(jsonDecode(response.body));
      return commonResponseModel;
    }
    return null;
  }
  ///Create Change Password Api Calling.....
  static Future<CommonResponseModel?> changePasswordApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    CommonResponseModel? commonResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfChangePassword,
      checkResponse: checkResponse,
    );

    if (response != null) {
      commonResponseModel = CommonResponseModel.fromJson(jsonDecode(response.body));
      return commonResponseModel;
    }
    return null;
  }

  ///Scan Even Qr Code for get point Api Calling.....
  static Future<ScanEventQrModel?> scanEventQrCodeApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    ScanEventQrModel? scanEventQrModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfScanEventQrCode,
      checkResponse: checkResponse,
    );

    if (response != null) {
      scanEventQrModel = ScanEventQrModel.fromJson(jsonDecode(response.body));
      return scanEventQrModel;
    }
    return null;
  }
  ///Submit  Friends Request Api Calling.....
  static Future<FriendsRequestModel?> submitFriendsRequestApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    FriendsRequestModel? friendsRequestModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSubmitFriendsRequest,
      checkResponse: checkResponse,
    );

    if (response != null) {
      friendsRequestModel = FriendsRequestModel.fromJson(jsonDecode(response.body));
      return friendsRequestModel;
    }
    return null;
  }
  ///Submit Add Costomer Api Calling.....
  static Future<AddCostomerModel?> submitAddCostomerApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AddCostomerModel? addCostomerModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfClubAddCostomerRequest,
      checkResponse: checkResponse,
    );

    if (response != null) {
      addCostomerModel = AddCostomerModel.fromJson(jsonDecode(response.body));
      return addCostomerModel;
    }
    return null;
  }

  /// Get Event Category  Api Calling .....
  static Future<CategoryModel?> getCategoryApi(
      {void Function(int)? checkResponse}) async {
    CategoryModel? categoryModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfCategory,
      checkResponse: checkResponse,
    );
    if (response != null) {
      categoryModel =
          CategoryModel.fromJson(jsonDecode(response.body));
      return categoryModel;
    }
    return null;
  }
  /// Get User Category  Api Calling .....
  static Future<GetUserCategoryModel?> getUserCategoryApi(
      {void Function(int)? checkResponse}) async {
    GetUserCategoryModel? getUserCategoryModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfUserCategory,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getUserCategoryModel =
          GetUserCategoryModel.fromJson(jsonDecode(response.body));
      return getUserCategoryModel;
    }
    return null;
  }

  /// Get Parties by category id  Api Calling .....
  static Future<GetPartiesModel?> getPartiesApi(
      {void Function(int)? checkResponse,required String userId,required String categoryId,}) async {
    String url='${ApiUrlConstants.endPointOfGetParties}?user_id=$userId&category_id=$categoryId';
    GetPartiesModel? getPartiesModel;
    http.Response? response = await MyHttp.getMethod(
      url: url,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getPartiesModel = GetPartiesModel.fromJson(jsonDecode(response.body));
      return getPartiesModel;
    }
    return null;
  }


  /// Get Get Event booking Request by club id  Api Calling .....
  static Future<GetBookingRequestModel?> getEventBookingRequestApi(
      {void Function(int)? checkResponse,required String clubId}) async {
    String url='${ApiUrlConstants.endPointOfGetBookingRequest}?club_id=$clubId';
    GetBookingRequestModel? getBookingRequestModel;
    http.Response? response = await MyHttp.getMethod(
      url: url,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getBookingRequestModel = GetBookingRequestModel.fromJson(jsonDecode(response.body));
      return getBookingRequestModel;
    }
    return null;
  }
  /// Get My booking Events by user id  Api Calling .....
  static Future<GetBookingRequestModel?> getMyBookingEventsApi(
      {void Function(int)? checkResponse,required String userId}) async {
    String url='${ApiUrlConstants.endPointOfGetMyBookingEventRequest}?user_id=$userId';
    GetBookingRequestModel? getBookingRequestModel;
    http.Response? response = await MyHttp.getMethod(
      url: url,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getBookingRequestModel = GetBookingRequestModel.fromJson(jsonDecode(response.body));
      return getBookingRequestModel;
    }
    return null;
  }


  /// Get Privacy Policy  Api Calling .....
  static Future<PrivacyPolicyModel?> getPrivacyPolicyApi(
      {void Function(int)? checkResponse}) async {
    PrivacyPolicyModel? privacyPolicyModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfPrivacyPolicy,
      checkResponse: checkResponse,
    );
    if (response != null) {
      privacyPolicyModel =
          PrivacyPolicyModel.fromJson(jsonDecode(response.body));
      return privacyPolicyModel;
    }
    return null;
  }


  /// Get TermsConditions Api Calling .....
  static Future<TermsConditionModel?> getTermsConditionsApi(
      {void Function(int)? checkResponse}) async {
    TermsConditionModel? termsConditionModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfTermsCondition,
      checkResponse: checkResponse,
    );
    if (response != null) {
      termsConditionModel = TermsConditionModel.fromJson(jsonDecode(response.body));
      return termsConditionModel;
    }
    return null;
  }


  /// Get Club List Api Calling .....
  static Future<GetClubsModel?> getClubListApi(
      {void Function(int)? checkResponse}) async {
    GetClubsModel? getClubsModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetClubList,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getClubsModel = GetClubsModel.fromJson(jsonDecode(response.body));
      return getClubsModel;
    }
    return null;
  }

  /// Get Friends List Api Calling .....
  static Future<GetFriendsModel?> getFriendListApi(
      {void Function(int)? checkResponse}) async {
    GetFriendsModel? getFriendsModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetFriendList,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getFriendsModel = GetFriendsModel.fromJson(jsonDecode(response.body));
      return getFriendsModel;
    }
    return null;
  }

  /// Get Published my event Api Calling .....
  static Future<PublishMyEventModel?> getPublishMyEventApi(
      {void Function(int)? checkResponse,required String userId}) async {
    String apiURL='${ApiUrlConstants.endPointOfGetMyPublishEvent}?user_id=$userId';
    PublishMyEventModel? publishMyEventModel;
    http.Response? response = await MyHttp.getMethod(
      url: apiURL,
      checkResponse: checkResponse,
    );
    if (response != null) {
      publishMyEventModel = PublishMyEventModel.fromJson(jsonDecode(response.body));
      return publishMyEventModel;
    }
    return null;
  }
  /// Get Notifications Api Calling .....
  static Future<GetNotificationModel?> getNotificationApi(
      {void Function(int)? checkResponse,required String userId}) async {
    String apiURL='${ApiUrlConstants.endPointOfGetNotification}?user_id=$userId';
    GetNotificationModel? getNotificationModel;
    http.Response? response = await MyHttp.getMethod(
      url: apiURL,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getNotificationModel = GetNotificationModel.fromJson(jsonDecode(response.body));
      return getNotificationModel;
    }
    return null;
  }
  /// Get Wallet Amount According Club id Api Calling .....
  static Future<GetClubWalletModel?> getWalletAmountAccordingClubIdApi(
      {void Function(int)? checkResponse,required String userId,required String clubId}) async {
    String apiURL='${ApiUrlConstants.endPointOfGetWalletByClubIdUserId}?user_id=$userId&club_id=$clubId';
    GetClubWalletModel? getClubWalletModel;
    http.Response? response = await MyHttp.getMethod(
      url: apiURL,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getClubWalletModel = GetClubWalletModel.fromJson(jsonDecode(response.body));
      return getClubWalletModel;
    }
    return null;
  }
  /// Get Club Hanger Api Calling .....
  static Future<GetClubHangerModel?> getClubHangerApi(
      {void Function(int)? checkResponse,required String clubId}) async {
    String apiURL='${ApiUrlConstants.endPointOfGetClubHanger}?club_id=$clubId';
    GetClubHangerModel? getClubHangerModel;
    http.Response? response = await MyHttp.getMethod(
      url: apiURL,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getClubHangerModel = GetClubHangerModel.fromJson(jsonDecode(response.body));
      return getClubHangerModel;
    }
    return null;
  }

  ///Add Events Api Calling.....
  static Future<AddEventModel?> addEventsApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AddEventModel? addEventModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddEvent,
      checkResponse: checkResponse,
    );

    if (response != null) {
      addEventModel = AddEventModel.fromJson(jsonDecode(response.body));
      return addEventModel;
    }
    return null;
  }
  ///Update My Published Events Api Calling.....
  static Future<AddEventModel?> updateMyPublishEventsApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AddEventModel? addEventModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUpdateEvent,
      checkResponse: checkResponse,
    );

    if (response != null) {
      addEventModel = AddEventModel.fromJson(jsonDecode(response.body));
      return addEventModel;
    }
    return null;
  }

  ///Update My Published Events Api Calling.....
  static Future<AddListModel?> userAddListApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AddListModel? addListModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfBookEvent,
      checkResponse: checkResponse,
    );

    if (response != null) {
      addListModel = AddListModel.fromJson(jsonDecode(response.body));
      return addListModel;
    }
    return null;
  }

  ///Update Club Request Api Calling.....
  static Future<UpdateClubRequestModel?> updateClubRequestApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UpdateClubRequestModel? updateClubRequestModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUpdateClubRequest,
      checkResponse: checkResponse,
    );

    if (response != null) {
      updateClubRequestModel = UpdateClubRequestModel.fromJson(jsonDecode(response.body));
      return updateClubRequestModel;
    }
    return null;
  }

  ///Hang Jacket Api Calling.....
  static Future<HangJacketModel?> hangJacketApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    HangJacketModel? hangJacketModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfHangJacket,
      checkResponse: checkResponse,
    );

    if (response != null) {
      hangJacketModel = HangJacketModel.fromJson(jsonDecode(response.body));
      return hangJacketModel;
    }
    return null;
  }
  ///Add Hanger List Api Calling.....
  static Future<AddHangerModel?> addHangerListApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AddHangerModel? addHangerModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddHanger,
      checkResponse: checkResponse,
    );

    if (response != null) {
      addHangerModel = AddHangerModel.fromJson(jsonDecode(response.body));
      return addHangerModel;
    }
    return null;
  }

  ///Add PurchaseEvent Api Calling.....
  static Future<AddPurchaseEventModel?> addPurchaseEventApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AddPurchaseEventModel? addPurchaseEventModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddPurchaseEvent,
      checkResponse: checkResponse,
    );

    if (response != null) {
      addPurchaseEventModel = AddPurchaseEventModel.fromJson(jsonDecode(response.body));
      return addPurchaseEventModel;
    }
    return null;
  }
  ///Get My Purchasing Events Api Calling.....
  static Future<GetMyPurchasingEventModel?> getMyPurchasingEventsApi({
    void Function(int)? checkResponse,
    required String userId
  }) async {
    String apiUrl='${ApiUrlConstants.endPointOfGetPurchaseEvent}?user_id=$userId';
    GetMyPurchasingEventModel? getMyPurchasingEventModel;
    http.Response? response = await MyHttp.getMethod(
      url: apiUrl,
      checkResponse: checkResponse,
    );

    if (response != null) {
      getMyPurchasingEventModel = GetMyPurchasingEventModel.fromJson(jsonDecode(response.body));
      return getMyPurchasingEventModel;
    }
    return null;
  }
  ///Get My Wallet History Api Calling.....
  static Future<MyWalletHistoryModel?> myWalletHistoryApi({
    void Function(int)? checkResponse,
    required String userId
  }) async {
    String apiUrl='${ApiUrlConstants.endPointOfGetWalletHistory}?user_id=$userId';
    MyWalletHistoryModel? myWalletHistoryModel;
    http.Response? response = await MyHttp.getMethod(
      url: apiUrl,
      checkResponse: checkResponse,
    );

    if (response != null) {
      myWalletHistoryModel = MyWalletHistoryModel.fromJson(jsonDecode(response.body));
      return myWalletHistoryModel;
    }
    return null;
  }


  ///Get Club Purchased User List Api Calling.....
  static Future<ClubPurchasedUserModel?> getClubPurchasedUserApi({
    void Function(int)? checkResponse,
    required String clubId
  }) async {
    String apiUrl='${ApiUrlConstants.endPointOfClubPurchasedUserList}?club_id=$clubId';
    ClubPurchasedUserModel? clubPurchasedUserModel;
    http.Response? response = await MyHttp.getMethod(
      url: apiUrl,
      checkResponse: checkResponse,
    );

    if (response != null) {
      clubPurchasedUserModel = ClubPurchasedUserModel.fromJson(jsonDecode(response.body));
      return clubPurchasedUserModel;
    }
    return null;
  }

  ///Get All Club Request Api Calling.....
  static Future<GetClubRequestModel?> getAllClubRequestApi({
    void Function(int)? checkResponse,
    required String type
  }) async {
    String apiUrl='${ApiUrlConstants.endPointOfGetClubRequest}?request=$type';
    GetClubRequestModel? getClubRequestModel;
    http.Response? response = await MyHttp.getMethod(
      url: apiUrl,
      checkResponse: checkResponse,
    );

    if (response != null) {
      getClubRequestModel = GetClubRequestModel.fromJson(jsonDecode(response.body));
      return getClubRequestModel;
    }
    return null;
  }

  ///Get Current Jacket Api Calling.....
  static Future<GetCurrentJacketModel?> getCurrentJacketApi({
    void Function(int)? checkResponse,
    required String userId
  }) async {
    String apiUrl='${ApiUrlConstants.endPointOfGetCurrentJacket}?user_id=$userId';
    GetCurrentJacketModel? getCurrentJacketModel;
    http.Response? response = await MyHttp.getMethod(
      url: apiUrl,
      checkResponse: checkResponse,
    );

    if (response != null) {
      getCurrentJacketModel = GetCurrentJacketModel.fromJson(jsonDecode(response.body));
      return getCurrentJacketModel;
    }
    return null;
  }

  ///Get Wardrobe Users List Api Calling.....
  static Future<GetWardrobeUsersModel?> getWardrobeUsersListApi({
    void Function(int)? checkResponse,
    required String clubId,required String checkOut
  }) async {
    String apiUrl='${ApiUrlConstants.endPointOfGetWardrobeUserList}?club_id=$clubId&checkout=$checkOut';
    GetWardrobeUsersModel? getWardrobeUsersModel;
    http.Response? response = await MyHttp.getMethod(url: apiUrl, checkResponse: checkResponse,);
    if (response != null) {
      getWardrobeUsersModel = GetWardrobeUsersModel.fromJson(jsonDecode(response.body));
      return getWardrobeUsersModel;
    }
    return null;
  }
  ///Get Clubs Friends List Api Calling.....
  static Future<GetClubFriendModel?> getClubsFriendListApi({
    void Function(int)? checkResponse,
    required String clubId
  }) async {
    String apiUrl='${ApiUrlConstants.endPointOfGetClubFriendList}?user_id=$clubId';
    GetClubFriendModel? getClubFriendModel;
    http.Response? response = await MyHttp.getMethod(
      url: apiUrl,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getClubFriendModel = GetClubFriendModel.fromJson(jsonDecode(response.body));
      return getClubFriendModel;
    }
    return null;
  }
  ///How to earn more points Api Calling.....
  static Future<HowToEarnPointsModel?> howToEarnPointsApi({
    void Function(int)? checkResponse}) async {
    HowToEarnPointsModel? howToEarnPointsModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetEarnMorePoint,
      checkResponse: checkResponse,
    );

    if (response != null) {
      howToEarnPointsModel = HowToEarnPointsModel.fromJson(jsonDecode(response.body));
      return howToEarnPointsModel;
    }
    return null;
  }


}