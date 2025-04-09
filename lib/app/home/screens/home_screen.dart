import '/app/home/screens/tabs/priere.dart';
import '/app/home/screens/tabs/reglage.dart';
import '/app/home/screens/tabs/coran.dart';
import '/app/home/screens/tabs/home.dart';
import '/shared_components/layout/bottom_navigation/bn_contolleur.dart';
import '/shared_components/layout/bottom_navigation/bottom_navigation_bar.dart';
import '/constants/app_export.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final navigationController = Get.find<BNavigationController>();
  final pages = [
    HomeTab(),
    PriereTab(),
    CoranTab(),
    ReglageTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      body: Obx(
        () => pages[navigationController.tabIndex.value],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
