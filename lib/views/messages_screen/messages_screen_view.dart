import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:set_jet/constants/drawer_enum.dart';
import 'package:set_jet/theme/common.dart';
import 'package:set_jet/widgets/dumb_widgets/message_tile.dart';
import 'package:set_jet/widgets/smart_widgets/custom_blurred_drawer/custom_blurred_drawer_widget.dart';
import 'package:stacked/stacked.dart';
import 'messages_screen_view_model.dart';

class MessagesScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MessagesScreenViewModel>.reactive(
      builder:
          (BuildContext context, MessagesScreenViewModel viewModel, Widget _) {
        var scaffoldKey = GlobalKey<ScaffoldState>();
        return Builder(builder: (context) {
          var theme = Theme.of(context);
          var isLight = theme.brightness == Brightness.light;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
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
                height: 50.h,
                width: 50.w,
                child: Image.asset(
                  'assets/logo_${!isLight ? 'dark' : 'light'}.png',
                ),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text('Messages',
                              style: GoogleFonts.rubik(
                                  fontSize: 36.sp,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      !isLight ? Colors.white : Colors.black)),
                        ),
                      ),
                      Expanded(
                          flex: 8,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.search,
                                                  color: !isLight
                                                      ? const Color(0xFF9F9F9F)
                                                      : const Color(
                                                          0xFF9F9F9F)),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15.0)),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(15.0)),
                                                borderSide: BorderSide(
                                                  color: accentColor,
                                                ),
                                              ),
                                              filled: true,
                                              hintStyle: GoogleFonts.rubik(
                                                  color: Colors.grey[800]),
                                              labelText: 'Search in messages',
                                              labelStyle: GoogleFonts.rubik(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: !isLight
                                                      ? Color(0xFF9F9F9F)
                                                      : Color(0xFF9F9F9F)),
                                              fillColor: !isLight
                                                  ? Color(0xFF404040)
                                                  : Color(0xFFF1F1F1)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 14,
                                  child: ListView(
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      MessageTile(
                                        isLight: isLight,
                                        IsNewMessage: true,
                                        image: 'assets/profile.png',
                                        title: 'Adam Smith',
                                        subtitle: 'Hey, how are you?',
                                        time: '10h ago',
                                        onpressed: () {
                                          viewModel.navigateToViewChatScreen();
                                        },
                                      ),
                                      MessageTile(
                                        isLight: isLight,
                                        IsNewMessage: false,
                                        changeColor: true,
                                        image: 'assets/profile.png',
                                        title: 'Adam Smith',
                                        subtitle: 'Hey, how are you?',
                                        time: '1d ago',
                                        onpressed: () {
                                          viewModel.navigateToViewChatScreen();
                                        },
                                      ),
                                      MessageTile(
                                        isLight: isLight,
                                        IsNewMessage: false,
                                        changeColor: false,
                                        image: 'assets/profile.png',
                                        title: 'Adam Smith',
                                        subtitle: 'Hey, how are you?',
                                        time: '1d ago',
                                        onpressed: () {
                                          viewModel.navigateToViewChatScreen();
                                        },
                                      ),
                                      MessageTile(
                                        isLight: isLight,
                                        IsNewMessage: false,
                                        changeColor: true,
                                        image: 'assets/profile.png',
                                        title: 'Adam Smith',
                                        subtitle: 'Hey, how are you?',
                                        time: '1d ago',
                                        onpressed: () {
                                          viewModel.navigateToViewChatScreen();
                                        },
                                      ),
                                      MessageTile(
                                        isLight: isLight,
                                        IsNewMessage: false,
                                        changeColor: false,
                                        image: 'assets/profile.png',
                                        title: 'Adam Smith',
                                        subtitle: 'Hey, how are you?',
                                        time: '1d ago',
                                        onpressed: () {
                                          viewModel.navigateToViewChatScreen();
                                        },
                                      ),
                                    ],
                                  ))
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
            drawer: const CustomBlurredDrawerWidget(
                drawerOption: DrawerOptions.Message),
          );
        });
      },
      viewModelBuilder: () => MessagesScreenViewModel(),
    );
  }
}
