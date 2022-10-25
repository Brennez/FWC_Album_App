import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/models/group_stickers.dart';
import 'package:fwc_album_app/app/models/user_stick_model.dart';

class StickerGroup extends StatelessWidget {
  final GroupStickers group;
  final String statusFilter;

  const StickerGroup({
    super.key,
    required this.group,
    required this.statusFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 64,
            child: OverflowBox(
              maxHeight: double.infinity,
              maxWidth: double.infinity,
              child: ClipRect(
                child: Align(
                  alignment: const Alignment(0, -0.1),
                  widthFactor: 1,
                  heightFactor: 0.1,
                  child: Image.network(
                    group.flag,
                    cacheWidth: (MediaQuery.of(context).size.width * 3).toInt(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              group.countryName,
              style: context.textStyles.titleBlack.copyWith(
                fontSize: 26,
              ),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: ((context, index) {
              final stickNumber = '${group.stickerStart + index}';

              final stickerList = group.stickers
                  .where((sticker) => sticker.stickerNumber == stickNumber);

              final sticker = stickerList.isNotEmpty ? stickerList.first : null;

              final countryName = group.countryName;
              final countryCode = group.countryCode;

              final stickerWidget = Sticker(
                stickerNumber: stickNumber,
                sticker: sticker,
                countryName: countryName,
                countryCode: countryCode,
              );

              if (statusFilter == 'all') {
                return stickerWidget;
              } else if (statusFilter == 'missing') {
                if (sticker == null) {
                  return stickerWidget;
                }
              } else if (statusFilter == 'repeated') {
                if (sticker != null && sticker.duplicate > 0) {
                  return stickerWidget;
                }
              }
              return SizedBox.shrink();
            }),
          )
        ],
      ),
    );
  }
}

class Sticker extends StatelessWidget {
  //
  final UserStickModel? sticker;
  final String stickerNumber;
  final String countryName;
  final String countryCode;

  const Sticker({
    super.key,
    required this.stickerNumber,
    required this.sticker,
    required this.countryName,
    required this.countryCode,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/sticker-detail', arguments: {
          'countryCode': countryCode,
          'stickerNumber': stickerNumber,
          'countryName': countryName,
          'stickerUser': sticker,
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: sticker != null ? context.colors.primary : context.colors.grey,
        ),
        child: Column(
          children: [
            Visibility(
              visible: (sticker?.duplicate ?? 0) > 0,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                padding: const EdgeInsets.all(2),
                alignment: Alignment.topRight,
                child: Text(
                  sticker?.duplicate.toString() ?? '',
                  style: context.textStyles.textSecondaryFontMedium.copyWith(
                    color: context.colors.yellow,
                  ),
                ),
              ),
            ),
            Text(
              countryCode,
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                color: sticker != null ? Colors.white : Colors.black,
              ),
            ),
            Text(
              stickerNumber,
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                color: sticker != null ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
