import 'package:get/get.dart';
import 'package:templateproject/app/account/bindings/account_binding.dart';
import 'package:templateproject/app/home/bindings/home_binding.dart';
import '/app/account/screens/login_screen.dart';
import '/app/home/screens/home_screen.dart';
import '/configs/routes/page_name.dart';

class AppPages {
  static const initial = MyRoutes.initial;
  static const login = MyRoutes.login;

  static const unknownRoute = MyRoutes.unknownRoute;

  static final routes = [
    GetPage(
      name: initial,
      page: () =>  MyHomePage(),
      title: PageTitle.initial,
      binding: HomeBinding(),
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      title: PageTitle.loginPage,
      binding: AccountBinding(),
    ),
  ];
}
