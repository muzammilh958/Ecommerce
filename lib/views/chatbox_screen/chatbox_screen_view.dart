import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:set_jet/constants/drawer_enum.dart';
import 'package:set_jet/theme/common.dart';
import 'package:set_jet/widgets/dumb_widgets/message_time_divider.dart';
import 'package:set_jet/widgets/smart_widgets/custom_blurred_drawer/custom_blurred_drawer_widget.dart';
import 'package:stacked/stacked.dart';
import 'chatbox_screen_view_model.dart';

class ChatboxScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatboxScreenViewModel>.reactive(
      builder:
          (BuildContext context, ChatboxScreenViewModel viewModel, Widget _) {
        var scaffoldKey = GlobalKey<ScaffoldState>();
        return Builder(builder: (context) {
          var theme = Theme.of(context);
          var isLight = theme.brightness == Brightness.light;
          return Scaffold(
            key: scaffoldKey,
            drawer: const CustomBlurredDrawerWidget(
                drawerOption: DrawerOptions.Message),
            appBar: AppBar(
              backgroundColor: !isLight ? Colors.black : Color(0xFFF1F1F1),
              elevation: 0,
              leading: MaterialButton(
                child: Image.asset(
                    'assets/drawer_${!isLight ? 'dark' : 'light'}.png'),
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
              ),
              actions: [
                Icon(
                  Icons.more_vert,
                  color: !isLight ? Colors.white : Colors.black,
                ),
              ],
              automaticallyImplyLeading: false,
              title: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios,
                            color: accentColor, size: 20),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/profile.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text('Adam Smith',
                        style: GoogleFonts.rubik(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: !isLight ? Colors.white : Colors.black)),
                  ],
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(child: Container()),
                Expanded(
                    flex: 30,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.1,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const MessageTimeDivider(
                              time: '02.13.2021',
                            ),
                            SendBubble(
                              isLight: isLight,
                              text:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus tellus neque massa lorem massa aliquam vitae eleifend. Consectetur id odio dolor nisl vulputate nisi.',
                              time: '15:54',
                            ),
                            ReceiverBubble(
                              isLight: isLight,
                              text:
                                  'Amet, pellentesque lectus dignissim lorem nec aenean nullam tempus. Tellus nullam ornare null diam elementum.',
                              time: '15:54',
                            ),
                            SendBubble(
                              isLight: isLight,
                              text:
                                  'Amet, pellentesque lectus dignissim lorem nec aenean nullam tempus. Tellus nullam',
                              time: '15:54',
                            ),
                            const MessageTimeDivider(
                              time: '04.13.2021',
                            ),
                            SendBubble(
                              isLight: isLight,
                              text:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus tellus neque massa lorem massa aliquam vitae eleifend. Consectetur id odio dolor nisl vulputate nisi.',
                              time: '15:54',
                            ),
                            ReceiverBubble(
                              isLight: isLight,
                              text:
                                  'Amet, pellentesque lectus dignissim lorem nec aenean nullam tempus. Tellus nullam ornare null diam elementum.',
                              time: '15:54',
                            ),
                            SendBubble(
                              isLight: isLight,
                              text:
                                  'Amet, pellentesque lectus dignissim lorem nec aenean nullam tempus. Tellus nullam',
                              time: '15:54',
                            ),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: !isLight ? Colors.black : Color(0xFFF1F1F1),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, bottom: 10, top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: TextField(
                              decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  filled: true,
                                  hintStyle: GoogleFonts.rubik(
                                      color: Color(0xFFB3B3B3)),
                                  hintText: 'Write message...',
                                  labelStyle: GoogleFonts.rubik(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: !isLight
                                          ? Color(0xFF9F9F9F)
                                          : Color(0xFF9F9F9F)),
                                  fillColor: !isLight
                                      ? Color(0xFF404040)
                                      : Colors.white),
                            ),
                          ),
                          Expanded(
                            child: MaterialButton(
                                color: accentColor,
                                child: Container(
                                    width: 56.w,
                                    height: 56.h,
                                    child: const Icon(
                                      Icons.send_outlined,
                                      color: Colors.white,
                                    )),
                                shape: const CircleBorder(),
                                onPressed: () {}),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
      },
      viewModelBuilder: () => ChatboxScreenViewModel(),
    );
  }
}

class ReceiverBubble extends StatelessWidget {
  const ReceiverBubble({
    Key key,
    @required this.isLight,
    this.text,
    this.time,
  }) : super(key: key);

  final bool isLight;
  final text;
  final time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ChatBubble(
        backGroundColor: !isLight ? Colors.black : Color(0xFF9A9A9A),
        elevation: 0,
        child: Column(
          children: [
            Text(
              text,
              style: GoogleFonts.rubik(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: GoogleFonts.rubik(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFAEAEAE)),
                ),
              ],
            )
          ],
        ),
        clipper: ChatBubbleClipper6(type: BubbleType.receiverBubble),
      ),
    );
  }
}

class SendBubble extends StatelessWidget {
  const SendBubble({
    Key key,
    @required this.isLight,
    this.text,
    this.time,
  }) : super(key: key);

  final bool isLight;
  final text;
  final time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ChatBubble(
        backGroundColor: !isLight ? Color(0xFF404040) : Color(0xFFF1F1F1),
        elevation: 0,
        child: Column(
          children: [
            Text(
              text,
              style: GoogleFonts.rubik(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: !isLight ? Colors.white : Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: GoogleFonts.rubik(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFAEAEAE)),
                ),
              ],
            )
          ],
        ),
        clipper: ChatBubbleClipper6(type: BubbleType.sendBubble),
      ),
    );
  }
}
