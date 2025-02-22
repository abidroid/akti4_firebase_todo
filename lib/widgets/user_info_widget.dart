
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          Text(title),
          Divider(),
          Text(value, style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
