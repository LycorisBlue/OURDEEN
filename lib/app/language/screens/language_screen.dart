import '/app/language/controllers/language_crontroller.dart';
import '/constants/app_export.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({super.key});

  final controller = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text(
          'Select Language'.tr,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListView.builder(
          itemCount: controller.languages.length,
          itemBuilder: (context, index) {
            final language = controller.languages[index];
            return Obx(() => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: controller.selectedLanguage == language['value']
                            ? AppColors.primaryColor
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        controller.selectLanguage(language['value']!);
                      },
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4.0),
                        leading: CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          radius: 20,
                          child: CustomImageView(
                            svgPath: language['flag']!,
                            height: 20,
                            width: 20,
                          ),
                        ),
                        title: Text(
                          language['name']!.tr,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing:
                            controller.selectedLanguage == language['value']
                                ? const Icon(
                                    Icons.check_circle,
                                    color: AppColors.primaryColor,
                                  )
                                : const Icon(
                                    Icons.radio_button_unchecked,
                                    color: Colors.grey,
                                  ),
                      ),
                    ),
                  ),
                ));
          },
        ),
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: controller.selectedLanguage != null
                  ? AppColors.primaryColor
                  : Colors.grey,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: controller.selectedLanguage != null
                ? () {
                    // Handle language selection
                    Get.snackbar(
                      'Language Selected',
                      'You selected ${controller.selectedLanguage}',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    // Add your navigation or further logic here
                  }
                : null,
            child: Text(
              'Save'.tr,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
