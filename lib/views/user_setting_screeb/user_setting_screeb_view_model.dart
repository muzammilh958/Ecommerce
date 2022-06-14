import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:set_jet/core/logger.dart';

class UserSettingScreebViewModel extends BaseViewModel {
  Logger log;

  UserSettingScreebViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
