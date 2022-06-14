import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:set_jet/theme/common.dart';
import 'package:set_jet/widgets/dumb_widgets/app_button.dart';
import 'package:set_jet/widgets/dumb_widgets/app_textfield.dart';
import 'package:set_jet/widgets/dumb_widgets/container_selector.dart';
import 'package:set_jet/widgets/dumb_widgets/page_view_button.dart';
import 'package:set_jet/widgets/dumb_widgets/social_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';
import 'post_login_screen_view_model.dart';

class PostLoginScreenView extends StatelessWidget {
  TextEditingController textcontroller = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 5;
  bool hasError = false;
  String errorMessage;
  final controller = PageController(
    viewportFraction: 1,
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostLoginScreenViewModel>.reactive(
      builder:
          (BuildContext context, PostLoginScreenViewModel viewModel, Widget _) {
        return Builder(builder: (context) {
          var theme = Theme.of(context);
          var isLight = theme.brightness == Brightness.light;
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
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
                height: MediaQuery.of(context).size.height / 1.2,
                child: Center(
                  child: Column(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10, top: 15),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 28.0, right: 28.0),
                                    child: Container(
                                      color: !isLight
                                          ? Color(0xFF3A3A3A)
                                          : Color(0xFFE9E9E9),
                                      height: 5.h,
                                    ),
                                  ),
                                  SmoothPageIndicator(
                                    count: 6,
                                    controller: controller,
                                    effect: SlideEffect(
                                      radius: 4.0,
                                      spacing: 0.0,
                                      dotWidth: 60.0.h,
                                      dotHeight: 5.0.h,
                                      dotColor: !isLight
                                          ? Color(0xFF3A3A3A)
                                          : Color(0xFFE9E9E9),
                                      paintStyle: PaintingStyle.fill,
                                      activeDotColor:
                                          !isLight ? Colors.white : accentColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 18,
                            child: Center(
                              child: PageView(
                                controller: controller,
                                onPageChanged: viewModel.pageChange,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 50.0, right: 50.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ContainerSelector(
                                          isLight: isLight,
                                          title: 'User',
                                          icon: Icons.person,
                                          subtitle:
                                              'Signup as user to search \nflights',
                                          value: viewModel.selector.value,
                                          onpressed: () {
                                            viewModel.OptionSelector();
                                          },
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        ContainerSelector(
                                          isLight: isLight,
                                          title: 'Operator',
                                          icon: Icons.airplanemode_on,
                                          subtitle:
                                              'Signup as operator to list \nflights',
                                          value: !viewModel.selector.value,
                                          onpressed: () {
                                            viewModel.OptionSelector();
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 50.0, right: 50.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppTextField(
                                          label: 'First Name',
                                          Onchange: (val) {},
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        AppTextField(
                                          label: 'Last Name',
                                          Onchange: (val) {},
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 50.0, right: 50.0, top: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppTextField(
                                          label: 'Email',
                                          Onchange: (val) {},
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Container(
                                          width: 331.w,
                                          height: 75.h,
                                          child: IntlPhoneField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                filled: true,
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[800]),
                                                labelText: 'Phone Number',
                                                fillColor: Colors.transparent),
                                            onChanged: (phone) {
                                              print(phone.completeNumber);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'Enter the code that sent',
                                            style: GoogleFonts.rubik(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFA7A7A7),
                                            ),
                                          ),
                                          RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: <TextSpan>[
                                              TextSpan(
                                                text: "to ",
                                                style: GoogleFonts.rubik(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFFA7A7A7),
                                                ),
                                              ),
                                              TextSpan(
                                                text: "example@gmail.com",
                                                style: GoogleFonts.rubik(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: accentColor,
                                                ),
                                              ),
                                            ]),
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: 100.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            PinCodeTextField(
                                              autofocus: true,
                                              pinBoxColor: !isLight
                                                  ? Color(0xFF3A3A3A)
                                                  : Color(0xFFD3D3D3),
                                              controller: textcontroller,
                                              hideCharacter: true,
                                              highlight: true,
                                              highlightColor: Colors.blue,
                                              pinBoxRadius: 10,
                                              defaultBorderColor: !isLight
                                                  ? Color(0xFF3A3A3A)
                                                  : Color(0xFFD3D3D3),
                                              hasTextBorderColor: Colors.green,
                                              highlightPinBoxColor: !isLight
                                                  ? Color(0xFF3A3A3A)
                                                  : Color(0xFFD3D3D3),
                                              maxLength: 5,
                                              hasError: hasError,
                                              onTextChanged: (text) {
                                                thisText = text;
                                              },
                                              onDone: (text) {},
                                              pinBoxWidth: 60.w,
                                              pinBoxHeight: 60.h,
                                              hasUnderline: true,
                                              wrapAlignment:
                                                  WrapAlignment.spaceBetween,
                                              pinTextStyle:
                                                  TextStyle(fontSize: 22.0),
                                              pinTextAnimatedSwitcherTransition:
                                                  ProvidedPinBoxTextAnimation
                                                      .scalingTransition,
                                              pinTextAnimatedSwitcherDuration:
                                                  Duration(milliseconds: 300),
                                              highlightAnimationBeginColor:
                                                  Colors.black,
                                              highlightAnimationEndColor:
                                                  Color(0xFF3A3A3A),
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 50.0, right: 50.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '120 seconds remaining',
                                              style: GoogleFonts.rubik(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFFA7A7A7),
                                              ),
                                            ),
                                            AppButton(
                                              text: 'Send',
                                              textColor: !isLight
                                                  ? Color(0xFF848484)
                                                  : Color(0xFF9A9A9A),
                                              color: !isLight
                                                  ? Color(0xFF3A3A3A)
                                                  : Color(0xFFE9E9E9),
                                              onpressed: () {},
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            AppButton(
                                              text: 'SKIP',
                                              textColor: !isLight
                                                  ? Color(0xFF0982F4)
                                                  : Color(0xFF0982F4),
                                              color: !isLight
                                                  ? Color(0xFF194A77)
                                                  : Color(0xFF9DCDFB),
                                              onpressed: () {},
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: accentColor,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Image.asset(
                                                  'assets/delete.png',
                                                  height: 20.h,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          height: 250.h,
                                          width: 250.w,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/profile.png'),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Container(
                                          width: 120.w,
                                          height: 56.h,
                                          child: MaterialButton(
                                            onPressed: () {},
                                            color: !isLight
                                                ? Colors.white
                                                : Colors.black,
                                            textColor: !isLight
                                                ? accentColor
                                                : Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    flex: 3,
                                                    child: Image.asset(
                                                      !isLight
                                                          ? 'assets/upload_dark.png'
                                                          : 'assets/upload_light.png',
                                                      height: 23.h,
                                                    )),
                                                Expanded(
                                                  flex: 5,
                                                  child: Text(
                                                    'Upload',
                                                    style: GoogleFonts.rubik(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Expanded(
                                          flex: 20,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: !isLight
                                                  ? Colors.black
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: const Color(0xff707070),
                                              ),
                                            ),
                                            margin: const EdgeInsets.only(
                                              top: 30,
                                              left: 30,
                                              right: 30,
                                            ),
                                            height: 51.h,
                                            width: 380.w,
                                            child: SingleChildScrollView(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'LEGAL DOCUMENT',
                                                      style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16.sp,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Text(
                                                      "       Malesuada tincidunt ante condimentum eget pulvinar id vulputate sit ut. Nibh quis etiam nibh nullam diam auctor. Eu a tellus molestie urna nulla odio nunc. Facilisi vitae molestie quam semper bibendum. Aliquet mi dictum purus feugiat lorem bibendum diam pharetra. Faucibus amet, mi senectus purus. Tellus viverra non adipiscing velit arcu, massa commodo commodo, eget. Amet, ut mauris non pellentesque tellus dolor vivamus \n \n      Nunc eu neque ultrices tristique. A viverra amet interdum lacus, amet sed. Auctor pellentesque pharetra ullamcorper ornare auctor varius egestas rhoncus, lobortis. Tristique egestas et aliquam libero ultrices auctor. Quis fusce proin neque felis felis magna. In tempus massa ullamcorper viverra. Tincidunt senectus luctus lectus blandit tortor. Ipsum sollicitudin arcu sit amet rutrum semper turpis amet, ut. Blandit habitasse sit pulvinar donec sit in massa convallis quis. Rhoncus massa nisl commodo pulvinar placerat tincidunt posuere ac Lectus malesuada mattis tristique arcu, in consequat cursus id. Adipiscing consectetur lectus auctor amet odio suspendisse varius sit tellus. Lectus a mauris nulla dui scelerisque.Quis fusce proin neque felis felis magna. In tempus massa ullamcorper viverra. Tincidunt senectus luctus lectus blandit tortor. Ipsum sollicitudin arcu sit amet rutrum semper turpis amet, ut. Blandit habitasse sit pulvinar donec sit in massa convallis quis. Rhoncus massa nisl commodo pulvinar placerat tincidunt posuere ac.",
                                                      style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14.sp,
                                                      ),
                                                    ),
                                                  ]),
                                            )),
                                          )),
                                      Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 35.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color: accentColor,
                                                          width: 2.3),
                                                    ),
                                                    width: 24.w,
                                                    height: 24.h,
                                                    child: Checkbox(
                                                        checkColor: accentColor,
                                                        fillColor: MaterialStateProperty
                                                            .resolveWith((_) =>
                                                                Colors
                                                                    .transparent),
                                                        activeColor:
                                                            Colors.transparent,
                                                        value: viewModel
                                                            .checkBoxValue
                                                            .value,
                                                        tristate: false,
                                                        onChanged: (val) {
                                                          viewModel
                                                              .ChangeCheckboxValue();
                                                        }),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                RichText(
                                                  textAlign: TextAlign.left,
                                                  text: TextSpan(children: <
                                                      TextSpan>[
                                                    TextSpan(
                                                      text:
                                                          " I have read and agree the\n",
                                                      style: GoogleFonts.rubik(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: !isLight
                                                            ? Color(0xFFA7A7A7)
                                                            : Color(0xFF848484),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "Terms and Conditions ",
                                                      style: GoogleFonts.rubik(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: accentColor,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: "and",
                                                      style: GoogleFonts.rubik(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: !isLight
                                                            ? Color(0xFFA7A7A7)
                                                            : Color(0xFF848484),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: " Privacy Policy",
                                                      style: GoogleFonts.rubik(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: accentColor,
                                                      ),
                                                    ),
                                                  ]),
                                                )
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, right: 30.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: MaterialButton(
                                            elevation: 0,
                                            color: !isLight
                                                ? Color(0xFF242424)
                                                : Colors.white,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.arrow_back_ios,
                                                  color: !isLight
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                Text(
                                                  'Back',
                                                  style: GoogleFonts.rubik(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: !isLight
                                                        ? Colors.white
                                                        : Colors
                                                            .black, //change your color here
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onPressed: () {
                                              controller.previousPage(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease);
                                              if (controller.page == 0) {
                                                Navigator.pop(context);
                                              }
                                            })),
                                    Expanded(
                                      child: Container(),
                                      flex: 2,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: SizedBox(
                                        height: 50.h,
                                        width: 20.w,
                                        child: MaterialButton(
                                          color: accentColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          onPressed: () {
                                            controller.nextPage(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.ease);
                                            if (controller.page == 5) {
                                              viewModel
                                                  .navigateToViewTimeZoneScreen();
                                            }
                                          },
                                          child: Text(
                                            "Next",
                                            style: GoogleFonts.rubik(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors
                                                  .white, //change your color here
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      },
      viewModelBuilder: () => PostLoginScreenViewModel(),
    );
  }
}
