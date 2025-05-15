// lib/app/account/screens/terms_of_service_screen.dart
import 'package:our_deen/constants/assets_path.dart';

import '/constants/app_export.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Conditions d'utilisation",
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
              _buildSectionTitle("Acceptation des conditions"),
              _buildParagraph(
                  "Bienvenue sur Ourdeen. En accédant à notre application ou en l'utilisant, vous acceptez d'être lié par ces Conditions d'utilisation. Si vous n'acceptez pas l'intégralité des termes et conditions énoncés dans cet accord, vous ne pouvez pas accéder à l'application ou utiliser les services qu'elle propose."),
              _buildParagraph(
                  "Veuillez lire attentivement ces conditions. En utilisant l'application Ourdeen, vous indiquez que vous comprenez, acceptez et consentez à être lié par ces conditions."),

              SizedBox(height: 20),

              // Admissibilité
              _buildSectionTitle("Admissibilité"),
              _buildParagraph(
                  "L'utilisation de l'application Ourdeen est ouverte aux personnes de tous âges. Cependant, si vous avez moins de 13 ans, vous devez avoir la permission d'un parent ou d'un tuteur légal pour utiliser l'application. En utilisant l'application, vous déclarez et garantissez que :"),
              _buildBulletPoint(
                  "Vous avez au moins 13 ans, ou vous utilisez l'application avec la permission d'un parent ou tuteur légal."),
              _buildBulletPoint("Vous avez la capacité de conclure un contrat juridiquement contraignant avec Ourdeen."),
              _buildBulletPoint(
                  "Vous n'êtes pas une personne à qui il est interdit d'utiliser l'application en vertu des lois de votre pays de résidence ou de tout autre pays applicable."),

              SizedBox(height: 20),

              // Compte utilisateur
              _buildSectionTitle("Compte utilisateur"),
              _buildParagraph(
                  "Pour utiliser certaines fonctionnalités de l'application, il peut vous être demandé de créer un compte. Vous êtes responsable de :"),
              _buildBulletPoint("Maintenir la confidentialité de votre mot de passe et de votre compte."),
              _buildBulletPoint("Restreindre l'accès à votre ordinateur, appareil et compte."),
              _buildBulletPoint(
                  "Assumer la responsabilité de toutes les activités qui se produisent sous votre compte ou via votre appareil."),
              _buildParagraph(
                  "Vous devez nous informer immédiatement de toute violation de sécurité ou utilisation non autorisée de votre compte. Ourdeen ne sera pas responsable des pertes résultant de toute utilisation non autorisée de votre compte."),

              SizedBox(height: 20),

              // Propriété intellectuelle
              _buildSectionTitle("Propriété intellectuelle"),
              _buildParagraph(
                  "L'application Ourdeen et son contenu original, fonctionnalités et fonctionnalités sont et resteront la propriété exclusive d'Ourdeen et de ses concédants de licence. L'application est protégée par le droit d'auteur, les marques de commerce et d'autres lois des pays où l'application est disponible."),
              _buildParagraph(
                  "Nos marques et notre habillage commercial ne peuvent pas être utilisés en relation avec un produit ou un service sans notre consentement écrit préalable."),

              SizedBox(height: 20),

              // Contenu fourni par l'utilisateur
              _buildSectionTitle("Contenu fourni par l'utilisateur"),
              _buildParagraph(
                  "Vous pouvez être amené à soumettre du contenu à l'application, tel que des favoris, des notes personnelles ou des commentaires. En soumettant du contenu, vous :"),
              _buildBulletPoint(
                  "Accordez à Ourdeen le droit d'utiliser, de reproduire, de modifier, d'adapter, de publier, de traduire, de créer des œuvres dérivées et de distribuer ce contenu dans le monde entier."),
              _buildBulletPoint("Reconnaissez que ce contenu est non confidentiel et non propriétaire."),
              _buildBulletPoint(
                  "Déclarez et garantissez que vous possédez ou contrôlez tous les droits sur le contenu que vous publiez, et que ce contenu est exact et ne violera pas ces conditions ni ne causera de préjudice à une personne ou entité."),

              SizedBox(height: 20),

              // Utilisation acceptable
              _buildSectionTitle("Utilisation acceptable"),
              _buildParagraph("Vous acceptez de ne pas utiliser l'application Ourdeen pour :"),
              _buildBulletPoint("Violer une loi, règle ou réglementation applicable."),
              _buildBulletPoint("Enfreindre ou violer nos droits de propriété intellectuelle ou ceux de tout tiers."),
              _buildBulletPoint(
                  "Harceler, abuser, insulter, nuire, diffamer, calomnier, dénigrer, intimider ou discriminer en fonction du genre, de l'orientation sexuelle, de la religion, de l'ethnicité, de la race, de l'âge, de l'origine nationale ou d'un handicap."),
              _buildBulletPoint("Soumettre des informations fausses ou trompeuses."),
              _buildBulletPoint("Télécharger ou transmettre des virus ou tout autre type de code malveillant."),
              _buildBulletPoint("Collecter ou suivre les informations personnelles d'autres utilisateurs."),
              _buildBulletPoint(
                  "Spammer, hameçonner, détourner un compte, scraper ou perturber le fonctionnement de l'application."),

              SizedBox(height: 20),

              // Limitation de responsabilité
              _buildSectionTitle("Limitation de responsabilité"),
              _buildParagraph(
                  "En aucun cas, Ourdeen, ses administrateurs, employés, partenaires, agents, fournisseurs ou affiliés ne seront responsables de tout dommage indirect, accessoire, spécial, consécutif ou punitif, y compris, sans limitation, la perte de profits, de données, d'utilisation, de bonne volonté, ou d'autres pertes intangibles, résultant de :"),
              _buildBulletPoint("Votre accès ou utilisation ou incapacité d'accéder ou d'utiliser l'application."),
              _buildBulletPoint("Toute conduite ou contenu d'un tiers sur l'application."),
              _buildBulletPoint("Tout contenu obtenu à partir de l'application."),
              _buildBulletPoint("Accès non autorisé, utilisation ou modification de vos transmissions ou contenu."),

              SizedBox(height: 20),

              // Clause de non-responsabilité
              _buildSectionTitle("Clause de non-responsabilité"),
              _buildParagraph(
                  "L'application Ourdeen est fournie \"telle quelle\" et \"selon disponibilité\" sans garantie d'aucune sorte, expresse ou implicite. Ourdeen ne garantit pas que le service sera ininterrompu, opportun, sécurisé ou sans erreur."),
              _buildParagraph(
                  "Les informations obtenues en utilisant l'application sont utilisées à vos propres risques. Ourdeen n'est pas responsable de l'exactitude, de l'exhaustivité ou de l'utilité des informations obtenues en utilisant l'application, y compris, mais sans s'y limiter, les horaires de prière, la direction de la Qibla ou le contenu religieux."),

              SizedBox(height: 20),

              // Résiliation
              _buildSectionTitle("Résiliation"),
              _buildParagraph(
                  "Nous pouvons résilier ou suspendre votre compte et l'accès à l'application immédiatement, sans préavis ni responsabilité, pour quelque raison que ce soit, y compris, sans limitation, si vous enfreignez les Conditions d'utilisation."),
              _buildParagraph(
                  "En cas de résiliation, votre droit d'utiliser l'application cessera immédiatement. Si vous souhaitez résilier votre compte, vous pouvez simplement cesser d'utiliser l'application ou nous contacter pour demander la suppression de votre compte."),

              SizedBox(height: 20),

              // Modification des conditions
              _buildSectionTitle("Modification des conditions"),
              _buildParagraph(
                  "Nous nous réservons le droit, à notre seule discrétion, de modifier ou de remplacer ces conditions à tout moment. Si une révision est importante, nous fournirons un préavis d'au moins 30 jours avant que les nouvelles conditions prennent effet."),
              _buildParagraph(
                  "En continuant à accéder ou à utiliser notre application après que ces révisions deviennent effectives, vous acceptez d'être lié par les conditions révisées. Si vous n'acceptez pas les nouvelles conditions, veuillez cesser d'utiliser l'application."),

              SizedBox(height: 20),

              // Loi applicable
              _buildSectionTitle("Loi applicable"),
              _buildParagraph(
                  "Ces conditions seront régies et interprétées conformément aux lois du pays dans lequel Ourdeen est établi, sans égard aux dispositions relatives aux conflits de lois."),
              _buildParagraph(
                  "Notre incapacité à faire respecter un droit ou une disposition de ces conditions ne sera pas considérée comme une renonciation à ces droits. Si une disposition de ces conditions est jugée invalide ou inapplicable par un tribunal, les dispositions restantes de ces conditions resteront en vigueur."),

              SizedBox(height: 20),

              // Contact
              _buildSectionTitle("Nous contacter"),
              _buildParagraph("Si vous avez des questions concernant ces Conditions d'utilisation, veuillez nous contacter à :"),
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
                          "terms@ourdeen.com",
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
                          "www.ourdeen.com/terms",
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
