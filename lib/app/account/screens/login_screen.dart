// lib/app/account/screens/login_screen.dart
import '/constants/app_export.dart';
import '/app/account/controllers/account_crontroller.dart';
import '/utils/helpers/validation_input.dart';
import '/constants/assets_path.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.find<AccountController>();
  final formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  // Logo et Image d'en-tête
                  Center(
                    child: Column(
                      children: [
                        CustomImageView(
                          imagePath: AppImage.logo,
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Ourdeen",
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                            fontFamily: AppFont.poppins,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Connectez-vous à votre compte",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.greyColor,
                            fontFamily: AppFont.poppins,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

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
                      decoration: InputDecoration(
                        hintText: "Entrez votre email",
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
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: "Entrez votre mot de passe",
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: AppColors.primaryColor,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                            color: AppColors.greyColor,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
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

                  // Mot de passe oublié
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Action mot de passe oublié
                      },
                      child: Text(
                        "Mot de passe oublié?",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppFont.poppins,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Bouton de connexion
                  Obx(() => Container(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : () {
                                  if (formKey.currentState!.validate()) {
                                    controller.login();
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: AppRadiusStyle.roundedBorder12,
                            ),
                            elevation: 5,
                          ),
                          child: controller.isLoading.value
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  'Se connecter',
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
                                    SizedBox(
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

                  // Lien vers la page d'inscription
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Vous n'avez pas de compte? ",
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 16.sp,
                            fontFamily: AppFont.poppins,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => MyNavigation.goToRegister(),
                          child: Text(
                            "S'inscrire",
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
