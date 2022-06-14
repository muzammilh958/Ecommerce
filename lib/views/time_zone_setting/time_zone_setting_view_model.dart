import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:set_jet/core/locator.dart';
import 'package:set_jet/core/router_constants.dart';
import 'package:stacked/stacked.dart';
import 'package:set_jet/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class TimeZoneSettingViewModel extends BaseViewModel {
  Logger log;
  final _navService = locator<NavigationService>();
  final toggleIndex = ValueNotifier<int>(0);
  final List<String> dropdownValues = ["EST (ISTANBUL)", 'EST (ISTANBUL)'];

  void timeZoneIndex(index) {
    toggleIndex.value = index;
    notifyListeners();
  }

  navigateToHome() {
    _navService.navigateTo(homeViewRoute);
  }

  TimeZoneSettingViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
