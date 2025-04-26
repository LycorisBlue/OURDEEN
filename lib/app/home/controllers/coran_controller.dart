import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:templateproject/data/models/sourate_traduction.dart';
import '/data/models/sourate.dart';
import '/data/models/coran.dart';
import '/constants/app_export.dart';
import '/configs/injectiondepency/injection.dart';
import '/data/repositories/coran_repository.dart';
import '/services/networks/apis/api_controller_operation.dart';

enum CoranEvent { initial, getTraduction, getTranslitteration }

class CoranController extends GetxController with ApiControllerOperationMixin {
  final coranResponse = sl<CoranRepository>();
  Rx<CoranEvent> coranEvent = CoranEvent.initial.obs;

  Rx<Corans>? corans;
  RxBool isLoadingGetSourate = true.obs;
  RxBool isLoadingGetSourateTraduction = true.obs;
  RxBool isLoadingGetSourateTranslitteration = true.obs;
  Sourate? currentSourate;
  Rx<SourateTraduction>? sourateTraduction;
  Rx<SourateTraduction>? sourateTranslitteration;

  // lire les sourates
  final AudioPlayer audioPlayer = AudioPlayer();
  final RxBool isPlaying = false.obs;
  final RxInt currentPlayingAyatIndex = (-1).obs;
  final RxDouble audioProgress = 0.0.obs;
  final RxDouble audioDuration = 0.0.obs;

  // detail sourate variables
  // Variables réactives
  var selectedTab = 'Arabe'.obs;
  var fontSize = 20.0.obs;
  var isFavorite = false.obs;

  @override
  void onInit() {
    super.onInit();
    getListSourate();
    _setupAudioProgressListener();
    ever(apiStatus, fireState);
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }

  // Méthode pour changer l'onglet sélectionné
  void changeTab(String tab) {
    selectedTab.value = tab;
  }

  // Méthode pour basculer l'état favori
  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void changeFontSize(double size) {
    fontSize.value = size;
  }

  void _setupAudioProgressListener() {
    audioPlayer.onPositionChanged.listen((Duration position) {
      audioProgress.value = position.inMilliseconds.toDouble();
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      audioDuration.value = duration.inMilliseconds.toDouble();
    });
  }

  // Cette méthode doit être appelée une seule fois par sourate
  void initWithSourate(Sourate sourate) {
    currentSourate = sourate;

    // Supprimez les anciens écouteurs pour éviter les doublons
    audioPlayer.onPlayerComplete.drain();

    // Ajoutez le nouvel écouteur
    audioPlayer.onPlayerComplete.listen((event) {
      print(
          "Audio terminé, lecture du prochain ayat. Index actuel: ${currentPlayingAyatIndex.value}");

      // Vérifier que la sourate existe toujours
      if (currentSourate == null) return;

      // Passer à l'ayat suivant
      if (currentPlayingAyatIndex.value < currentSourate!.ayahs.length - 1) {
        currentPlayingAyatIndex.value++;
        // print("Passage à l'ayat suivant: ${currentPlayingAyatIndex.value}");
        // _playCurrentAyat();
      } else {
        print("Fin de la sourate");
        stopAudio();
      }
    });
  }

  // Jouer l'audio pour un ayat spécifique  // Jouer l'audio pour un ayat spécifique
  Future<void> playAyat(int index, Sourate sourate) async {
    try {
      // Enregistrer/mettre à jour la sourate actuelle
      if (currentSourate != sourate) {
        currentSourate = sourate;
        initWithSourate(sourate);
      }

      // Si on joue déjà cet ayat, pause/resume
      if (currentPlayingAyatIndex.value == index) {
        if (isPlaying.value) {
          await audioPlayer.pause();
          isPlaying.value = false;
        } else {
          await audioPlayer.resume();
          isPlaying.value = true;
        }
        return;
      }

      // Sinon, arrêter l'audio actuel et jouer le nouveau
      await stopAudio();
      currentPlayingAyatIndex.value = index;
      await _playCurrentAyat();
    } catch (e) {
      print('Erreur de lecture: $e');
    }
  }

  // Joue l'audio de l'ayat actuel (sans paramètre, utilise currentSourate)
  Future<void> _playCurrentAyat() async {
    if (currentSourate == null) return;

    if (currentPlayingAyatIndex.value < 0 ||
        currentPlayingAyatIndex.value >= currentSourate!.ayahs.length) {
      print("Index d'ayat invalide: ${currentPlayingAyatIndex.value}");
      return;
    }

    final ayat = currentSourate!.ayahs[currentPlayingAyatIndex.value];
    final audioUrl = ayat.audio!;

    print("Lecture de l'audio: $audioUrl");

    try {
      // await audioPlayer.play(UrlSource(audioUrl));
      await audioPlayer.play(UrlSource(audioUrl)).timeout(
        Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException(
              "Le chargement de l’audio a dépassé 10 secondes");
        },
      );
      isPlaying.value = true;
    } catch (e) {
      print('Erreur de lecture 11: $e');
      isPlaying.value = false;
    }
  }

  // Arrêter la lecture audio
  Future<void> stopAudio() async {
    await audioPlayer.stop();
    isPlaying.value = false;
    audioProgress.value = 0;
  }

  void getListSourate() {
    coranEvent = CoranEvent.initial.obs;
    requestBaseController(coranResponse.getCoran());
  }

  void getTraductionSourate() {
    coranEvent = CoranEvent.getTraduction.obs;
    requestBaseController(coranResponse.getTraductionSourate(currentSourate!.number));
  }

  void getTranslitterationSourate() {
    coranEvent = CoranEvent.getTranslitteration.obs;
    requestBaseController(coranResponse.getTranslitterationSourate(currentSourate!.number));
  }

  mapEventToState(CoranEvent event, ApiState state) {
    switch (event) {
      case CoranEvent.initial:
        switch (state) {
          case ApiState.loading:
            isLoadingGetSourate.value = true;
            break;

          case ApiState.success:
            isLoadingGetSourate.value = false;
            if (kDebugMode) {
              // print("========ca marche=======");
              // print("data: $dataResponse");
            }
            corans = coransFromJson(json.encode(dataResponse)).obs;
            break;
          case ApiState.failure:
            isLoadingGetSourate.value = false;
            break;
        }
        break;

      case CoranEvent.getTraduction:
        switch (state) {
          case ApiState.loading:
            isLoadingGetSourateTraduction.value = true;
            break;

          case ApiState.success:
            isLoadingGetSourateTraduction.value = false;
            sourateTraduction =
                sourateTraductionFromJson(json.encode(dataResponse)).obs;

            coranEvent.value = CoranEvent.getTranslitteration;
            getTranslitterationSourate();

            break;
          case ApiState.failure:
            isLoadingGetSourateTraduction.value = false;
            break;
        }
        break;

      case CoranEvent.getTranslitteration:
        switch (state) {
          case ApiState.loading:
            isLoadingGetSourateTranslitteration.value = true;
            break;

          case ApiState.success:
            isLoadingGetSourateTranslitteration.value = false;
            sourateTranslitteration =
                sourateTraductionFromJson(json.encode(dataResponse)).obs;
            break;
          case ApiState.failure:
            isLoadingGetSourateTranslitteration.value = false;
            break;
        }
        break;

      default:
    }
  }

  fireState(ApiState coranApiState) {
    mapEventToState(coranEvent.value, coranApiState);
  }
}
