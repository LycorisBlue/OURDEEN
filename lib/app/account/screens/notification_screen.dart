import '/constants/app_export.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
        appBar: AppBar(
          title: Text("Notification"),
        ),
        body: const Placeholder());
  }
}
