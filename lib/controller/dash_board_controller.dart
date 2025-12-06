import 'package:moto/constant/constant.dart';
import 'package:moto/constant/show_toast_dialog.dart';
import 'package:moto/ui/auth_screen/login_screen.dart';
import 'package:moto/ui/bank_details/bank_details_screen.dart';
import 'package:moto/ui/chat_screen/inbox_screen.dart';
import 'package:moto/ui/freight/freight_screen.dart';
import 'package:moto/ui/home_screens/home_screen.dart';
import 'package:moto/ui/intercity_screen/home_intercity_screen.dart';
import 'package:moto/ui/online_registration/online_registartion_screen.dart';
import 'package:moto/ui/profile_screen/profile_screen.dart';
import 'package:moto/ui/settings_screen/setting_screen.dart';
import 'package:moto/ui/subscription_plan_screen/subscription_history.dart';
import 'package:moto/ui/subscription_plan_screen/subscription_list_screen.dart';
import 'package:moto/ui/vehicle_information/vehicle_information_screen.dart';
import 'package:moto/ui/wallet/wallet_screen.dart';
import 'package:moto/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController {
  RxList<DrawerItem> drawerItems = <DrawerItem>[].obs;

  getDrawerItemWidget(int pos) {
    if (Constant.isSubscriptionModelApplied == true) {
      switch (pos) {
        case 0:
          return const HomeScreen();
        // case 1:
        //   return const OrderScreen();
        case 1:
          return const HomeIntercityScreen();
        // case 2:
        //   return const OrderIntercityScreen();
        case 2:
          return const FreightScreen();
        case 3:
          return const WalletScreen();
        case 4:
          return const BankDetailsScreen();
        case 5:
          return const InboxScreen();
        case 6:
          return const ProfileScreen();
        case 7:
          if (Constant.isVerifyDocument == true) {
            return const OnlineRegistrationScreen();
          } else {
            return const VehicleInformationScreen();
          }
        case 8:
          return Constant.isVerifyDocument == true ? const VehicleInformationScreen() : const SettingScreen();
        case 9:
          return Constant.isVerifyDocument == true ? const SettingScreen() : const SubscriptionListScreen();
        case 10:
          return Constant.isVerifyDocument == true ? const SubscriptionListScreen() : const SubscriptionHistory();
        case 11:
          return Constant.isVerifyDocument == true ? const SubscriptionHistory() : const Text("Error");
        default:
          return const Text("Error");
      }
    } else {
      switch (pos) {
        case 0:
          return const HomeScreen();
        // case 1:
        //   return const OrderScreen();
        case 1:
          return const HomeIntercityScreen();
        // case 2:
        //   return const OrderIntercityScreen();
        case 2:
          return const FreightScreen();
        case 3:
          return const WalletScreen();
        case 4:
          return const BankDetailsScreen();
        case 5:
          return const InboxScreen();
        case 6:
          return const ProfileScreen();
        case 7:
          if (Constant.isVerifyDocument == true) {
            return const OnlineRegistrationScreen();
          } else {
            return const VehicleInformationScreen();
          }
        case 8:
          return Constant.isVerifyDocument == true ? const VehicleInformationScreen() : const SettingScreen();
        case 9:
          return Constant.isVerifyDocument == true ? const SettingScreen() : const SubscriptionHistory();
        case 10:
          return Constant.isVerifyDocument == true ? const SubscriptionHistory() : const Text("Error");
        default:
          return const Text("Error");
      }
    }
  }

  RxInt selectedDrawerIndex = 0.obs;

  onSelectItem(int index) async {
    if (Constant.isSubscriptionModelApplied == true) {
      if (Constant.isVerifyDocument == true ? index == 12 : index == 11) {
        await FirebaseAuth.instance.signOut();
        Get.offAll(const LoginScreen());
      } else {
        selectedDrawerIndex.value = index;
      }
    } else {
      if (Constant.isVerifyDocument == true ? index == 11 : index == 10) {
        await FirebaseAuth.instance.signOut();
        Get.offAll(const LoginScreen());
      } else {
        selectedDrawerIndex.value = index;
      }
    }

    Get.back();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    setDrawerList();
    getLocation();
    super.onInit();
  }

  setDrawerList() {
    if (Constant.isSubscriptionModelApplied == true) {
      drawerItems.value = [
        DrawerItem('City'.tr, "assets/icons/ic_city.svg"),
        // DrawerItem('Rides'.tr, "assets/icons/ic_order.svg"),
        DrawerItem('OutStation'.tr, "assets/icons/ic_intercity.svg"),
        // DrawerItem('OutStation Rides'.tr, "assets/icons/ic_order.svg"),
        DrawerItem('Freight'.tr, "assets/icons/ic_freight.svg"),
        DrawerItem('My Wallet'.tr, "assets/icons/ic_wallet.svg"),
        DrawerItem('Bank Details'.tr, "assets/icons/ic_profile.svg"),
        DrawerItem('Inbox'.tr, "assets/icons/ic_inbox.svg"),
        DrawerItem('Profile'.tr, "assets/icons/ic_profile.svg"),
        if (Constant.isVerifyDocument == true) DrawerItem('Online Registration'.tr, "assets/icons/ic_document.svg"),
        DrawerItem('Vehicle Information'.tr, "assets/icons/ic_city.svg"),
        DrawerItem('Settings'.tr, "assets/icons/ic_settings.svg"),
        DrawerItem('Subscription'.tr, "assets/icons/ic_subscription.svg"),
        DrawerItem('Subscription History'.tr, "assets/icons/ic_subscription_history.svg"),
        DrawerItem('Log out'.tr, "assets/icons/ic_logout.svg"),
      ];
    } else {
      drawerItems.value = [
        DrawerItem('City'.tr, "assets/icons/ic_city.svg"),
        // DrawerItem('Rides'.tr, "assets/icons/ic_order.svg"),
        DrawerItem('OutStation'.tr, "assets/icons/ic_intercity.svg"),
        // DrawerItem('OutStation Rides'.tr, "assets/icons/ic_order.svg"),
        DrawerItem('Freight'.tr, "assets/icons/ic_freight.svg"),
        DrawerItem('My Wallet'.tr, "assets/icons/ic_wallet.svg"),
        DrawerItem('Bank Details'.tr, "assets/icons/ic_profile.svg"),
        DrawerItem('Inbox'.tr, "assets/icons/ic_inbox.svg"),
        DrawerItem('Profile'.tr, "assets/icons/ic_profile.svg"),
        if (Constant.isVerifyDocument == true) DrawerItem('Online Registration'.tr, "assets/icons/ic_document.svg"),
        DrawerItem('Vehicle Information'.tr, "assets/icons/ic_city.svg"),
        DrawerItem('Settings'.tr, "assets/icons/ic_settings.svg"),
        DrawerItem('Subscription History'.tr, "assets/icons/ic_subscription_history.svg"),
        DrawerItem('Log out'.tr, "assets/icons/ic_logout.svg"),
      ];
    }
  }

  getLocation() async {
    await Utils.determinePosition();
  }

  Rx<DateTime> currentBackPressTime = DateTime.now().obs;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime.value) > const Duration(seconds: 2)) {
      currentBackPressTime.value = now;
      ShowToastDialog.showToast(
        "Double press to exit",
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}

class DrawerItem {
  String title;
  String icon;

  DrawerItem(this.title, this.icon);
}
