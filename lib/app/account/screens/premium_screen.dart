import '/constants/app_export.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
        appBar: AppBar(
          title: Text("Premium"),
        ),
        body: const Placeholder());
  }
}
