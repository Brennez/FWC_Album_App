import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/pages/my_stickers/widgets/sticker_group.dart';
import 'package:fwc_album_app/app/pages/my_stickers/widgets/sticker_group_filter.dart';
import 'package:fwc_album_app/app/pages/my_stickers/widgets/sticker_status_filter.dart';

class MyStickerPage extends StatelessWidget {
  const MyStickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas figurinhas'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Status
                StickerStatusFilter(filterSelected: ''),
                // Filter
                StickerGroupFilter(),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return StickerGroup();
            },
            childCount: 10,
          ))
        ],
      ),
    );
  }
}
