import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    Key key,
    @required this.isLight,
    this.IsNewMessage,
    this.changeColor,
    this.image,
    this.title,
    this.subtitle,
    this.time,
    this.onpressed,
  }) : super(key: key);

  final bool isLight;
  final bool IsNewMessage;
  final bool changeColor;
  final image;
  final title;
  final subtitle;
  final time;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      child: Container(
        width: double.infinity,
        height: 85.h,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            color: (IsNewMessage)
                ? !isLight
                    ? Color(0xFF1F374E)
                    : Color(0xFFCEE6FD)
                : (changeColor)
                    ? Colors.transparent
                    : !isLight
                        ? Color(0xFF404040)
                        : Color(0xFFF1F1F1)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 60.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.rubik(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: (IsNewMessage)
                                ? Color(0xFF0B78DF)
                                : (!isLight)
                                    ? Colors.white
                                    : Colors.black),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        subtitle,
                        style: GoogleFonts.rubik(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: (IsNewMessage)
                                ? !isLight
                                    ? Colors.white
                                    : Colors.black
                                : !isLight
                                    ? Color(0xFFC0C0C0)
                                    : Color(0xFFC0C0C0)),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(time,
                      style: GoogleFonts.rubik(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: (IsNewMessage && !isLight)
                              ? Color(0xFFC0C0C0)
                              : Color(0xFF7B7B7B))),
                  (IsNewMessage)
                      ? Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 23.h,
                            width: 23.w,
                            decoration: const BoxDecoration(
                              color: Color(0xFF0982F4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                            ),
                            child: Center(
                              child: Text('2',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.rubik(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 23.h,
                            width: 23.w,
                          ),
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
