import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:set_jet/theme/common.dart';
import 'package:stacked/stacked.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'time_zone_setting_view_model.dart';

class TimeZoneSettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TimeZoneSettingViewModel>.reactive(
      builder:
          (BuildContext context, TimeZoneSettingViewModel viewModel, Widget _) {
        return Builder(builder: (context) {
          var theme = Theme.of(context);
          var isLight = theme.brightness == Brightness.light;
          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                title: SizedBox(
                  height: 50.h,
                  width:50.w,
                  child: Image.asset(
                    'assets/logo_${!isLight ? 'dark' : 'light'}.png',
                  ),
                ),
                centerTitle: true,
              ),
              body: Center(
                  child: Column(
                children: [
                  Expanded(
                    flex: 12,
                    child: Center(
                        child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Timezone Settings',
                                style: GoogleFonts.rubik(
                                    color: !isLight
                                        ? Color(0xFFA7A7A7)
                                        : Color(0xFF7C7C7C),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp)),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Text('Detected Timezone',
                                  style: GoogleFonts.rubik(
                                      color: !isLight
                                          ? Color(0xFFA7A7A7)
                                          : Color(0xFF7C7C7C),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp)),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text('EST (ISTANBUL)',
                                  style: GoogleFonts.rubik(
                                      color: accentColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24.sp)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Container(
                                height: 62.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: !isLight
                                      ? Colors.black
                                      : Color(0xFFF1F1F1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Set Automatically',
                                            style: GoogleFonts.rubik(
                                                color: !isLight
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15.sp)),
                                        ToggleSwitch(
                                          minWidth: 60.w,
                                          cornerRadius: 6.0,
                                          activeBgColors: [
                                            [accentColor],
                                            [accentColor]
                                          ],
                                          activeFgColor: Colors.white,
                                          inactiveBgColor: !isLight
                                              ? Color(0xFF404040)
                                              : Colors.white,
                                          inactiveFgColor: Color(0xFF707070),
                                          initialLabelIndex: 1,
                                          totalSwitches: 2,
                                          labels: ['Yes', 'No'],
                                          radiusStyle: true,
                                          onToggle: (index) {
                                            // viewModel.timeZoneIndex(index);
                                          },
                                        ),
                                      ]),
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              Text('Or Select Timezone Manually',
                                  style: GoogleFonts.rubik(
                                      color: !isLight
                                          ? Color(0xFFA7A7A7)
                                          : Color(0xFF7C7C7C),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp)),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: IgnorePointer(
                                  ignoring: viewModel.toggleIndex.value == 0
                                      ? true
                                      : false,
                                  child: DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Timezones',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                    ),
                                    items: ['EST (ISTANBUL)', 'UTC']
                                        .map((value) => DropdownMenuItem(
                                              child: Text(value,
                                                  style: GoogleFonts.rubik(
                                                      color: !isLight
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16.sp)),
                                              value: value,
                                            ))
                                        .toList(),
                                    onChanged: (String value) {},
                                    isExpanded: false,
                                    value: viewModel.dropdownValues.first,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    )),
                  ),
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
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
                                            fontSize: 16.sp,
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
                                      Navigator.pop(context);
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
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  onPressed: viewModel.navigateToHome,
                                  child: Text(
                                    "Next",
                                    style: GoogleFonts.rubik(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Colors.white, //change your color here
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              )));
        });
      },
      viewModelBuilder: () => TimeZoneSettingViewModel(),
    );
  }
}
