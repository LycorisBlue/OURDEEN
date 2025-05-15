import 'package:get/get.dart';
import 'package:our_deen/app/account/screens/privacy_policy_screen.dart';
import 'package:our_deen/app/account/screens/profile_screen.dart';
import 'package:our_deen/app/account/screens/register_screen.dart';
import 'package:our_deen/app/account/screens/terms_of_service_screen.dart';
import 'package:our_deen/app/home/screens/favorites_screen.dart';
import '/app/account/screens/couleur_screen.dart';
import '/app/account/screens/genre_screen.dart';
import '/app/account/screens/language_screen.dart';
import '/app/account/screens/notification_screen.dart';
import '/app/account/screens/premium_screen.dart';
import '/app/home/screens/duas.dart';
import '/app/home/screens/names_99.dart';
import '/app/home/screens/tasbih.dart';
import '/app/home/screens/zakkat.dart';
import '/app/home/screens/prayers_list_screen.dart';
import '/app/home/screens/detail_coran.dart';
import '/app/home/screens/prayer_detail_screen.dart';
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
  static const priereDetail = MyRoutes.priereDetail;
  static const prayerStep = MyRoutes.prayerStep;
  static const duas = MyRoutes.duas;
  static const zakkat = MyRoutes.zakkat;
  static const name99 = MyRoutes.name99;
  static const premium = MyRoutes.premium;
  static const notification = MyRoutes.notification;
  static const genre = MyRoutes.genre;
  static const couleur = MyRoutes.couleur;
  static const language = MyRoutes.language;
  static const tasbih = MyRoutes.tasbih;
  static const favorites = MyRoutes.favorites;

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
      name: MyRoutes.register,
      page: () => const RegisterPage(),
      title: PageTitle.registerPage,
      binding: AccountBinding(),
    ),
    GetPage(
      name: MyRoutes.profile,
      page: () => ProfileScreen(),
      title: PageTitle.profilePage,
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
    GetPage(
      name: priereDetail,
      page: () => PrayerDetailScreen(),
      title: PageTitle.priereDetailPage,
      binding: HomeBinding(),
    ),
    GetPage(
      name: prayerStep,
      page: () => PrayersListScreen(),
      title: PageTitle.prayerStepPage,
      binding: HomeBinding(),
    ),
    GetPage(
      name: duas,
      page: () => DuasScreen(),
      title: PageTitle.duasPage,
      binding: HomeBinding(),
    ),
    GetPage(
      name: zakkat,
      page: () => ZakkatScreen(),
      title: PageTitle.zakkatPage,
      binding: HomeBinding(),
    ),
    GetPage(
      name: tasbih,
      page: () => TasbihScreen(),
      title: PageTitle.tasbihPage,
      binding: HomeBinding(),
    ),
    GetPage(
      name: name99,
      page: () => Name99Screen(),
      title: PageTitle.name99Page,
      binding: HomeBinding(),
    ),
    GetPage(
      name: premium,
      page: () => PremiumScreen(),
      title: PageTitle.premiumPage,
      binding: AccountBinding(),
    ),
    GetPage(
      name: notification,
      page: () => NotificationScreen(),
      title: PageTitle.notificationPage,
      binding: AccountBinding(),
    ),
    GetPage(
      name: genre,
      page: () => GenreScreen(),
      title: PageTitle.genrePage,
      binding: AccountBinding(),
    ),
    GetPage(
      name: couleur,
      page: () => CouleurScreen(),
      title: PageTitle.couleurPage,
      binding: AccountBinding(),
    ),
    GetPage(
      name: language,
      page: () => LanguageScreen(),
      title: PageTitle.languagePage,
      binding: AccountBinding(),
    ),
    GetPage(
      name: favorites,
      page: () => FavoritesScreen(),
      title: PageTitle.favoritesPage,
    ),
    GetPage(
      name: MyRoutes.privacyPolicy,
      page: () => PrivacyPolicyScreen(),
      title: PageTitle.privacyPolicyPage,
      binding: AccountBinding(),
    ),
    GetPage(
      name: MyRoutes.termsOfService,
      page: () => TermsOfServiceScreen(),
      title: PageTitle.termsOfServicePage,
      binding: AccountBinding(),
    ),
  ];
}
