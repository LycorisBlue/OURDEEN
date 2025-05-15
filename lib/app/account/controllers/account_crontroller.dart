import 'package:flutter/foundation.dart';
import 'package:our_deen/configs/routes/page_name.dart';
import 'package:our_deen/constants/app_export.dart';
import '/configs/injectiondepency/injection.dart';
import '/data/models/user.dart';
import '/data/repositories/auth_repository.dart';
import '/services/networks/apis/api_controller_operation.dart';

enum LoginState { loginInitial, authenticated, disconnect }

enum LoginEvent { verification, logoutClicked }

class AccountController extends GetxController with ApiControllerOperationMixin {
  final authUserResponse = sl<AuthRepository>();
  Rx<LoginEvent> loginEvent = LoginEvent.verification.obs;

  Rx<String> email = "".obs;
  Rx<String> password = "".obs;

  // pour l'inscription
  Rx<String> name = "".obs;
  Rx<String> confirmPassword = "".obs;
  RxBool isLoading = false.obs;
  RxBool isGoogleSignIn = false.obs;
  Rx<String> phone = "".obs;
  Rx<String> genre = "M".obs; // "M" pour masculin par défaut
  RxBool acceptTerms = false.obs; // Pour l'acceptation des conditions

  Rx<UserAccount>? userAccount;

  @override
  void onInit() {
    super.onInit();
    ever(apiStatus, fireState);
  }

  void login() {
    if (kDebugMode) {
      print(email.value);
      print(password.value);
    }

    requestBaseController(authUserResponse.login(email.value, password.value));
  }

void signUp() {
    if (kDebugMode) {
      print("Sign up with name: ${name.value}");
      print("Email: ${email.value}");
      print("Phone: ${phone.value}");
      print("Gender: ${genre.value}");
      print("Password: ${password.value}");
    }

    if (!acceptTerms.value) {
      Get.snackbar(
        "Erreur",
        "Vous devez accepter les conditions d'utilisation et la politique de confidentialité",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;
    loginEvent.value = LoginEvent.verification;

    // Appeler le repository pour l'inscription avec les nouveaux paramètres
    requestBaseController(authUserResponse.signUp(
      name.value,
      "", // lastname (si nécessaire, sinon laisser vide)
      email.value,
      phone.value, // Numéro de téléphone
      "", // token (si nécessaire, sinon laisser vide)
    ));
  }

  void signInWithGoogle() {
    if (kDebugMode) {
      print("Sign in with Google");
    }

    isLoading.value = true;
    isGoogleSignIn.value = true;

    // Simuler une connexion réussie pour l'instant
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
      isGoogleSignIn.value = false;
      Get.offAllNamed(MyRoutes.initial); // Rediriger vers la page d'accueil
      Get.snackbar(
        "Succès",
        "Vous êtes connecté avec Google",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.primaryColor,
        colorText: Colors.white,
      );
    });

    // Note: l'implémentation réelle de l'authentification Google nécessiterait
    // d'autres configurations et dépendances
  }

  mapEventToState(LoginEvent event, ApiState state) {
    switch (event) {
      case LoginEvent.verification:
        switch (state) {
          case ApiState.loading:
            isLoading.value = true;
            break;

          case ApiState.success:
            isLoading.value = false;
            if (kDebugMode) {
              print("========ca marche=======");
              print("data: $dataResponse");
            }

            // je redirige vers la page d'accueil après une inscription/connexion réussie
            Get.offAllNamed(MyRoutes.initial);
            Get.snackbar(
              "Succès",
              "Inscription réussie",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.primaryColor,
              colorText: Colors.white,
            );
            break;

          case ApiState.failure:
            isLoading.value = false;
            Get.snackbar(
              "Erreur",
              errorMessage.value,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
            break;

          default:
            isLoading.value = false;
        }
        break;

      case LoginEvent.logoutClicked:
        // Code pour la déconnexion
        break;

      default:
        break;
    }
  }

  fireState(ApiState loginApiState) {
    mapEventToState(loginEvent.value, loginApiState);
  }
}
