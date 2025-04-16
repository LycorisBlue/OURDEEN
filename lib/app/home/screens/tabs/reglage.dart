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
                    iconColor: AppColors.goldColor,
                    title: "Obtenez le premium",
                    icon: CustomImageView(
                      imagePath: AppImage.iconStarFilled,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  Divider(height: 1, thickness: 1, color: Colors.grey.withOpacity(0.2)),
                  _buildSettingItem(
                    iconColor: AppColors.brightRedColor,
                    title: "Notifications",
                    icon: CustomImageView(
                      imagePath: AppImage.iconBell,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ]),

                SizedBox(height: 16),

                // Bloc Genre (seul)
                _buildSettingBlock([
                  _buildSettingItem(
                    iconColor: AppColors.purpleColor,
                    title: "Genre",
                    icon: CustomImageView(
                      imagePath: AppImage.iconProfile,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ]),

                SizedBox(height: 16),

                // Bloc Couleurs et Langues
                _buildSettingBlock([
                  _buildSettingItem(
                    iconColor: AppColors.brightRedColor,
                    title: "Couleurs",
                    icon: CustomImageView(
                      imagePath: AppImage.iconBrush,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  Divider(height: 1, thickness: 1, color: Colors.grey.withOpacity(0.2)),
                  _buildSettingItem(
                    iconColor: AppColors.skyBlueColor,
                    title: "Langues",
                    icon: CustomImageView(
                      imagePath: AppImage.iconLanguage,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ]),

                SizedBox(height: 16),

                // Bloc Évaluez-nous et Suivez-nous
                _buildSettingBlock([
                  _buildSettingItem(
                    iconColor: AppColors.brightRedColor,
                    title: "Évaluez-nous",
                    icon: CustomImageView(
                      imagePath: AppImage.iconStar,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  Divider(height: 1, thickness: 1, color: Colors.grey.withOpacity(0.2)),
                  _buildSettingItem(
                    iconColor: AppColors.skyBlueColor,
                    title: "Suivez-nous",
                    icon: CustomImageView(
                      imagePath: AppImage.iconLink,
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
            color: Colors.black.withOpacity(0.1),
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

  Widget _buildSettingItem({
    required Widget icon,
    required String title,
    required Color iconColor,
  }) {
    return Container(
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
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppColors.greyColor,
          ),
        ],
      ),
    );
  }
}
