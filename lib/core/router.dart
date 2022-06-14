// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:set_jet/core/router_constants.dart';

import 'package:set_jet/views/welcome/welcome_view.dart' as view0;
import 'package:set_jet/views/pre_login/pre_login_view.dart' as view1;
import 'package:set_jet/views/login_screen/login_screen_view.dart' as view2;
import 'package:set_jet/views/post_login_screen/post_login_screen_view.dart'
    as view3;
import 'package:set_jet/views/time_zone_setting/time_zone_setting_view.dart'
    as view4;
import 'package:set_jet/views/home/home_view.dart' as view5;
import 'package:set_jet/views/messages_screen/messages_screen_view.dart'
    as view6;
import 'package:set_jet/views/chatbox_screen/chatbox_screen_view.dart' as view7;
import 'package:set_jet/views/search/search_view.dart' as view8;
import 'package:set_jet/views/user_setting_screeb/user_setting_screeb_view.dart'
    as view9;
import 'package:set_jet/views/search_results/search_results_view.dart'
    as view10;
import 'package:set_jet/views/charter_details/charter_details_view.dart'
    as view11;
import 'package:set_jet/views/booked_charters/booked_charters_view.dart'
    as view12;
import 'package:set_jet/views/booked_charter_detail/booked_charter_detail_view.dart'
    as view13;
import 'package:set_jet/views/sent_request/sent_request_view.dart' as view14;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeViewRoute:
        return MaterialPageRoute(builder: (_) => view0.WelcomeView());
      case preLoginViewRoute:
        return MaterialPageRoute(builder: (_) => view1.PreLoginView());
      case loginScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view2.LoginScreenView());
      case postLoginScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view3.PostLoginScreenView());
      case timeZoneSettingViewRoute:
        return MaterialPageRoute(builder: (_) => view4.TimeZoneSettingView());
      case homeViewRoute:
        return MaterialPageRoute(builder: (_) => view5.HomeView());
      case messagesScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view6.MessagesScreenView());
      case chatboxScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view7.ChatboxScreenView());
      case searchViewRoute:
        return MaterialPageRoute(builder: (_) => view8.SearchView());
      case userSettingScreebViewRoute:
        return MaterialPageRoute(builder: (_) => view9.UserSettingScreebView());
      case searchResultsViewRoute:
        return MaterialPageRoute(builder: (_) => view10.SearchResultsView());
      case charterDetailsViewRoute:
        return MaterialPageRoute(builder: (_) => view11.CharterDetailsView());
      case bookedCharterViewRoute:
        return MaterialPageRoute(builder: (_) => view12.BookedCharterView());
      case bookedCharterDetailViewRoute:
        return MaterialPageRoute(
            builder: (_) => view13.BookedCharterDetailView());
      case sentRequestViewRoute:
        return MaterialPageRoute(builder: (_) => view14.SentRequestView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
