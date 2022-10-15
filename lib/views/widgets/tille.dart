import 'package:flutter/material.dart';

import '../../data.dart';

class AppTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final IconData ? icon2;
  final void Function()? onTap;
  const AppTile({Key? key, required this.text, required this.icon, this.onTap, this.icon2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        
        onTap: onTap,
        leading: Icon(icon),
        trailing: Icon(icon2),
          title: Text(
        text,
      )),
    );
  }
}
