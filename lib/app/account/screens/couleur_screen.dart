import '/constants/app_export.dart';

class CouleurScreen extends StatelessWidget {
  const CouleurScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
        appBar: AppBar(
          title: Text("Couleurs"),
        ),
        body: const Placeholder());
  }
}
