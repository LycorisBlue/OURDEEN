import '/constants/app_export.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
        appBar: AppBar(
          title: Text("Language"),
        ),
        body: const Placeholder());
  }
}
