import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:set_jet/theme/common.dart';
import 'package:set_jet/widgets/dumb_widgets/app_button.dart';
import 'package:set_jet/widgets/dumb_widgets/app_textfield.dart';
import 'package:stacked/stacked.dart';
import 'login_screen_view_model.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
    return ViewModelBuilder<LoginScreenViewModel>.reactive(
      builder:
          (BuildContext context, LoginScreenViewModel viewModel, Widget _) {
        return Builder(builder: (context) {
          var theme = Theme.of(context);
          var isLight = theme.brightness == Brightness.light;
          return Scaffold(
            key: _key,
            appBar: AppBar(
              elevation: 0,
              iconTheme: IconThemeData(
                color: !isLight
                    ? Colors.white
                    : accentColor, //change your color here
              ),
            ),
            body: Center(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 100,
                      child: Image.asset(
                        'assets/logo_${!isLight ? 'dark' : 'light'}.png',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/social_Icon/${!isLight ? 'email1' : 'email2'}.png',
                                        height: 30.h,
                                        width: 30.w,
                                      ),
                                      Text(
                                        ' Sign in with Email',
                                        style: GoogleFonts.rubik(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors
                                              .grey, //change your color here
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: AppTextField(
                                            label: 'Email',
                                            Onchange: (email) {},
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Expanded(
                                          child: AppTextField(
                                            label: 'Password',
                                            obscureText: true,
                                            Onchange: (pass) {},
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 331.w,
                                      height: 56.h,
                                      child: AppButton(
                                        color: accentColor,
                                        textColor: Colors.white,
                                        text: 'Sign in',
                                        onpressed: () {
                                          viewModel.navigateToViewHomeScreen();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            ),
          );
        });
      },
      viewModelBuilder: () => LoginScreenViewModel(),
    );
  }
}
