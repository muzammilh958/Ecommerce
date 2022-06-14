import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_jet/core/services/theme_service.dart';
import 'package:set_jet/theme/dark.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:get_storage/get_storage.dart';

import 'core/locator.dart';
import 'core/router_constants.dart';
import 'core/router.dart' as router;
import 'theme/light.dart';

void main() async {
  await LocatorInjector.setUpLocator();

  await GetStorage.init();
  GetStorage().writeIfNull("user-theme", "dark");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isDark = GetStorage().read<String>("user-theme") == "dark";
    //initialize screenutil
    return ThemeProvider(
      initTheme: isDark ? darkTheme : lightTheme,
      builder: (_, theme) {
        return ScreenUtilInit(
          designSize: const Size(390, 844),
          splitScreenMode: true,
          builder: (BuildContext context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              navigatorKey: locator<NavigationService>().navigatorKey,
              onGenerateRoute: router.Router.generateRoute,
              initialRoute: welcomeViewRoute,
            );
          },
        );
      },
    );
  }
}
