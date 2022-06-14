import 'dart:convert';
import 'dart:ui';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_view_indicators/animated_circle_page_indicator.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:set_jet/constants/strings.dart';
import 'package:set_jet/theme/common.dart';
import 'package:set_jet/theme/dark.dart';
import 'package:set_jet/theme/light.dart';
import 'package:set_jet/widgets/dumb_widgets/app_button.dart';
import 'package:set_jet/widgets/dumb_widgets/page_view_button.dart';
import 'package:set_jet/widgets/dumb_widgets/social_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/smart_widgets/custom_theme_switch.dart';
import 'pre_login_view_model.dart';

class PreLoginView extends StatelessWidget {
  final controller = PageController(
    viewportFraction: 1,
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PreLoginViewModel>.reactive(
      builder: (BuildContext context, PreLoginViewModel viewModel, Widget _) {
        return ThemeSwitchingArea(
          child: Builder(builder: (context) {
            var theme = Theme.of(context);
            var isLight = theme.brightness == Brightness.light;

            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                title: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    'assets/logo_${!isLight ? 'dark' : 'light'}.png',
                  ),
                ),
                actions: const [
                  CustomThemeSwitch(),
                ],
                centerTitle: true,
              ),
              body: Center(
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Image.asset("assets/aircraft_image.png"),
                      ),
                    ),
                    Column(
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 91,
                          child: PageView(
                            controller: controller,
                            onPageChanged: viewModel.pageChange,
                            children: [
                              PageViewButton(
                                  isLight: isLight, text: "Set your Dates"),
                              PageViewButton(
                                  isLight: isLight, text: "Pick your Jet..."),
                              PageViewButton(isLight: isLight, text: "Go!"),
                              PageViewButton(
                                  isLight: isLight,
                                  text:
                                      '''Private jet related searches online are filled with paid searches. How do you know which company is right for you? 
                              '''),
                              PageViewButton(
                                  isLight: isLight,
                                  text: "JetSetGo has \$0 markup."),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SmoothPageIndicator(
                          count: 5,
                          controller: controller,
                          effect: const WormEffect(
                            radius: 10,
                            dotHeight: 8,
                            dotWidth: 8,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 70,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (_, index) {
                                  return Column(
                                    children: [
                                      Text(
                                        preLoginBody,
                                        style: GoogleFonts.rubik(
                                          fontSize: 15.sp,
                                          color: Colors.grey,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: viewModel.expanded
                                            ? null
                                            : viewModel.defaultLines,
                                      ),
                                      ButtonTheme(
                                        padding: EdgeInsets.zero,
                                        child: TextButton(
                                          onPressed: viewModel.toggleReadMore,
                                          child: Text(
                                            "Read ${viewModel.expanded ? "Less" : "More"}",
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 70,
                              left: 0,
                              right: 0,
                              height: 80,
                              child: Container(
                                  // decoration: BoxDecoration(
                                  //   gradient: LinearGradient(
                                  //       begin: Alignment.topCenter,
                                  //       end: Alignment.bottomCenter,
                                  //       stops: const [
                                  //         0.0,
                                  //         1.0,
                                  //       ],
                                  //       colors: [
                                  //         theme.scaffoldBackgroundColor
                                  //             .withOpacity(0),
                                  //         theme.scaffoldBackgroundColor,
                                  //       ]),
                                  // ),
                                  // padding: const EdgeInsets.all(20),
                                  ),
                            ),
                            Positioned(
                              bottom: -10,
                              left: 20,
                              right: 20,
                              height: 100,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: AppButton(
                                      color: accentColor,
                                      textColor: Colors.white,
                                      text: "Create an Account",
                                      onpressed: () {
                                        viewModel
                                            .navigateToViewHomePostLoginScreen();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        modalDialog(
                                            context, isLight, viewModel);
                                      },
                                      child: const Text("Sign in"),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
      viewModelBuilder: () => PreLoginViewModel(),
    );
  }

  Future<void> modalDialog(
      BuildContext context, bool isLight, PreLoginViewModel viewModel) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          decoration: BoxDecoration(
            color: isLight ? Colors.white : Colors.black,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          child: SizedBox(
            height: 470,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                  color: const Color(0xFF2D2D2D),
                  textColor: Colors.white,
                  icon: "assets/social_Icon/email.png",
                  text: "Sign in with Email",
                  onpressed: () {
                    viewModel.navigateToViewLoginScreen();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SocialButton(
                  color: const Color(0xFF686868),
                  textColor: Colors.white,
                  icon: "assets/social_Icon/apple.png",
                  text: "Sign in with Apple",
                  onpressed: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                SocialButton(
                  color: const Color(0xFF4267B2),
                  textColor: Colors.white,
                  icon: "assets/social_Icon/fb.png",
                  text: "Sign in with Facebook",
                  onpressed: () async {
                    var facebookLogin = FacebookLogin();

                    var result =
                        await facebookLogin.logIn(['email', 'public_profile']);
                    FacebookAccessToken myToken = result.accessToken;

                    var facebookLoginResult = await facebookLogin.logIn(
                      ['email', 'public_profile'],
                    );

                    print(facebookLoginResult.errorMessage);
                    print("Status Facebook ");
                    print(facebookLoginResult.status.name);

                    if (facebookLoginResult.status ==
                        FacebookLoginStatus.loggedIn) {
                      FacebookAccessToken myToken =
                          facebookLoginResult.accessToken;
                      var graphResponse = await http.get(Uri.parse(
                          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=' +
                              facebookLoginResult.accessToken.token));
                      dynamic profile = json.decode(graphResponse.body);

                      String id = profile['id'];
                      String first_name = profile['first_name'];
                      String last_name = profile['last_name'];
                      String email = profile['email'];

                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      preferences.setString("UserID", id);
                      preferences.setString("first_name", first_name);
                      preferences.setString("last_name", last_name);
                      preferences.setString("email", email);

                      Fluttertoast.showToast(msg: "Facebook login success");
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SocialButton(
                  color: const Color(0xFFDB4437),
                  textColor: Colors.white,
                  icon: "assets/social_Icon/gmail.png",
                  text: "Sign in with Google",
                  onpressed: () async {
                    GoogleSignIn _googlesignin = GoogleSignIn();
                    try {
                      GoogleSignInAccount result = await _googlesignin.signIn();
                      String _googleUserEmail = result.email;
                      if (result != null) {
                        GoogleSignInAuthentication _googleAuth =
                            await result.authentication;

                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        preferences.setString("Email", result.email);
                        preferences.setString("Name", result.displayName);
                      } else {
                        return null;
                      }
                      print(result);
                    } catch (ex) {
                      print(ex);
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  child: Text(
                    "Back",
                    style: GoogleFonts.rubik(
                      color: accentColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
