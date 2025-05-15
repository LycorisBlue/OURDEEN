// lib/app/home/screens/tabs/reglage.dart
import '/constants/assets_path.dart';
import '/constants/app_export.dart';

class ReglageTab extends StatelessWidget {
  const ReglageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Réglages",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: 16),

                // Premier bloc: Premium et Notifications
                _buildSettingBlock([
                                    _buildSettingItem(
                    iconColor: AppColors.primaryColor,
                    title: "Profil",
                    icon: CustomImageView(
                      svgPath: AppIcon.iconProfile,
                      width: 24,
                      height: 24,
                    ),
                    onTap: () => MyNavigation.goToProfile(),
                  ),
                  Divider(height: 1, thickness: 1, color: Colors.grey.withValues(alpha: 0.2)),
                  _buildSettingItem(
                    iconColor: AppColors.goldColor,
                    title: "Obtenez le premium",
                    icon: CustomImageView(
                      svgPath: AppIcon.iconStarFilled,
                      width: 24,
                      height: 24,
                    ),
                    onTap: () => MyNavigation.goToPremium(),
                  ),
                  Divider(height: 1, thickness: 1, color: Colors.grey.withValues(alpha: 0.2)),
                  _buildSettingItem(
                    iconColor: AppColors.brightRedColor,
                    title: "Notifications",
                    icon: CustomImageView(
                      svgPath: AppIcon.iconBell,
                      width: 24,
                      height: 24,
                    ),
                    onTap: () => MyNavigation.goToNotification(),
                  ),
                ]),

                SizedBox(height: 26),

                // Nouveau bloc pour les Favoris
                _buildSettingBlock([
                  _buildSettingItem(
                    iconColor: AppColors.secondaryColor,
                    title: "Mes favoris",
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 24,
                    ),
                    onTap: () => MyNavigation.goToFavorites(),
                  ),
                ]),

                SizedBox(height: 26),

                // Bloc Genre (seul)
                _buildSettingBlock([
                  _buildSettingItem(
                    iconColor: AppColors.purpleColor,
                    title: "Genre",
                    icon: CustomImageView(
                      svgPath: AppIcon.iconProfile,
                      width: 24,
                      height: 24,
                    ),
                    onTap: () => MyNavigation.goToGenre(),
                  ),
                ]),

                SizedBox(height: 26),

                // Bloc Couleurs et Langues
                _buildSettingBlock([
                  _buildSettingItem(
                    iconColor: AppColors.brightRedColor,
                    title: "Couleurs",
                    icon: CustomImageView(
                      svgPath: AppIcon.iconBrush,
                      width: 24,
                      height: 24,
                    ),
                    onTap: () => MyNavigation.goToCouleur(),
                  ),
                  Divider(height: 1, thickness: 1, color: Colors.grey.withValues(alpha: 0.2)),
                  _buildSettingItem(
                    iconColor: AppColors.skyBlueColor,
                    title: "Langues",
                    icon: CustomImageView(
                      svgPath: AppIcon.iconLanguage,
                      width: 24,
                      height: 24,
                    ),
                    onTap: () => MyNavigation.goToLanguage(),
                  ),
                ]),

                SizedBox(height: 26),

                // Bloc Évaluez-nous et Suivez-nous
                _buildSettingBlock([
                  _buildSettingItem(
                    iconColor: AppColors.brightRedColor,
                    title: "Évaluez-nous",
                    icon: CustomImageView(
                      svgPath: AppIcon.iconStar,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  Divider(height: 1, thickness: 1, color: Colors.grey.withValues(alpha: 0.2)),
                  _buildSettingItem(
                    iconColor: AppColors.skyBlueColor,
                    title: "Suivez-nous",
                    icon: CustomImageView(
                      svgPath: AppIcon.iconLink,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingBlock(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadiusStyle.roundedBorder16,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildSettingItem({required Widget icon, required String title, required Color iconColor, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor,
                borderRadius: AppRadiusStyle.circleBorder50,
              ),
              child: icon,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            CustomImageView(
              svgPath: AppIcon.iconArrowRight,
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
