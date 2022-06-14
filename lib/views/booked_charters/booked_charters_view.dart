import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:set_jet/constants/drawer_enum.dart';
import 'package:set_jet/widgets/smart_widgets/custom_blurred_drawer/custom_blurred_drawer_widget.dart';
import 'package:stacked/stacked.dart';
import '../../theme/common.dart';
import '../../theme/dark.dart';
import '../../theme/light.dart';
import '../../widgets/dumb_widgets/search_param_selector.dart';
import 'booked_charters_view_model.dart';

class BookedCharterView extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var isLight = Theme.of(context).brightness == Brightness.light;
    return ViewModelBuilder<BookedChartersViewModel>.reactive(
      builder:
          (BuildContext context, BookedChartersViewModel viewModel, Widget _) {
        return Scaffold(
          key: scaffoldKey,
          drawer: const CustomBlurredDrawerWidget(
            drawerOption: DrawerOptions.BookedCharters,
          ),
          appBar: AppBar(
            leading: MaterialButton(
              child: Image.asset(
                  'assets/drawer_${!isLight ? 'dark' : 'light'}.png'),
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            title: Image.asset(
              'assets/logo_${!isLight ? 'dark' : 'light'}.png',
              height: 41.h,
              width: 50.w,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Booked Charters',
                    style: GoogleFonts.rubik(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    filled: true,
                    fillColor: isLight ? lightSecondary : darkSecondary,
                    prefixIcon: Icon(
                      Icons.search_sharp,
                      color: isLight
                          ? const Color(0x66242424)
                          : const Color(0x66ffffff),
                    ),
                    label: Text("Search in Requests",
                        style: GoogleFonts.rubik(
                            color: isLight
                                ? const Color(0x66242424)
                                : const Color(0x66ffffff))),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: viewModel.goToDetails,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: isLight ? lightSecondary : darkSecondary,
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 120.h,
                          color: accentColor,
                          padding: EdgeInsets.only(top: 8.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "KHPN",
                                    style: GoogleFonts.rubik(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const RotatedBox(
                                    quarterTurns: 1,
                                    child: Icon(
                                      Icons.airplanemode_active,
                                    ),
                                  ),
                                  Text(
                                    "KLAS",
                                    style: GoogleFonts.rubik(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  // padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff126ABD),
                                    borderRadius: BorderRadius.circular(10.w),
                                  ),
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
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ListTile(
                          leading: Image.asset(
                            "assets/profile.png",
                            height: 40.h,
                          ),
                          title: const Text("Adam Smith"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.mail),
                                color: accentColor,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.phone),
                                color: accentColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.h),
                          child: Row(
                            children: [
                              Expanded(
                                child: Image.asset("assets/plane_square.png"),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                flex: 8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Bombadier",
                                      style: GoogleFonts.rubik(
                                        color: isLight
                                            ? const Color(0xcc242424)
                                            : const Color(0xccffffff),
                                      ),
                                    ),
                                    Text(
                                      "BD-100-1A10 \n(CHALLENGER 300)",
                                      style: GoogleFonts.rubik(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(flex: 2, child: Container())
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: accentColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "\$4,800",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: accentColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => BookedChartersViewModel(),
    );
  }
}
