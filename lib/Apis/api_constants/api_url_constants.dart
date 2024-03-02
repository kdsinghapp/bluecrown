class ApiUrlConstants {
  //https://bluecrownaccess.se/bluecrown/webservice/signup
  //https://server-php-7-3.technorizen.com/bluecrown/

  static const String baseUrlMain =
      'https://server-php-7-3.technorizen.com/bluecrown/';
  static const String baseUrl = '$baseUrlMain/webservice/';
  static const String endPointOfSignUp = '${baseUrl}signup';
  static const String endPointOfVipUserSignUp = '${baseUrl}vip_user_signup';
  static const String endPointOfHostSignUp = '${baseUrl}host_signup';
  static const String endPointOfVipHostSignUp = '${baseUrl}host_direct_signup';
  static const String endPointOfCategory = '${baseUrl}get_category';
  static const String endPointOfGetParties = '${baseUrl}get_parties';
  static const String endPointOfForgot = '${baseUrl}forgot_password';
  static const String endPointOfCheckOtp = '${baseUrl}check_otp';
  static const String endPointOfResetPassword = '${baseUrl}reset_password';
  static const String endPointOfChangePassword = '${baseUrl}change_password';
  static const String endPointOfUserCategory = '${baseUrl}get_user_category';
  static const String endPointOfPrivacyPolicy = '${baseUrl}get_privacy_policy';
  static const String endPointOfTermsCondition =
      '${baseUrl}get_terms_conditions';
  static const String endPointOfGetClubList = '${baseUrl}get_club';
  static const String endPointOfGetFriendList = '${baseUrl}get_friend_list';
  static const String endPointOfSubmitFriendsRequest =
      '${baseUrl}send_request_to_friend';
  static const String endPointOfClubAddCostomerRequest =
      '${baseUrl}add_club_friend';
  static const String endPointOfAddEvent = '${baseUrl}add_event';
  static const String endPointOfUpdateEvent = '${baseUrl}update_event';
  static const String endPointOfUpdateClubRequest =
      '${baseUrl}update_club_request';
  static const String endPointOfGetMyPublishEvent =
      '${baseUrl}get_my_publish_event';
  static const String endPointOfGetNotification = '${baseUrl}get_notification';
  static const String endPointOfGetClubHanger = '${baseUrl}get_club_hanger';
  static const String endPointOfHangJacket = '${baseUrl}hang_jacket';
  static const String endPointOfGetClubRequest = '${baseUrl}get_club_request';
  static const String endPointOfGetCurrentJacket =
      '${baseUrl}get_current_jacket';
  static const String endPointOfGetEarnMorePoint =
      '${baseUrl}get_earn_more_point';
  static const String endPointOfGetWardrobeUserList =
      '${baseUrl}get_wardrobe_user_list';
  static const String endPointOfGetClubFriendList =
      '${baseUrl}get_club_friend_list';
  static const String endPointOfBookEvent = '${baseUrl}book_event';
  static const String endPointOfGetBookingRequest =
      '${baseUrl}get_booking_request';
  static const String endPointOfGetMyBookingEventRequest =
      '${baseUrl}get_user_booking_request';
  static const String endPointOfChangeBookEventStatus =
      '${baseUrl}book_event_status';
  static const String endPointOfAddHanger = '${baseUrl}add_club_hanger';
  static const String endPointOfScanEventQrCode =
      '${baseUrl}scane_event_qrcode';
  static const String endPointOfGetWalletByClubIdUserId =
      '${baseUrl}get_club_wallet';
  static const String endPointOfAddPurchaseEvent =
      '${baseUrl}add_purchase_event';
  static const String endPointOfGetPurchaseEvent =
      '${baseUrl}get_purchase_event';
  static const String endPointOfGetWalletHistory =
      '${baseUrl}get_wallet_history';
  static const String endPointOfClubPurchasedUserList =
      '${baseUrl}get_purchase_event_club';

  static const String endPointOfUpdateProfile = '${baseUrl}update_profile';
  static const String endPointOfLogin = '${baseUrl}login';
  static const String endPointOfGetProfile = '${baseUrl}get_profile';
  static const String endPointOfLogout = '${baseUrl}logout';
  static const String endPointOfDeleteAccount = '${baseUrl}delete_account';
  static const String endPointOfNotification = '${baseUrl}get_notifications';
}
