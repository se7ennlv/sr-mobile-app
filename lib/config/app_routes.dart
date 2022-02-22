import 'package:flutter_sr/common/ui/pdf_viewer/pdfviewer_page.dart';
import 'package:flutter_sr/ui/about_page.dart';
import 'package:flutter_sr/ui/feeds/feed_page.dart';
import 'package:flutter_sr/ui/home/home_page.dart';
import 'package:flutter_sr/ui/hrinfo/docs_page.dart';
import 'package:flutter_sr/ui/initial/init_page.dart';
import 'package:flutter_sr/ui/mybenefit/clinic/clinic_page.dart';
import 'package:flutter_sr/ui/mybenefit/leave_page.dart';
import 'package:flutter_sr/ui/mybenefit/mymart_page.dart';
import 'package:flutter_sr/ui/mybenefit/payroll_page.dart';
import 'package:flutter_sr/ui/mybenefit/roster_page.dart';
import 'package:flutter_sr/ui/mybenefit/srp_page.dart';
import 'package:flutter_sr/ui/mybenefit/survey/survey_page.dart';
import 'package:flutter_sr/ui/profile/profile_page.dart';
import 'package:flutter_sr/ui/term_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static List<GetPage<dynamic>> generateRoute = [
    GetPage(name: '/', page: () => InitialPage()),
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/srp', page: () => SrpPage()),
    GetPage(name: '/mymart', page: () => MyMartPage()),
    GetPage(name: '/leave', page: () => LeavePage()),
    GetPage(name: '/roster', page: () => RosterPage()),
    GetPage(name: '/payroll', page: () => PayrollPage()),
    GetPage(name: '/clinic', page: () => ClinicPage()),
    GetPage(name: '/survey', page: () => SurveyPage()),
    GetPage(name: '/docs', page: () => DocsPage(showAppBar: true)),
    GetPage(name: '/profile', page: () => ProfilePage()),
    GetPage(name: '/about', page: () => AboutPage()),
    GetPage(name: '/feed', page: () => FeedPage(showAppBar: true)),
    GetPage(name: '/term', page: () => TermPage()),
    GetPage(name: '/pdfviewer', page: () => PDFViewerPage())
  ];
}
