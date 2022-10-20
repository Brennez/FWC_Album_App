import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class StatusTile extends StatelessWidget {
  const StatusTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.number});

  final Image icon;
  final String title;
  final int number;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .70,
      child: ListTile(
        leading: CircleAvatar(
          radius: 46,
          backgroundColor: context.colors.grey,
          child: icon,
        ),
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: context.textStyles.textPrimaryFontRegular.copyWith(
            color: Colors.white,
          ),
        ),
        trailing: Text(
          '$number',
          style: context.textStyles.textPrimaryFontMedium.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
