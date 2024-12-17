import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final String routeName;
  final IconData iconData;
  const SettingItem(
      {super.key,
      required this.title,
      required this.routeName,
      required this.iconData});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: ListTile(
        leading: Icon(iconData),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
