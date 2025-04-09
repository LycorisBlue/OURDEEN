import '/constants/assets_path.dart';
import '/constants/app_export.dart';
import '/shared_components/layout/bottom_navigation/bn_contolleur.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({super.key});

  final BNavigationController navigationController =
      Get.put(BNavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: AppColors.primaryColor,
        type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: CustomImageView(
                svgPath: AppIcon.iconTabHome,
                width: 22,
                height: 22,
                color: navigationController.tabIndex.value == 0
                    ? AppColors.whiteColor
                    : AppColors.whiteColor.withValues(alpha: 0.5),
              ),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: CustomImageView(
                svgPath: AppIcon.iconTabPriere,
                width: 22,
                height: 22,
                color: navigationController.tabIndex.value == 1
                    ? AppColors.whiteColor
                    : AppColors.whiteColor.withValues(alpha: 0.5),
              ),
              label: 'Prière',
            ),
            BottomNavigationBarItem(
              icon: CustomImageView(
                svgPath: AppIcon.iconTabCoran,
                width: 22,
                height: 22,
                color: navigationController.tabIndex.value == 2
                    ? AppColors.whiteColor
                    : AppColors.whiteColor.withValues(alpha: 0.5),
              ),
              label: 'Coran',
            ),
            BottomNavigationBarItem(
              icon: CustomImageView(
                svgPath: AppIcon.iconTabReglage,
                width: 22,
                height: 22,
                color: navigationController.tabIndex.value == 3
                    ? AppColors.whiteColor
                    : AppColors.whiteColor.withValues(alpha: 0.5),
              ),
              label: 'Réglages',
            ),
          ],
          currentIndex: navigationController.tabIndex.value,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: AppColors.whiteColor.withValues(alpha: 0.5),
          onTap: navigationController.changeTabIndex),
    );
  }
}
