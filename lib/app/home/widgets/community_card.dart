import '/constants/assets_path.dart';
import '/constants/app_export.dart';

class CommunityCard extends StatelessWidget {
  final VoidCallback? onJoinFacebook;
  final VoidCallback? onMoreOptions;

  const CommunityCard({
    super.key,
    this.onJoinFacebook,
    this.onMoreOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadiusStyle.roundedBorder12,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFF9D665),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "الله",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  "Communauté",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: onMoreOptions,
                  child: Icon(Icons.more_vert, color: Colors.grey),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Color(0xFFFEF3D7),
              borderRadius: AppRadiusStyle.roundedBorder8,
            ),
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left text content
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Communauté Musulmane",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6D2B1D),
                        ),
                      ),
                      SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xFF6D2B1D),
                          ),
                          children: [
                            TextSpan(text: "Rejoignez "),
                            TextSpan(
                              text: "notre communauté musulmane mondiale",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: " "),
                            TextSpan(
                              text: "sur Facebook",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      // Stars decoration
                      Icon(
                        Icons.star,
                        color: Color(0xFFF9D665),
                        size: 20,
                      ),
                    ],
                  ),
                ),
                // Right side colored container instead of image
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: AppRadiusStyle.roundedBorder8,
                      image: DecorationImage(
                          image: AssetImage(AppImage.logo), fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Rencontrez, découvrez et discutez avec des musulmans du monde entier. Rejoignez notre communauté dès aujourd'hui!",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ),
          Divider(
              thickness: 1,
              height: 1,
              color: Colors.grey.withValues(alpha: 0.2)),
          InkWell(
            onTap: onJoinFacebook,
            child: Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(16),
              child: Text(
                "REJOINDRE SUR FACEBOOK",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
