import '../app_import/app_import.dart';

class RowText extends StatelessWidget {
  final String title;
  final String subTitle;

  const RowText({super.key, required this.title, required this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$title :",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          subTitle,
          style: const TextStyle(
              color: Colors.brown, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
