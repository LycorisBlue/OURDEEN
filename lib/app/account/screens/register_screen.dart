// lib/app/account/screens/register_screen.dart
import 'package:our_deen/configs/routes/page_name.dart';

import '/constants/app_export.dart';
import '/app/account/controllers/account_crontroller.dart';
import '/utils/helpers/validation_input.dart';
import '/constants/assets_path.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controller = Get.find<AccountController>();
  final formKey = GlobalKey<FormState>();

  // Contrôleurs pour les champs de texte
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Pour le sélecteur de genre
  String selectedGender = 'M'; // M pour Masculin par défaut

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // Logo et en-tête
                  Center(
                    child: Column(
                      children: [
                        CustomImageView(
                          imagePath: AppImage.logo,
                          height: 80,
                          width: 80,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Créer un compte",
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                            fontFamily: AppFont.poppins,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Rejoignez la communauté Ourdeen",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.greyColor,
                            fontFamily: AppFont.poppins,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Champ Nom
                  Text(
                    "Nom complet",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                      fontFamily: AppFont.poppins,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: AppRadiusStyle.roundedBorder12,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Entrez votre nom complet",
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: AppColors.primaryColor,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                      ),
                      validator: (value) => ValidationInput.validatorName(
                        value,
                        isRequired: true,
                      ),
                      onChanged: (value) {
                        controller.name.value = value;
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Nouveau - Champ Numéro de téléphone
                  Text(
                    "Numéro de téléphone",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                      fontFamily: AppFont.poppins,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: AppRadiusStyle.roundedBorder12,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Entrez votre numéro de téléphone",
                        prefixIcon: Icon(
                          Icons.phone_outlined,
                          color: AppColors.primaryColor,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez entrer votre numéro de téléphone";
                        }
                        if (!RegExp(r'^\d{8,15}$').hasMatch(value)) {
                          return "Numéro de téléphone invalide";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        controller.phone.value = value;
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Champ Email
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                      fontFamily: AppFont.poppins,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: AppRadiusStyle.roundedBorder12,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Entrez votre adresse email",
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: AppColors.primaryColor,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                      ),
                      validator: (value) => ValidationInput.validatorEmail(
                        value,
                        isRequired: true,
                      ),
                      onChanged: (value) {
                        controller.email.value = value;
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Nouveau - Sélection du genre
                  Text(
                    "Genre",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                      fontFamily: AppFont.poppins,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: AppRadiusStyle.roundedBorder12,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Option Masculin
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text(
                              "Masculin",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.blackColor,
                                fontFamily: AppFont.poppins,
                              ),
                            ),
                            value: 'M',
                            groupValue: selectedGender,
                            activeColor: AppColors.primaryColor,
                            contentPadding: EdgeInsets.zero,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value!;
                                controller.genre.value = value;
                              });
                            },
                          ),
                        ),
                        // Option Féminin
                        Expanded(
                          child: RadioListTile<String>(
                            title: Text(
                              "Féminin",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.blackColor,
                                fontFamily: AppFont.poppins,
                              ),
                            ),
                            value: 'F',
                            groupValue: selectedGender,
                            activeColor: AppColors.primaryColor,
                            contentPadding: EdgeInsets.zero,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value!;
                                controller.genre.value = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Champ Mot de passe
                  Text(
                    "Mot de passe",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                      fontFamily: AppFont.poppins,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: AppRadiusStyle.roundedBorder12,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Créez un mot de passe",
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: AppColors.primaryColor,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                      ),
                      validator: ValidationInput.validatorMotDePasse,
                      onChanged: (value) {
                        controller.password.value = value;
                      },
                    ),
                  ),

                  const SizedBox(height: 8),
                  Text(
                    "Le mot de passe doit contenir au moins 6 caractères, une lettre et un chiffre",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.greyColor,
                      fontStyle: FontStyle.italic,
                      fontFamily: AppFont.poppins,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Champ Confirmer mot de passe
                  Text(
                    "Confirmer le mot de passe",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                      fontFamily: AppFont.poppins,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: AppRadiusStyle.roundedBorder12,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Confirmez votre mot de passe",
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: AppColors.primaryColor,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                      ),
                      validator: (value) {
                        if (value != passwordController.text) {
                          return "Les mots de passe ne correspondent pas";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        controller.confirmPassword.value = value;
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Acceptation des conditions
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          child: Checkbox(
                            value: controller.acceptTerms.value,
                            activeColor: AppColors.primaryColor,
                            onChanged: (bool? value) {
                              setState(() {
                                controller.acceptTerms.value = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Wrap(
                            children: [
                              Text(
                                "J'accepte les ",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.blackColor,
                                  fontFamily: AppFont.poppins,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  MyNavigation.goToTermsOfService();
                                },
                                child: Text(
                                  "conditions d'utilisation",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppFont.poppins,
                                  ),
                                ),
                              ),
                              Text(
                                " et la ",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.blackColor,
                                  fontFamily: AppFont.poppins,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  MyNavigation.goToPrivacyPolicy();
                                },
                                child: Text(
                                  "politique de confidentialité",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppFont.poppins,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Bouton d'inscription
                  Obx(() => Container(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: (!controller.acceptTerms.value || controller.isLoading.value)
                              ? null
                              : () {
                                  if (formKey.currentState!.validate()) {
                                    controller.signUp();
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: AppRadiusStyle.roundedBorder12,
                            ),
                            elevation: 5,
                            disabledBackgroundColor: AppColors.greyColor,
                          ),
                          child: controller.isLoading.value
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  'Créer un compte',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: AppFont.poppins,
                                  ),
                                ),
                        ),
                      )),

                  const SizedBox(height: 30),

                  // Séparateur OU
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.greyColor.withOpacity(0.5),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "OU",
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFont.poppins,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.greyColor.withOpacity(0.5),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Bouton Google
                  Obx(() => Container(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: controller.isGoogleSignIn.value
                              ? null
                              : () {
                                  controller.signInWithGoogle();
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: AppRadiusStyle.roundedBorder12,
                              side: BorderSide(
                                color: AppColors.greyColor.withOpacity(0.3),
                              ),
                            ),
                            elevation: 2,
                          ),
                          child: controller.isGoogleSignIn.value
                              ? CircularProgressIndicator(color: AppColors.primaryColor)
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 24,
                                      width: 24,
                                      child: Image.network(
                                        'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Continuer avec Google',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                        fontFamily: AppFont.poppins,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      )),

                  const SizedBox(height: 30),

                  // Lien vers la page de connexion
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Vous avez déjà un compte? ",
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 16.sp,
                            fontFamily: AppFont.poppins,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed(MyRoutes.login),
                          child: Text(
                            "Se connecter",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppFont.poppins,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
