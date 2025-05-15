// lib/app/account/screens/privacy_policy_screen.dart
import 'package:our_deen/constants/assets_path.dart';

import '/constants/app_export.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Politique de confidentialité",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: AppFont.poppins,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // En-tête avec logo et date
              Center(
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: AppImage.logo,
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Ourdeen",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                        fontFamily: AppFont.poppins,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Dernière mise à jour : 12 mai 2025",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.greyColor,
                        fontFamily: AppFont.poppins,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Introduction
              _buildSectionTitle("Introduction"),
              _buildParagraph(
                  "Bienvenue dans la politique de confidentialité de l'application Ourdeen. Chez Ourdeen, nous nous engageons à protéger vos informations personnelles et à être transparents sur la façon dont nous les utilisons. Cette politique de confidentialité explique comment nous collectons, utilisons, partageons et protégeons vos données lorsque vous utilisez notre application."),
              _buildParagraph(
                  "Veuillez lire attentivement cette politique pour comprendre nos pratiques concernant vos informations personnelles. En utilisant l'application Ourdeen, vous acceptez les pratiques décrites dans le présent document."),

              SizedBox(height: 20),

              // Informations collectées
              _buildSectionTitle("Informations que nous collectons"),
              _buildParagraph("Nous collectons les types d'informations suivants :"),

              _buildSubsectionTitle("Informations que vous nous fournissez"),
              _buildBulletPoint(
                  "Informations de profil : lorsque vous créez un compte, nous collectons votre nom, adresse e-mail et mot de passe."),
              _buildBulletPoint(
                  "Préférences d'utilisation : vos paramètres de langue, notifications et autres préférences dans l'application."),
              _buildBulletPoint("Contenu généré : les favoris, notes ou autres contenus que vous créez dans l'application."),

              _buildSubsectionTitle("Informations collectées automatiquement"),
              _buildBulletPoint(
                  "Données d'utilisation : informations sur la façon dont vous utilisez l'application, comme les fonctionnalités que vous consultez, le temps passé sur l'application et les interactions avec les contenus."),
              _buildBulletPoint(
                  "Informations sur l'appareil : type d'appareil, système d'exploitation, identifiants uniques de l'appareil et informations de réseau mobile."),
              _buildBulletPoint(
                  "Données de localisation : avec votre permission, nous pouvons collecter et traiter des informations sur votre localisation pour des fonctionnalités comme la direction de la Qibla et les horaires de prière."),

              SizedBox(height: 20),

              // Utilisation des informations
              _buildSectionTitle("Comment nous utilisons vos informations"),
              _buildParagraph("Nous utilisons vos informations personnelles pour :"),
              _buildBulletPoint("Fournir, maintenir et améliorer notre application et ses fonctionnalités."),
              _buildBulletPoint("Personnaliser votre expérience en proposant du contenu adapté à vos préférences."),
              _buildBulletPoint("Vous envoyer des notifications importantes concernant l'application ou votre compte."),
              _buildBulletPoint("Analyser l'efficacité de notre application et améliorer nos services."),
              _buildBulletPoint("Détecter, prévenir et résoudre les problèmes techniques ou de sécurité."),

              SizedBox(height: 20),

              // Partage des informations
              _buildSectionTitle("Partage de vos informations"),
              _buildParagraph(
                  "Nous ne vendons pas vos données personnelles à des tiers. Nous pouvons partager vos informations dans les circonstances suivantes :"),
              _buildBulletPoint(
                  "Avec des prestataires de services tiers qui nous aident à exploiter notre application (par exemple, hébergement de serveurs, analyse de données)."),
              _buildBulletPoint(
                  "Si nécessaire pour se conformer à une obligation légale, une procédure judiciaire ou une demande gouvernementale."),
              _buildBulletPoint(
                  "Pour protéger les droits, la propriété ou la sécurité de notre application, de nos utilisateurs ou du public."),

              SizedBox(height: 20),

              // Sécurité
              _buildSectionTitle("Sécurité de vos informations"),
              _buildParagraph(
                  "La sécurité de vos données personnelles est importante pour nous. Nous mettons en œuvre des mesures techniques et organisationnelles appropriées pour protéger vos informations contre la perte, l'utilisation abusive, l'accès non autorisé, la divulgation ou la modification."),
              _buildParagraph(
                  "Cependant, aucune méthode de transmission sur Internet ou de stockage électronique n'est totalement sécurisée. Bien que nous nous efforcions de protéger vos informations personnelles, nous ne pouvons garantir leur sécurité absolue."),

              SizedBox(height: 20),

              // Vos droits
              _buildSectionTitle("Vos droits et choix"),
              _buildParagraph(
                  "Selon votre lieu de résidence, vous pouvez avoir certains droits concernant vos informations personnelles :"),
              _buildBulletPoint("Accéder à vos informations personnelles que nous détenons."),
              _buildBulletPoint("Demander la correction d'informations inexactes."),
              _buildBulletPoint("Supprimer vos informations personnelles dans certaines circonstances."),
              _buildBulletPoint("Vous opposer au traitement de vos informations personnelles."),
              _buildBulletPoint("Retirer votre consentement à tout moment."),
              _buildParagraph("Pour exercer ces droits, veuillez nous contacter aux coordonnées indiquées ci-dessous."),

              SizedBox(height: 20),

              // Conservation
              _buildSectionTitle("Conservation des données"),
              _buildParagraph(
                  "Nous conservons vos informations personnelles aussi longtemps que nécessaire pour fournir les services que vous avez demandés, ou pour d'autres fins essentielles telles que le respect de nos obligations légales, la résolution des litiges et l'application de nos politiques."),

              SizedBox(height: 20),

              // Enfants
              _buildSectionTitle("Informations concernant les enfants"),
              _buildParagraph(
                  "Notre application n'est pas destinée aux enfants de moins de 13 ans, et nous ne collectons pas sciemment des informations personnelles d'enfants de moins de 13 ans. Si vous êtes un parent ou un tuteur et que vous pensez que votre enfant nous a fourni des informations personnelles, veuillez nous contacter."),

              SizedBox(height: 20),

              // Modifications
              _buildSectionTitle("Modifications de cette politique"),
              _buildParagraph(
                  "Nous pouvons mettre à jour notre politique de confidentialité de temps à autre. Nous vous informerons de tout changement en publiant la nouvelle politique de confidentialité sur cette page et en mettant à jour la date de \"dernière mise à jour\" en haut de cette politique."),
              _buildParagraph(
                  "Nous vous encourageons à consulter régulièrement cette politique pour rester informé de la façon dont nous protégeons vos informations."),

              SizedBox(height: 20),

              // Contact
              _buildSectionTitle("Nous contacter"),
              _buildParagraph(
                  "Si vous avez des questions ou des préoccupations concernant cette politique de confidentialité, veuillez nous contacter à :"),
              Container(
                margin: EdgeInsets.only(top: 8, bottom: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: AppRadiusStyle.roundedBorder12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ourdeen Team",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                        fontFamily: AppFont.poppins,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          size: 16,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "privacy@ourdeen.com",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primaryColor,
                            fontFamily: AppFont.poppins,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.web,
                          size: 16,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "www.ourdeen.com/privacy",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primaryColor,
                            fontFamily: AppFont.poppins,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Espace en bas pour le padding
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Widgets d'aide pour construire les sections
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
          fontFamily: AppFont.poppins,
        ),
      ),
    );
  }

  Widget _buildSubsectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.blackColor,
          fontFamily: AppFont.poppins,
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          height: 1.5,
          color: AppColors.blackColor.withOpacity(0.8),
          fontFamily: AppFont.poppins,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                height: 1.5,
                color: AppColors.blackColor.withOpacity(0.8),
                fontFamily: AppFont.poppins,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
