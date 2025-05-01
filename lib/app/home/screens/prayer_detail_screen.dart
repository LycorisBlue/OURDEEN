import '/constants/assets_path.dart';
import '/constants/app_export.dart';

class PrayerDetailScreen extends StatelessWidget {

   PrayerDetailScreen({
    super.key
  });

  final argements = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Prière",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: AppFont.poppins,
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: Container(
                  width: 280,
                  height: 280,
                  margin: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CustomImageView(
                      imagePath: argements["imagePath"] ,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  argements["title"]  ,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: AppFont.poppins,
                  ),
                ),
              ),

              SizedBox(height: 12),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        height: 1.6,
                        color: Colors.black87,
                        fontFamily: AppFont.poppins,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est labo.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        height: 1.6,
                        color: Colors.black87,
                        fontFamily: AppFont.poppins,
                      ),
                    ),
                    SizedBox(height: 30), // Extra space at the bottom for better scrolling
                  ],
                ),
              ),

              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 16),
              //   alignment: Alignment.center,
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       Container(
              //         width: 8,
              //         height: 8,
              //         decoration: BoxDecoration(
              //           color: AppColors.primaryColor,
              //           shape: BoxShape.circle,
              //         ),
              //       ),
              //       SizedBox(width: 6),
              //       Container(
              //         width: 8,
              //         height: 8,
              //         decoration: BoxDecoration(
              //           color: Colors.grey.shade300,
              //           shape: BoxShape.circle,
              //         ),
              //       ),
              //       SizedBox(width: 6),
              //       Container(
              //         width: 8,
              //         height: 8,
              //         decoration: BoxDecoration(
              //           color: Colors.grey.shade300,
              //           shape: BoxShape.circle,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
