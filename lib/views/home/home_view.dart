import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:set_jet/theme/common.dart';
import 'package:set_jet/widgets/dumb_widgets/ad_section.dart';
import 'package:set_jet/widgets/dumb_widgets/new_flights_header.dart';
import 'package:set_jet/widgets/dumb_widgets/previos_flights.dart';
import 'package:set_jet/widgets/smart_widgets/custom_blurred_drawer/custom_blurred_drawer_view_model.dart';
import 'package:set_jet/widgets/smart_widgets/custom_blurred_drawer/custom_blurred_drawer_widget.dart';

import 'package:set_jet/widgets/smart_widgets/custom_theme_switch.dart';
import 'package:stacked/stacked.dart';
import '../../constants/drawer_enum.dart';
import '../../widgets/dumb_widgets/header_widget.dart';
import '../../widgets/dumb_widgets/notification_panel.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (BuildContext context, HomeViewModel viewModel, Widget _) {
        var isLight = Theme.of(context).brightness == Brightness.light;
        var scaffoldKey = GlobalKey<ScaffoldState>();
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: isLight ? const Color(0xffF1F1F1) : Colors.black,
            elevation: 0,
            title: Image.asset(
              'assets/logo_${!isLight ? 'dark' : 'light'}.png',
              height: 41.h,
              width: 50.w,
            ),
            centerTitle: true,
            leading: MaterialButton(
              child: Image.asset(
                  'assets/drawer_${!isLight ? 'dark' : 'light'}.png'),
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(right: 25.w),
                child: CircleAvatar(
                  backgroundImage: const AssetImage(
                    "assets/profile.png",
                  ),
                  radius: 20.h,
                ),
              )
            ],
          ),
          body: Stack(
            children: [
              Container(
                height: 100.h,
                color: isLight ? const Color(0xffF1F1F1) : Colors.black,
              ),
              ListView(
                children: const [
                  HeaderWidget(
                    messages: 2,
                    booked: 2,
                  ),
                  NotificationPanel(),
                  AdSection(),
                  NewFlightsHeader(),
                  PreviousFlights(),
                ],
              )
            ],
          ),
          drawer:
              const CustomBlurredDrawerWidget(drawerOption: DrawerOptions.Home),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
