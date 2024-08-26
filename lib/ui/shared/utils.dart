// extension EmailValidator on String {
//   bool isValidEmail() {
//     return RegExp(
//         r'^(?:\+971|00971|0)?(?:50|51|52|55|56|2|3|4|6|7|9)\d{7}$';
//         .hasMatch(this);
//   }
// }
//____________________________________________________________________________________________

// bool isValidEmail() {
//   return RegExp(
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
//       .hasMatch(this);
// }

//____________________________________________________________________________________________

import 'package:health_app/core/enums/connectivity_status.dart';
import 'package:health_app/core/enums/message_type.dart';
import 'package:health_app/core/services/connectivity_service.dart';
import 'package:health_app/ui/shared/custom_widget/custom_toast.dart';
import 'package:health_app/ui/views/main_view/search_screen_view/search_chatgpt_controller.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:health_app/core/data/repositories/shared_preferences.dart';

extension PasswordValidator on String {
  bool isValidPassword() {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(this);
  }
}

//____________________________________________________________________________________________
bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(em);
}
//___________________________________________________________________________________________

bool checkAge(String age) {
  RegExp regex = RegExp(r'^(1[89]|[2-9]\d|\d{3,})$');
  // يتطلب العمر أن يكون 18 عامًا أو أكثر
  // سيتوافق النمط النمطي مع الأعداد بين 18 وأعلى
  return regex.hasMatch(age);
}

//_______________________________________________________________________________________________

bool isValidSyriaMobileNumber(String mobileNumber) {
  RegExp regex = RegExp(r'^(!?(\+|00)?(963)|0)?9\d{8}$');
  return regex.hasMatch(mobileNumber);
}

//___________________________________________________________________________________________

bool isValidPassword(String password, String confirmPassword) {
  RegExp regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$');
  return (password == confirmPassword) && regex.hasMatch(password);
}

//_________________________________________________________________________________

bool isValidName(String em) {
  String p = r'^[a-zA-Z]+(?:\s+[a-zA-Z]+)*$';
  RegExp regExp = RegExp(p);
  return regExp.hasMatch(em);
}
//__________________________________________________________________________________________
// bool validateEmail(String value) {
//   Pattern pattern =
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//   RegExp regex = new RegExp(pattern);
//   return (!regex.hasMatch(value)) ? false : true;
// }

//_______________________________________________________________________________________

// r'^
// (?=.*[A-Z])       // should contain at least one upper case
// (?=.*[a-z])       // should contain at least one lower case
// (?=.*?[0-9])      // should contain at least one digit
// (?=.*?[!@#\$&*~]) // should contain at least one Special character
//     .{8,}             // Must be at least 8 characters in length
// $
//_________________________________________________________________________________

bool validatePassword(String value) {
  String regex =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(regex);
  return regExp.hasMatch(value);
}

//______________________________________________________________________________________

// validator: Validators.compose([
// Validators.required('Password is required'),
// Validators.patternString(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$', 'Invalid Password')
// ]),

//_____________________________________________________________________________________________

// validator: (CurrentValue){
// var nonNullValue=CurrentValue??'';
// if(nonNullValue.isEmpty){
// return ("username is required");
// }
// if(!nonNullValue.contains("@")){
// return ("username should contains @");
// }
// return null;
// },

//________________________________________________________________________________________

// validator: (PassCurrentValue){
// RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
// var passNonNullValue=PassCurrentValue??"";
// if(passNonNullValue.isEmpty){
// return ("Password is required");
// }
// else if(passNonNullValue.length<6){
// return ("Password Must be more than 5 characters");
// }
// else if(!regex.hasMatch(passNonNullValue)){
// return ("Password should contain upper,lower,digit and Special character ");
// }
// return null;
// },

//________________________________________________________________________________________

// this is the best regx
//
// bool passValid = RegExp("^(?=.{8,32}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*").hasMatch(value);
//
// if (value.isEmpty ||!passValid)
// {
// return 'error';
// }

//_______________________________________________________________________________

// static final RegExp nameRegExp = RegExp('[a-zA-Z]');
// static final RegExp numberRegExp = RegExp(r'\d');
// validator: (value) => value.isEmpty
// ? 'Enter Your Name'
// : (nameRegExp.hasMatch(value)
// ? null
// : 'Enter a Valid Name');

//_______________________________________________________________________________
double screenWidth(percent) {
  return Get.size.width / percent;
}

double screenHeight(percent) {
  return Get.size.width / percent;
}

double get width => Get.size.width;

double get height => Get.size.height;


//___________________________________________________________________________
// Future cLaunchUrl(Uri url) async {
//   if (!await launchUrl(url,mode:LaunchMode.externalApplication)) {
//     throw Exception('Could not launch $url');
//   }
// }
//________________________________________________
void customLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(10)),
        width: screenWidth(4),
        height: screenHeight(4),
        child: SpinKitCircle(
          color:const Color.fromRGBO(187, 229, 169, 1),
          size: screenWidth(8),
        ),
      );
    });
//___________________________________________________________
SharedPreferance get storage => Get.find<SharedPreferance>();
ConnectivityService get connectivityService => Get.find<ConnectivityService>();
SearchChatgptController get searchChatgptController => Get.find<SearchChatgptController>();

bool get isOnline =>
    searchChatgptController.connectivityStatus == ConnectivityStatus.ONLINE;

bool get isOffline =>
    searchChatgptController.connectivityStatus == ConnectivityStatus.OFFLINE;


void showNoConnectionMessage() {
  CustomToast.showMessage(
      message: 'رجائاً تأكد من اتصالك بالانترنت',
      messageType: MessageType.REJECTED);
}

void checkConnection(Function function) {
  if (isOnline) {
    function();
  } else {
    showNoConnectionMessage();
  }
}