import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NewFlightsHeader extends StatelessWidget {
  const NewFlightsHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isLight = Theme.of(context).brightness == Brightness.light;
    return Container(
      height: 90.h,
      margin: EdgeInsets.symmetric(
        vertical: 35.h,
        horizontal: 25.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: (isLight ? const Color(0xffF5F5F5) : const Color(0xff404040)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Search New\nFlights",
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Positioned(
            height: 86.h,
            right: 10.w,
            top: -10.h,
            child: Image.asset("assets/new_flights.png"),
          )
        ],
      ),
    );
  }
}
