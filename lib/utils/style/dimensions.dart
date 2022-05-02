import 'package:get/get.dart';

class Dimensions {

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double scalingFactor = 5.6;
  static double scalingFactorTextBox = 21.1;
  static double scalingFactorTextBoxTopMargin = 8.44;
  static double scalingFactorHomePageTextBoxTopMargin = 5.62;
  static double scalingFactorHeadlineTopMargin = 8.44;
  static double scalingFactorWidthMargin = 19.5; // 43.5
  static double scalingFactorHeightMargin = 84.4; // 10

  static double scalingFactorNewsImage = 7;
  static double scalingFactorNewsImageTextBox = 8.4;
  static double scalingFactorNewsImageTextBoxSizedBoxHeight = 120;
  static double scalingFactorMaxLinesNewsImageTextBox = 281;

  static double scalingFactorNewsDetailImageHeight = 2.4;
  static double scalingFactorNewsDetailIconHeightMargin = 15.4; // 55
  static double scalingFactorNewsDetailIconSize = 52.75; // Icon 16
  static double scalingFactorNewsPreviewTextBoxWidth = 1.3; // 300

  static double scalingFactorHeightMargin5 = 168.8;
  static double scalingFactorHeightMargin15 = 56.3;
  static double scalingFactorWidthMargin20 = 42.5; // 20
  static double scalingFactorHeightMargin20 = 19.5; // 20
  static double scalingFactorWidthMargin30 = 13; // 30
  static double scalingFactorHeightMargin50 = 16.9;
  static double scalingFactorHeightMargin30 = 28.13;

  static double scalingFactorSignUpTopMargin = 10; // 84
  static double scalingFactorSignUpTextFieldHeight = 16.9; // 50
  static double scalingFactorLoginButtonHeight = 14; // 60
  static double scalingFactorLoginButtonWidth = 1.95; // 20
  static double scalingFactorLoginHeightMargin = 8.44; // 100

  static double scalingFactorDepositPreviewHeight = 9.4; // 90
  static double scalingFactorDepositPreviewWidth = 1.95; // 200







  static double pageViewContainer = screenHeight / scalingFactor;
  static double pageViewTextContainer = screenHeight / scalingFactorTextBox;
  static double pageViewTextContainerTopMargin = screenHeight / scalingFactorTextBoxTopMargin;
  static double homePageTextContainerTopMargin = screenHeight / scalingFactorHomePageTextBoxTopMargin;
  static double headlineTopMargin = screenHeight / scalingFactorHeadlineTopMargin;
  static double widthMargin = screenWidth / scalingFactorWidthMargin;
  static double heightMargin = screenHeight / scalingFactorHeightMargin;

  static double newsImageHeightWidth = screenHeight / scalingFactorNewsImage;
  static double newsImageTextBoxHeight = screenHeight / scalingFactorNewsImageTextBox;
  static double newsImageTextBoxSizedBoxHeight = screenHeight / scalingFactorNewsImageTextBoxSizedBoxHeight;
  static int maxLinesNewsImageTextBox = (screenHeight / scalingFactorMaxLinesNewsImageTextBox).floor();

  static double newsDetailImageHeight = screenHeight / scalingFactorNewsDetailImageHeight;
  static double newsDetailIconHeightMargin = screenHeight / scalingFactorNewsDetailIconHeightMargin;
  static double newsDetailIconSize = screenHeight / scalingFactorNewsDetailIconSize;
  static double newsPreviewTextBoxWidth = screenWidth / scalingFactorNewsPreviewTextBoxWidth;

  static double heightMargin5 = screenHeight / scalingFactorHeightMargin5;
  static double heightMargin15 = screenHeight / scalingFactorHeightMargin15;
  static double widthMargin20 = screenHeight / scalingFactorWidthMargin20;
  static double widthMargin30 = screenWidth / scalingFactorWidthMargin30;
  static double heightMargin20 = screenWidth / scalingFactorHeightMargin20;
  static double heightMargin30 = screenHeight / scalingFactorHeightMargin30;
  static double heightMargin50 = screenHeight / scalingFactorHeightMargin50;

  static double signUpPageTopMargin = screenHeight / scalingFactorSignUpTopMargin;
  static double signUpPageTextFieldHeight = screenHeight / scalingFactorSignUpTextFieldHeight;
  static double loginButtonHeight = screenHeight / scalingFactorLoginButtonHeight;
  static double loginButtonWidth = screenWidth / scalingFactorLoginButtonWidth;
  static double loginHeightMargin = screenHeight / scalingFactorLoginHeightMargin;

  static double depositPreviewHeight = screenHeight / scalingFactorDepositPreviewHeight;
  static double depositPreviewWidth = screenWidth / scalingFactorDepositPreviewWidth;


}