// lib/app/account/screens/profile_screen.dart
import '/constants/app_export.dart';
import '/app/account/controllers/account_crontroller.dart';
import '/constants/assets_path.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = Get.find<AccountController>();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // Récupérer les initiales du nom et d'autres infos utilisateur
    String userInitials = "AB"; // Par défaut "AB" pour Abou Bakar
    String userName = "Abou Bakar";
    String userEmail = "utilisateur@email.com";
    String userPhone = "+225 01 23 45 67 89";
    String userGender = "Masculin"; // Ou "Féminin" selon la valeur de genre

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          // En-tête avec initiales
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: AppColors.primaryColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Get.back(),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.edit, color: Colors.white),
                onPressed: () {
                  // Action pour modifier le profil
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: AppColors.primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Cercle avec initiales au lieu de photo
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          userInitials,
                          style: TextStyle(
                            fontSize: 36.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: AppFont.poppins,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: AppFont.poppins,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      userEmail,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white.withOpacity(0.9),
                        fontFamily: AppFont.poppins,
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),

          // Contenu du profil
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Informations utilisateur
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: AppRadiusStyle.roundedBorder16,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _buildInfoRow(
                          Icons.phone_outlined,
                          "Téléphone",
                          userPhone,
                          AppColors.brightRedColor,
                        ),
                        Divider(
                          height: 24,
                          thickness: 1,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        _buildInfoRow(
                          Icons.person_outline,
                          "Genre",
                          userGender,
                          AppColors.purpleColor,
                        ),
                      ],
                    ),
                  ),
                ),

                // Statistiques
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: AppRadiusStyle.roundedBorder16,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem("32", "Jours", Icons.calendar_today),
                        Container(
                          height: 40,
                          width: 1,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        _buildStatItem("15", "Sourates", Icons.menu_book),
                        Container(
                          height: 40,
                          width: 1,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        _buildStatItem("94", "Prières", Icons.access_time),
                      ],
                    ),
                  ),
                ),

                // Actions du profil (modification des informations seulement)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: AppRadiusStyle.roundedBorder16,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            "Modifier mes informations",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppFont.poppins,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            // Action pour modifier le profil
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // Bouton de déconnexion
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action pour la déconnexion
                        _showLogoutDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade50,
                        foregroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: AppRadiusStyle.roundedBorder12,
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Se déconnecter',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                          fontFamily: AppFont.poppins,
                        ),
                      ),
                    ),
                  ),
                ),

                // Espace en bas pour le padding
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget pour afficher les informations utilisateur
  Widget _buildInfoRow(IconData icon, String label, String value, Color iconColor) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 20,
          ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColors.greyColor,
                fontFamily: AppFont.poppins,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
                fontFamily: AppFont.poppins,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Fonction pour afficher la boîte de dialogue de déconnexion
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: AppRadiusStyle.roundedBorder16,
          ),
          title: Text(
            "Se déconnecter",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              fontFamily: AppFont.poppins,
            ),
          ),
          content: Text(
            "Êtes-vous sûr de vouloir vous déconnecter ?",
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: AppFont.poppins,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Annuler",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.greyColor,
                  fontFamily: AppFont.poppins,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Déconnexion et redirection vers la page de login
                MyNavigation.goToLogin();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Déconnecter",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontFamily: AppFont.poppins,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Widget pour les statistiques
  Widget _buildStatItem(String count, String label, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppColors.primaryColor,
            size: 20,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          count,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
            fontFamily: AppFont.poppins,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.greyColor,
            fontFamily: AppFont.poppins,
          ),
        ),
      ],
    );
  }
}
