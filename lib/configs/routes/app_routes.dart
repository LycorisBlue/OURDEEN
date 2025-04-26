import 'package:get/get.dart';
import 'package:templateproject/app/home/screens/detail_coran.dart';
import '/app/account/bindings/account_binding.dart';
import '/app/home/bindings/home_binding.dart';
import '/app/quibla/bindings/quibla_binding.dart';
import '/app/quibla/screens/quibla_screen.dart';
import '/app/account/screens/login_screen.dart';
import '/app/home/screens/home_screen.dart';
import '/configs/routes/page_name.dart';

class AppPages {
  static const initial = MyRoutes.initial;
  static const login = MyRoutes.login;
  static const quibla = MyRoutes.quibla;
  static const coranDetail = MyRoutes.coranDetail;

  static const unknownRoute = MyRoutes.unknownRoute;

  static final routes = [
    GetPage(
      name: initial,
      page: () => MyHomePage(),
      title: PageTitle.initial,
      binding: HomeBinding(),
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      title: PageTitle.loginPage,
      binding: AccountBinding(),
    ),
    GetPage(
      name: quibla,
      page: () => QuiblaScreen(),
      title: PageTitle.quiblaPage,
      binding: QuiblaBinding(),
    ),
    GetPage(
      name: coranDetail,
      page: () => DetailCoranScreen(),
      title: PageTitle.coranDetailPage,
      binding: HomeBinding(),
    ),
  ];
}
