import 'package:states_rebuilder/scr/navigation/injected_navigator.dart';
import 'package:states_rebuilder/scr/state_management/state_management.dart';
import 'package:travel_buddy/navigator/app_routes.dart';
import 'package:travel_buddy/screens/check_list/check_list_screen.dart';
import 'package:travel_buddy/screens/home/home_screen.dart';
import 'package:travel_buddy/screens/login/login_screen.dart';
import 'package:travel_buddy/screens/qr_scanning/qr_scanning_screen.dart';
import 'package:travel_buddy/screens/splash/splash_screen.dart';
import 'package:travel_buddy/screens/thank_you/thank_you.dart';
import 'package:travel_buddy/screens/ticket_view/ticket_view.dart';
import 'package:travel_buddy/screens/visitor_details/visitor_details_screen.dart';
import 'package:travel_buddy/screens/visitor_list/visitor_list.dart';

final myNavigator = RM.injectNavigator(
  routes: {
    AppRoutes.root: (RouteData data) => SplashScreen(),
    AppRoutes.home: (RouteData data) => const HomeScreen(),
    AppRoutes.thankYou: (RouteData data) => const ThankYou(),
    AppRoutes.visitorList: (RouteData data) => const VisitorList(),
    AppRoutes.visitorDetails: (RouteData data) {
      return VisitorDetailsScreen(
        ticketData: data.arguments,
      );
    },
    AppRoutes.qrScanningScreen: (RouteData data) => const QrScanningScreen(),
    AppRoutes.ticketView: (RouteData data) {
      return TicketView(
        ticketData: data.arguments,
      );
    },
    AppRoutes.loginScreen: (RouteData data) => LoginScreen(),
    AppRoutes.checkListScreen: (RouteData data) => CheckList(data.arguments),
  },
  //todo remove this
  debugPrintWhenRouted: true,
);
