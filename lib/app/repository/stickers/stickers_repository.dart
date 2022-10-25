import 'package:fwc_album_app/app/models/group_stickers.dart';

import '../../models/register_sticker_model.dart';
import '../../models/sticker_model.dart';

abstract class StickersRepository {
  Future<List<GroupStickers>> getMyAlbum();
  Future<StickerModel?> findStickerByCode(
      String stickerCode, String stickerNumber);
  Future<StickerModel> create(RegisterStickerModel registerStickerModel);
}
