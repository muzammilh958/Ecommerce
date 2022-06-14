import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:set_jet/constants/drawer_enum.dart';
import 'package:set_jet/theme/common.dart';
import 'package:set_jet/widgets/smart_widgets/custom_blurred_drawer/custom_blurred_drawer_widget.dart';
import 'package:set_jet/widgets/smart_widgets/custom_theme_switch.dart';
import 'package:stacked/stacked.dart';
import 'user_setting_screeb_view_model.dart';

class UserSettingScreebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserSettingScreebViewModel>.reactive(
      builder: (BuildContext context, UserSettingScreebViewModel viewModel,
          Widget _) {
        var scaffoldKey = GlobalKey<ScaffoldState>();
        return Builder(builder: (context) {
          var theme = Theme.of(context);
          var isLight = theme.brightness == Brightness.light;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              elevation: 0,
              leading: MaterialButton(
                child: Image.asset(
                    'assets/drawer_${!isLight ? 'dark' : 'light'}.png'),
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
              ),
              automaticallyImplyLeading: false,
              title: SizedBox(
                height: 50.h,
                width: 50.w,
                child: Image.asset(
                  'assets/logo_${!isLight ? 'dark' : 'light'}.png',
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.125,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 70.h,
                                width: 70.w,
                                child: Image.asset(
                                  'assets/profile.png',
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'John Doe',
                                    style: GoogleFonts.rubik(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: !isLight
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  GestureDetector(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.logout_outlined,
                                            size: 20,
                                            color: !isLight
                                                ? Color(0xFF7C7C7C)
                                                : Color(0xFFA7A7A7),
                                          ),
                                          Text(
                                            'Logout',
                                            style: GoogleFonts.rubik(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: !isLight
                                                  ? Color(0xFF7C7C7C)
                                                  : Color(0xFFA7A7A7),
                                            ),
                                          )
                                        ],
                                      ),
                                      onTap: () {})
                                ],
                              ),
                            ],
                          ),
                          const CustomThemeSwitch(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          SettingTile(
                            isLight: isLight,
                            title: 'Profile',
                            subtitle: 'Edit Profile',
                            icon: 'assets/settingIcon/person.png',
                            iconSize: 20.h,
                            onpressed: () {},
                          ),
                          SettingTile(
                            isLight: isLight,
                            title: 'Password',
                            subtitle: 'Change Password',
                            icon: 'assets/settingIcon/password.png',
                            iconSize: 11.h,
                            onpressed: () {},
                          ),
                          SettingTile(
                            isLight: isLight,
                            title: 'Email',
                            subtitle: 'Edit your email',
                            icon: 'assets/settingIcon/mail.png',
                            iconSize: 14.h,
                            onpressed: () {},
                          ),
                          SettingTile(
                            isLight: isLight,
                            title: 'Phone Number',
                            subtitle: 'Edit your phone number',
                            icon: 'assets/settingIcon/mobile.png',
                            iconSize: 23.h,
                            onpressed: () {},
                          ),
                          SettingTile(
                            isLight: isLight,
                            title: 'Timezone',
                            subtitle: 'Change your timezone',
                            icon: 'assets/settingIcon/time.png',
                            iconSize: 16.h,
                            onpressed: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            drawer: const CustomBlurredDrawerWidget(
                drawerOption: DrawerOptions.Settings),
          );
        });
      },
      viewModelBuilder: () => UserSettingScreebViewModel(),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    Key key,
    @required this.isLight,
    this.icon,
    this.title,
    this.subtitle,
    this.onpressed,
    this.iconSize,
  }) : super(key: key);

  final bool isLight;
  final icon;
  final title;
  final subtitle;
  final onpressed;
  final iconSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        height: 70.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: !isLight ? Colors.black : Color(0xFFF1F1F1),
        ),
        child: MaterialButton(
          onPressed: onpressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 25.0),
                    child: Image.asset(
                      icon,
                      height: iconSize,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: accentColor,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        subtitle,
                        style: GoogleFonts.rubik(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color:
                              !isLight ? Color(0xFFB7B7B7) : Color(0xFF242424),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: !isLight ? Colors.white : Colors.black,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
