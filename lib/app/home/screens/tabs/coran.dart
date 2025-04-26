import 'package:shimmer/shimmer.dart';
import '/data/models/sourate.dart';
import '/services/networks/apis/api_controller_operation.dart';
import '/app/home/controllers/coran_controller.dart';
import '/constants/app_export.dart';
import '/constants/assets_path.dart';

class CoranTab extends StatelessWidget {
  CoranTab({super.key});

  final controller = Get.find<CoranController>();

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                hintText: 'Recherche',
                prefix: const CustomImageView(
                  svgPath: AppIcon.iconSearch,
                  margin:
                      EdgeInsets.only(left: 16, top: 4, bottom: 4, right: 8),
                ),
                shape: TextFormFieldShape.RoundedBorder12,
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryButton('Sourate', true),
                    const SizedBox(width: 12),
                    _buildCategoryButton('Quiz', false),
                    const SizedBox(width: 12),
                    _buildCategoryButton('Verset du jour', false),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Coran",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: AppRadiusStyle.roundedBorder20Top,
                    border: Border(
                      bottom: BorderSide(color: AppColors.greyColor, width: 1),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.4),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Obx(
                    () => controller.apiStatus.value == ApiState.loading &&
                            controller.isLoadingGetSourate.value
                        ? ListView.builder(
                            itemCount: 6,
                            itemBuilder: (context, index) =>
                                _buildSurahItemShimmer(),
                          )
                        : ListView.builder(
                            itemCount: controller
                                .corans!.value.sourates.listeSourates.length,
                            itemBuilder: (context, index) => _buildSurahItem(
                                controller.corans!.value.sourates
                                    .listeSourates[index]),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String text, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? AppColors.secondaryColor : AppColors.whiteColor,
        borderRadius: AppRadiusStyle.roundedBorder12,
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isActive ? AppColors.whiteColor : AppColors.blackColor,
            fontSize: 16.sp,
            fontFamily: AppFont.inter,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildSurahItem(Sourate item) {
    return GestureDetector(
      onTap: () {
        controller.currentSourate = item;
        controller.getTraductionSourate();
        MyNavigation.goToDetailCoran(item);
      },
      child: Container(
        padding: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.greyColor, width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Utils.getFrenchName(item.englishNameTranslation),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        Utils.decodeUnicodeToArabic(item.name),
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppFont.arabeV1),
                      ),
                      Text(
                        "  - ${item.ayahs.length} versets",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: AppRadiusStyle.roundedBorder8),
                  child: Center(
                    child: Text(
                      "Lire",
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16.sp,
                          fontFamily: AppFont.inter,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSurahItemShimmer() {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Texte
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 16,
                    width: 150,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        height: 14,
                        width: 80,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 14,
                        width: 60,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
              // Bouton
              Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
