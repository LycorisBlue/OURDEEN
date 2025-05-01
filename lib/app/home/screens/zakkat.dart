import '/constants/app_export.dart';

class ZakkatScreen extends StatelessWidget {
  const ZakkatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
        appBar: AppBar(
          title: Text("Zakkat"),
        ),
        body: const Placeholder());
  }
}
