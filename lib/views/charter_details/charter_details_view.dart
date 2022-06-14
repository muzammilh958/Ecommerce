import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:set_jet/constants/drawer_enum.dart';
import 'package:set_jet/theme/common.dart';
import 'package:set_jet/theme/dark.dart';
import 'package:set_jet/theme/light.dart';
import 'package:set_jet/views/search/widgets/flight_features.dart';
import 'package:set_jet/widgets/dumb_widgets/ad_section.dart';
import 'package:set_jet/widgets/smart_widgets/custom_blurred_drawer/custom_blurred_drawer_widget.dart';
import 'package:stacked/stacked.dart';
import 'charter_details_view_model.dart';

class CharterDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isLight = Theme.of(context).brightness == Brightness.light;
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return ViewModelBuilder<CharterDetailsViewModel>.reactive(
      builder:
          (BuildContext context, CharterDetailsViewModel viewModel, Widget _) {
        return Scaffold(
          key: scaffoldKey,
          drawer: const CustomBlurredDrawerWidget(
            drawerOption: DrawerOptions.SearchFlights,
          ),
          appBar: AppBar(
            leading: MaterialButton(
              child: Image.asset(
                  'assets/drawer_${!isLight ? 'dark' : 'light'}.png'),
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
            ),
            backgroundColor: isLight ? Colors.white : Colors.black,
            title: Row(
              children: [
                IconButton(
                  onPressed: viewModel.back,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: accentColor,
                  ),
                ),
                Text(
                  "Charter Details",
                  style: isLight ? darkText : lightText,
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                  ))
            ],
          ),
          body: ListView(
            children: [
              Image.asset("assets/plane_full.png"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bombadier",
                          style: GoogleFonts.rubik(
                            color: isLight
                                ? const Color(0xcc242424)
                                : const Color(0xccffffff),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.airline_seat_recline_extra,
                              color: accentColor,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              "8 seats",
                              style: GoogleFonts.rubik(),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "BD-100-1A10 (CHALLENGER 300)",
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21.sp),
                              ),
                              Text(
                                "Super Mid Het",
                                style: GoogleFonts.rubik(color: accentColor),
                              ),
                              Text(
                                "KBED - BEDFORD, MA United States",
                                style: GoogleFonts.rubik(),
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: Container())
                      ],
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.check,
                        color: accentColor,
                      ),
                      title: Text(
                        "WYVERN",
                        style: GoogleFonts.rubik(),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "\$4,950/hour",
                          style: GoogleFonts.rubik(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const AdSection(),
              SizedBox(
                height: 10.h,
              ),
              FlightFeaturesWidget(isLight: isLight, text: "WiFi", value: true),
              FlightFeaturesWidget(
                  isLight: isLight, text: "Placeholder", value: true),
              FlightFeaturesWidget(
                  isLight: isLight, text: "Placeholder", value: true),
              Image.asset("assets/map.png"),
              Container(
                margin: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  color: isLight ? lightSecondary : darkSecondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: [
                  ListTile(
                    leading: Image.asset(
                      "assets/profile.png",
                      height: 100.h,
                      width: 40.h,
                    ),
                    title: Text(
                      "Adam Smith",
                      style: GoogleFonts.rubik(
                        color: accentColor,
                      ),
                    ),
                    subtitle: Text(
                      "Operator",
                      style: GoogleFonts.rubik(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: MaterialButton(
                      color: accentColor,
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(10)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.mail,
                          ),
                          Text(
                            "Send Message",
                            style: GoogleFonts.rubik(),
                          ),
                          Container()
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: MaterialButton(
                      elevation: 0,
                      color: isLight ? lightSecondaryDarker : Colors.black,
                      padding: EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(10)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.phone,
                          ),
                          Text(
                            "Send Call Request",
                            style: GoogleFonts.rubik(),
                          ),
                          Container()
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: MaterialButton(
                      color: isLight ? lightSecondaryDarker : Colors.black,
                      elevation: 0,
                      padding: EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(10)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.mark_email_read_outlined,
                          ),
                          Text(
                            "Send Mail Request",
                            style: GoogleFonts.rubik(),
                          ),
                          Container()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ]),
              )
            ],
          ),
        );
      },
      viewModelBuilder: () => CharterDetailsViewModel(),
    );
  }
}
