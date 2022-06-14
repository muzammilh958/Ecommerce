import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:set_jet/widgets/dumb_widgets/ad_section.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../constants/drawer_enum.dart';
import '../../core/locator.dart';
import '../../theme/common.dart';
import '../../theme/dark.dart';
import '../../theme/light.dart';
import '../../widgets/dumb_widgets/search_param_selector.dart';
import '../../widgets/smart_widgets/custom_blurred_drawer/custom_blurred_drawer_widget.dart';
import '../search/widgets/flight_features.dart';
import 'booked_charter_detail_view_model.dart';

class BookedCharterDetailView extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookedCharterDetailViewModel>.reactive(
      builder: (BuildContext context, BookedCharterDetailViewModel viewModel,
          Widget _) {
        var isLight = Theme.of(context).brightness == Brightness.light;
        return Scaffold(
          key: scaffoldKey,
          drawer: const CustomBlurredDrawerWidget(
            drawerOption: DrawerOptions.BookedCharters,
          ),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: accentColor,
            leading: MaterialButton(
              child: Image.asset('assets/drawer_${'dark'}.png'),
              onPressed: () {
                scaffoldKey.currentState.openDrawer();
              },
            ),
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "KHPN",
                  style: GoogleFonts.rubik(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  "assets/plane_dark.png",
                  height: 20.h,
                ),
                Text(
                  "KLAS",
                  style: GoogleFonts.rubik(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: ListView(
            children: [
              Container(
                height: 110.h,
                color: accentColor,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  // padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: const Color(0xff126ABD),
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Row(
                    children: const [
                      SearchParamWidget(
                        icon: Icons.calendar_view_month,
                        text: "Fri Oct 8, 2022",
                      ),
                      SearchParamWidget(
                        icon: Icons.timer,
                        text: "05:00 PM EST",
                      ),
                      SearchParamWidget(
                        icon: Icons.people_outline,
                        text: "3",
                      ),
                      SearchParamWidget(
                        icon: Icons.airplanemode_on,
                        text: "One way",
                      ),
                    ],
                  ),
                ),
              ),
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
              Container(
                margin: EdgeInsets.all(8.w),
                padding: EdgeInsets.all(8.w),
                child: Image.asset("assets/map_double.png"),
              ),
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
                      padding: EdgeInsets.all(8.0),
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
      viewModelBuilder: () => BookedCharterDetailViewModel(),
    );
  }
}
