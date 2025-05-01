import 'prayer_detail_screen.dart';
import '/constants/app_export.dart';
import '/constants/assets_path.dart';
import '/app/home/widgets/prayer_item_card.dart';

class PrayersListScreen extends StatelessWidget {
  PrayersListScreen({super.key});

  final List<Map<String, String>> prayerItems = [
    {
      'title': 'Préparez-vous',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, do...',
      'imagePath': AppImage.prayerPreparation,
    },
    {
      'title': 'Ablutions',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, do...',
      'imagePath': AppImage.prayerAblution,
    },
    {
      'title': 'Fajr',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, do...',
      'imagePath': AppImage.prayerFajr,
    },
    {
      'title': 'Dhuhr',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, do...',
      'imagePath': AppImage.prayerDhuhr,
    },
    {
      'title': 'Asr',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, do...',
      'imagePath': AppImage.prayerAsr,
    },
    {
      'title': 'Maghreb',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, do...',
      'imagePath': AppImage.prayerMaghreb,
    },
    {
      'title': 'Isha',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, do...',
      'imagePath': AppImage.prayerIsha,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Prières",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: AppFont.poppins,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 8, bottom: 16),
        itemCount: prayerItems.length,
        itemBuilder: (context, index) {
          final item = prayerItems[index];
          return PrayerItemCard(
            title: item['title']!,
            description: item['description']!,
            imagePath: item['imagePath']!,
          );
        },
      ),
    );
  }
}
