import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../constants/drawer_enum.dart';
import '../../../core/locator.dart';
import '../../../core/router_constants.dart';
import '../../../theme/common.dart';
import '../custom_theme_switch.dart';
import 'custom_blurred_drawer_view_model.dart';

class CustomBlurredDrawerWidget extends StatelessWidget {
  final drawerOption;

  const CustomBlurredDrawerWidget({Key key, this.drawerOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomBlurredDrawerViewModel>.reactive(
      builder: (BuildContext context, CustomBlurredDrawerViewModel viewModel,
          Widget _) {
        var isLight = Theme.of(context).brightness == Brightness.light;
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Stack(
            children: [
              Positioned(
                bottom: -50.h,
                // height: 600.h,
                // width: MediaQuery.of(context).size.width,
                left: 0,
                right: 0,
                child: Image.asset(
                    "assets/drawer_bg_${isLight ? "light" : "dark"}.png"),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Image.asset(
                            'assets/logo_${!isLight ? 'dark' : 'light'}.png',
                            height: 41.h,
                            width: 50.w,
                          ),
                        ),
                        Expanded(child: Container())
                      ],
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/profile.png',
                        height: 40.h,
                        width: 40.w,
                      ),
                      title: Text(
                        'John Doe',
                        style: GoogleFonts.rubik(color: Colors.white),
                      ),
                      trailing: const CustomThemeSwitch(),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 20.h,
                        left: 25.w,
                        right: 25.w,
                      ),
                      decoration: BoxDecoration(
                        color: isLight
                            ? const Color(0xfff5f5f5)
                            : const Color(0xff404040),
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      child: ListTile(
                        onTap: () {
                          locator<NavigationService>()
                              .navigateTo(messagesScreenViewRoute);
                        },
                        leading: Icon(
                          Icons.mail,
                          color: accentColor,
                        ),
                        title: Text(
                          "Messages",
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Text(
                          "2",
                          style: GoogleFonts.rubik(
                              color: accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 32.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 110.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    // margin: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DrawerButton(
                          text: "Home",
                          icon: Icons.home_outlined,
                          isCurrentScreen:
                              viewModel.drawerOption == DrawerOptions.Home,
                          onPressed: viewModel.navigateHome,
                        ),
                        DrawerButton(
                          text: "Search Flights",
                          icon: Icons.search_rounded,
                          isCurrentScreen: viewModel.drawerOption ==
                              DrawerOptions.SearchFlights,
                          onPressed: viewModel.navigateSearchFlights,
                        ),
                        DrawerButton(
                          text: "Sent Requests",
                          icon: Icons.arrow_circle_up,
                          isCurrentScreen: viewModel.drawerOption ==
                              DrawerOptions.SentRequests,
                          onPressed: viewModel.navigateSentRequests,
                        ),
                        DrawerButton(
                          text: "Booked Charters",
                          icon: Icons.note_alt_outlined,
                          isCurrentScreen: viewModel.drawerOption ==
                              DrawerOptions.BookedCharters,
                          onPressed: viewModel.navigateBookCharters,
                        ),
                        DrawerButton(
                            text: "Settings",
                            icon: Icons.settings_outlined,
                            isCurrentScreen: viewModel.drawerOption ==
                                DrawerOptions.Settings,
                            onPressed: viewModel.navigateSettings),
                      ],
                    ),
                  ))
            ],
          ),
        );
      },
      viewModelBuilder: () => CustomBlurredDrawerViewModel(drawerOption),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    Key key,
    this.icon,
    this.onPressed,
    this.text,
    this.isCurrentScreen,
  }) : super(key: key);

  final IconData icon;
  final Function() onPressed;
  final String text;
  final bool isCurrentScreen;

  @override
  Widget build(BuildContext context) {
    var isLight = Theme.of(context).brightness == Brightness.light;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: MaterialButton(
        color: isCurrentScreen
            ? isLight
                ? Color(0xfff5f5f5)
                : Color(0xff404040)
            : null,
        elevation: 0,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.w),
        ),
        child: ListTile(
          leading: Icon(icon, color: isCurrentScreen ? accentColor : null),
          title: Text(
            text,
            style: GoogleFonts.rubik(
                fontSize: 18.sp, color: isCurrentScreen ? accentColor : null),
          ),
        ),
      ),
    );
  }
}
