import 'package:fwc_album_app/app/models/group_stickers.dart';

abstract class StickersRepository {
  Future<List<GroupStickers>> getMyAlbum();
}